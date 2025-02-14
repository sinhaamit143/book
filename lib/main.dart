import 'package:flutter/material.dart';
import 'utils/audio_manager.dart'; // Import AudioManager
import 'loading_screen.dart'; // Your first screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AudioManager and load saved states
  await AudioManager().initialize(); // Call the public initialize method

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observe app lifecycle

    // Start music if enabled
    if (AudioManager().isMusicEnabled()) {
      AudioManager().playBackgroundMusic();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    super.dispose();
  }

  // ✅ Handle app lifecycle changes globally
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is in the background → Stop music
      AudioManager().stopMusic();
    } else if (state == AppLifecycleState.resumed) {
      // App comes back to foreground → Resume music if enabled
      if (AudioManager().isMusicEnabled()) {
        AudioManager().playBackgroundMusic();
      }
    }
  }

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