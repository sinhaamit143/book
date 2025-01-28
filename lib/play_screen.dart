import 'package:flutter/material.dart';
import 'categories_screen.dart'; // Import the CategoriesScreen file
import 'menu.dart'; // Import the MenuScreen file
import 'exit.dart'; // Import the ExitScreen file

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

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
        child: Stack(
          children: [
            // Menu Button
            Positioned(
              top: 40,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(2.0), // Adds space around the icon
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // Square shape
                  borderRadius: BorderRadius.circular(12.0), // Rounded edges
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF4DC3), // Pink
                      Color(0xFF0066FF), // Blue
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(
                    color: Colors.white, // White border
                    width: 2.0, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF4169E1), // Royal blue shadow color
                      blurRadius: 10.0, // Shadow blur
                      spreadRadius: 1.0, // Shadow spread
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu, // Hamburger menu icon
                    color: Colors.white, // White icon color
                    size: 40, // Icon size
                  ),
                  iconSize: 10, // Ensures consistent padding within the square
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    ); // Navigate to menu.dart
                  },
                ),
              ),
            ),
            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/BooK.png',
                    width: 400,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                  // Play button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded border
                      ),
                      backgroundColor: Colors.transparent, // Transparent background for gradient
                      shadowColor: Color(0xFF4169E1).withOpacity(0.4), // Shadow effect
                      elevation: 13, // Elevation for shadow
                    ).copyWith(
                      foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
                      backgroundColor: MaterialStateProperty.all(Colors.transparent), // Transparent background
                    ),
                    onPressed: () {
                      // Navigate to CategoriesScreen when Play is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoriesScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Same rounded border as button
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF6B95FF), // Gradient start
                            Color(0xFF002FA7), // Gradient middle
                            Color(0xFFD9D9D9), // Gradient end
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(
                          color: Color(0xFF002FA7), // Dark blue border color
                          width: 2.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 15,
                      ),
                      child: const Text(
                        "Play",
                        style: TextStyle(
                          fontFamily: 'CherryBombOne-Regular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Exit button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                      ),
                      backgroundColor: Colors.transparent, // Transparent background for gradient
                      shadowColor: Color(0xFF4169E1).withOpacity(0.4), // Shadow effect
                      elevation: 13, // Elevation for shadow
                    ).copyWith(
                      foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
                      backgroundColor: MaterialStateProperty.all(Colors.transparent), // Transparent background
                    ),
                    onPressed: () {
                      // Navigate to ExitScreen when Exit is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExitPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), // Same rounded border as button
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE14DFF), // Gradient start
                            Color(0xFFFF4DC3), // Gradient middle
                            Color(0xFFD9D9D9), // Gradient end
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        border: Border.all(
                          color: Color(0xFF002FA7), // Dark blue border color
                          width: 2.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 15,
                      ),
                      child: const Text(
                        "Exit",
                        style: TextStyle(
                          fontFamily: 'CherryBombOne-Regular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
