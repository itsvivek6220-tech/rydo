import 'package:flutter/material.dart';

class LabourHomePage extends StatelessWidget {
  const LabourHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Labour Panel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Register Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/labour-register');
              },
              child: const Text("➕ Register Labour"),
            ),

            const SizedBox(height: 20),

            // View List Button
            ElevatedButton(
              onPressed: () {
                // next step me banayenge
              },
              child: const Text("📋 View Labour List"),
            ),

          ],
        ),
      ),
    );
  }
}