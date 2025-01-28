import 'package:flutter/material.dart';
import 'loading_screen.dart'; // Ensure this imports your loading_screen.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Simplified using super parameters

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: LoadingScreen(),
    );
  }
}