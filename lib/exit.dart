import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
      // Background image
      Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/Loading Screen.png'),
      fit: BoxFit.cover,
    ),
    ),
    ),

    // Content
    Column(
    children: [
    // Header with hamburger and logo
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const SizedBox(width: 1),
    ],
    ),
    ),

    const Spacer(),

    // Logo
    Image.asset(
    'assets/images/BooK.png',
    width: 400,
    ),

    const SizedBox(height: 20),

    // Title

      const SizedBox(height: 30),

      // Dialog Box
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.pinkAccent,
            width: 4.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You pressed the quit button!',
              style: TextStyle(
                fontFamily: 'CherryBombOne-Regular',
                fontSize: 18,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Are you sure you want to end the level? You will lose a life and your pre-game booster.',
              style: TextStyle(
                fontFamily: 'CherryBomb',
                fontSize: 14,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Play On Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Play On',
                style: TextStyle(
                  fontFamily: 'CherryBombOne-Regular',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // End Game Button
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop(); // Close the application
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'End Game',
                style: TextStyle(
                  fontFamily: 'CherryBombOne-Regular',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),

      const Spacer(),

      // Back Button
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
        ),
      ),
    ],
    ),
          ],
      ),
    );
  }
}
