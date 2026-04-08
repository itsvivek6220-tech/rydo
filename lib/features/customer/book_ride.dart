import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookRideScreen extends StatefulWidget {
  const BookRideScreen({super.key});

  @override
  State<BookRideScreen> createState() => _BookRideScreenState();
}

class _BookRideScreenState extends State<BookRideScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  bool _isLoading = false;

  final user = FirebaseAuth.instance.currentUser;

  void _bookRide() async {
    if (_fromController.text.isEmpty || _toController.text.isEmpty) return;

    setState(() { _isLoading = true; });

    await FirebaseFirestore.instance.collection('rides').add({
      'userId': user!.uid,
      'from': _fromController.text.trim(),
      'to': _toController.text.trim(),
      'status': 'pending',
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() { _isLoading = false; });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ride Booked")));
    _fromController.clear();
    _toController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Ride")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _fromController, decoration: const InputDecoration(labelText: "From")),
            TextField(controller: _toController, decoration: const InputDecoration(labelText: "To")),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _bookRide, child: const Text("Book")),
          ],
        ),
      ),
    );
  }
}