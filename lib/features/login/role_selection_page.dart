import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => goToPage(context, const CustomerHome()),
            child: const Text("Customer"),
          ),
          ElevatedButton(
            onPressed: () => goToPage(context, const DriverHome()),
            child: const Text("Driver"),
          ),
          ElevatedButton(
            onPressed: () => goToPage(context, const LabourHome()),
            child: const Text("Labour"),
          ),
        ],
      ),
    );
  }
}