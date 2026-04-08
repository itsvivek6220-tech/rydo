import 'package:flutter/material.dart';
import 'driver_profile.dart';
import 'earning_page.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  void goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Widget buildButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => goToPage(context, page),
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Panel"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome Driver 🚗",
            style: TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 30),

          buildButton(context, "👤 Profile", const DriverProfilePage()),
          buildButton(context, "💰 Earnings", const EarningPage()),

        ],
      ),
    );
  }
}