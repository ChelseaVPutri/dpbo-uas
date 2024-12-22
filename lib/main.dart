import 'package:dpbo/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Pastikan ini ditambahkan
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: LoginScreen(),
    );
  }
}