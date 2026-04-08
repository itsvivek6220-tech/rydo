// file: customer_profile.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  final _nameController = TextEditingController();
  final _charController = TextEditingController();
  File? _image;
  bool _isLoading = false;

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    final doc = await FirebaseFirestore.instance
        .collection('customers')
        .doc(user!.uid)
        .get();

    if (doc.exists) {
      _nameController.text = doc['name'] ?? '';
      _charController.text = doc['character'] ?? '';
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() { _image = File(picked.path); });
    }
  }

  Future<void> _saveProfile() async {
    setState(() { _isLoading = true; });

    String? imageUrl;
    if (_image != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images/${user!.uid}.jpg');
      await ref.putFile(_image!);
      imageUrl = await ref.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection('customers').doc(user!.uid).set({
      'name': _nameController.text.trim(),
      'character': _charController.text.trim(),
      'photo': imageUrl ?? '',
    }, SetOptions(merge: true));

    setState(() { _isLoading = false; });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    _image != null ? FileImage(_image!) : null,
                child: _image == null ? const Icon(Icons.person, size: 50) : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: _charController, decoration: const InputDecoration(labelText: "Character")),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _saveProfile, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}