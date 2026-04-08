import 'package:flutter/material.dart';
import 'labour_service.dart';
import 'labour_model.dart';
import 'package:uuid/uuid.dart';

class LabourRegisterPage extends StatefulWidget {
  const LabourRegisterPage({super.key});

  @override
  State<LabourRegisterPage> createState() => _LabourRegisterPageState();
}

class _LabourRegisterPageState extends State<LabourRegisterPage> {
  final nameController = TextEditingController();
  final skillController = TextEditingController();
  final expController = TextEditingController();
  final locationController = TextEditingController();

  final LabourService _service = LabourService();

  void registerLabour() async {
    final labour = Labour(
      id: const Uuid().v4(),
      name: nameController.text,
      phone: "demo_phone", // later auth se aayega
      skill: skillController.text,
      experience: int.parse(expController.text),
      location: locationController.text,
    );

    await _service.addLabour(labour);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Labour Added")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Labour")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: skillController, decoration: const InputDecoration(labelText: "Skill")),
            TextField(controller: expController, decoration: const InputDecoration(labelText: "Experience")),
            TextField(controller: locationController, decoration: const InputDecoration(labelText: "Location")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerLabour,
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}