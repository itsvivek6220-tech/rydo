import 'package:flutter/material.dart';
import '../ai/ai_chat_page.dart';
import '../customer/customer_home.dart';
import '../driver/driver_home.dart';
import '../labour/labour_home.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  void goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Widget buildButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
      appBar: AppBar(title: const Text("Select Role")),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(context, "Customer", CustomerHome()),
                buildButton(context, "Driver", DriverHome()),
                buildButton(context, "Labour", LabourHomePage()), // ✅ FIX
              ],
            ),
          ),

          // 🤖 AI Button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black,
              child: const Icon(Icons.smart_toy, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AiChatPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}