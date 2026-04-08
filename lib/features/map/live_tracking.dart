import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LiveTracking extends StatefulWidget {
  final String driverId; // driver ka unique id
  const LiveTracking({super.key, required this.driverId});

  @override
  _LiveTrackingState createState() => _LiveTrackingState();
}

class _LiveTrackingState extends State<LiveTracking> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      setState(() => _currentPosition = position);
      _updateLocationToFirebase(position);
    });
  }

  Future<void> _updateLocationToFirebase(Position position) async {
    await FirebaseFirestore.instance
        .collection('drivers')
        .doc(widget.driverId)
        .set({
      'lat': position.latitude,
      'lng': position.longitude,
      'lastUpdated': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Tracking")),
      body: Center(
        child: _currentPosition == null
            ? const CircularProgressIndicator()
            : Text(
                "Lat: ${_currentPosition!.latitude}, Lng: ${_currentPosition!.longitude}"),
      ),
    );
  }
}