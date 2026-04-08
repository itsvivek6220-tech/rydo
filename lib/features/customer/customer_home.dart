import 'package:flutter/material.dart';
import 'customer_profile.dart';
import 'book_ride.dart';
import 'my_booking.dart';
import 'chat.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Panel")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BookRideScreen()));
            },
            child: const Text("Book Ride"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyBookingScreen()));
            },
            child: const Text("My Booking"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
            },
            child: const Text("Chat & Message"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CustomerProfile()));
            },
            child: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}