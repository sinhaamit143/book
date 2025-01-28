import 'package:flutter/material.dart';
import 'info.dart'; // Import the InfoScreen file

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller for the LinearProgressIndicator
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // Slower animation speed
      vsync: this,
    )..repeat();

    // Trigger navigation after a delay
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InfoScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/BooK.png', // Book logo
                width: 400,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/Loading-text.png', // Loading text
                width: 300,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF5A1945).withOpacity(0.8), // Shadow color with transparency
                        blurRadius: 10, // Blur radius for the shadow
                        spreadRadius: 2, // Spread radius for the shadow
                        offset: Offset(4, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)), // Rounded corners
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _controller.value,
                          color: const Color(0xFFD383B6), // Baby pink color
                          backgroundColor: const Color(0xFFCCCCCC), // Light pink background
                        );
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
