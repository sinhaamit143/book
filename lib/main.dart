import 'package:flutter/material.dart';
import 'utils/audio_manager.dart'; // Import AudioManager
import 'loading_screen.dart'; // Your first screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AudioManager().playBackgroundMusic();  // Start playing background music
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const LoadingScreen(),
    );
  }
}
