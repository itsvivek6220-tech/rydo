import 'package:flutter/material.dart';

class EarningPage extends StatelessWidget {
  const EarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earnings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Today"),
                trailing: Text("₹500"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.date_range),
                title: Text("This Week"),
                trailing: Text("₹3200"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text("This Month"),
                trailing: Text("₹12000"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}