import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'features/auth/login_page.dart';
import 'features/auth/role_selection_page.dart';
import 'features/labour/labour_register.dart';
import 'features/labour/labour_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rydo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      routes: {
        '/login': (context) => LoginPage(),
        '/role': (context) => RoleSelectionPage(), // ✅ ADD
        '/labour-home': (context) => LabourHomePage(),
        '/labour-register': (context) => LabourRegisterPage(),
      },

      home: LoginPage(), // ✅ START from login
    );
  }
} 