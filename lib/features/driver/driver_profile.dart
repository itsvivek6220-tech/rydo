import 'package:flutter/material.dart';

class DriverProfilePage extends StatefulWidget {
  const DriverProfilePage({super.key});

  @override
  State<DriverProfilePage> createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleController = TextEditingController();

  void saveProfile() {
    String name = nameController.text;
    String phone = phoneController.text;
    String vehicle = vehicleController.text;

    // 👉 abhi ke liye print kar rahe
    print("Name: $name");
    print("Phone: $phone");
    print("Vehicle: $vehicle");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved ✅")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: vehicleController,
              decoration: const InputDecoration(labelText: "Vehicle"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProfile,
              child: const Text("Save Profile"),
            )
          ],
        ),
      ),
    );
  }
}