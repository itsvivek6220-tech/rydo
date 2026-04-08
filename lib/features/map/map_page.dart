import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _driverMarkers = {};

  @override
  void initState() {
    super.initState();
    requestLocationPermission(); // 🔥 permission
    _listenDriverLocations();   // 🔥 firestore
  }

  // 🔥 LOCATION PERMISSION FUNCTION
  Future<void> requestLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permanently denied");
    }
  }

  // 🔥 FIRESTORE LISTENER
  void _listenDriverLocations() {
    FirebaseFirestore.instance
        .collection('drivers')
        .snapshots()
        .listen((snapshot) {
      final Map<String, Marker> newMarkers = {};

      for (final doc in snapshot.docs) {
        final data = doc.data();

        if (data.containsKey('lat') && data.containsKey('lng')) {
          final marker = Marker(
            markerId: MarkerId(doc.id),
            position: LatLng(data['lat'], data['lng']),
            infoWindow: InfoWindow(title: "Driver ${doc.id}"),
          );

          newMarkers[doc.id] = marker;
        }
      }

      setState(() {
        _driverMarkers.clear();
        _driverMarkers.addAll(newMarkers);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Map 🚗")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(26.8467, 80.9462), // Lucknow
          zoom: 14,
        ),
        markers: _driverMarkers.values.toSet(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}