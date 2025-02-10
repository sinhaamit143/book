import 'package:flutter/material.dart';
import 'categories_screen.dart'; // Import the CategoriesScreen file
import 'menu.dart'; // Import the MenuScreen file
import 'exit.dart'; // Import the ExitScreen file

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              top: screenHeight * 0.05, // Dynamic position based on screen height
              right: screenWidth * 0.05, // Dynamic position based on screen width
              child: Container(
                width: 40.0, // Adjust button width
                height: 40.0, // Adjust button height
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
                    width: 1.5, // Border width
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
                    size: 22, // Icon size
                  ),
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
                    width: screenWidth * 0.8, // Dynamic width based on screen size
                    height: screenHeight * 0.25, // Dynamic height based on screen size
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.05), // Dynamic height based on screen size
                  // Play button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Rounded border
                      ),
                      backgroundColor: Colors.transparent, // Transparent background for gradient
                      shadowColor: Color(0xFF4169E1).withAlpha(102), // Shadow effect
                      elevation: 13, // Elevation for shadow
                    ).copyWith(
                      foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
                      backgroundColor: WidgetStateProperty.all(Colors.transparent), // Transparent background
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
                        borderRadius: BorderRadius.circular(50), // Same rounded border as button
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
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2, // Dynamic width based on screen size
                        vertical: screenHeight * 0.025, // Dynamic height based on screen size
                      ),
                      child: const Text(
                        "Play",
                        style: TextStyle(
                          fontFamily: 'CherryBombOne-Regular',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Dynamic height based on screen size
                  // Exit button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Rounded border
                      ),
                      backgroundColor: Colors.transparent, // Transparent background for gradient
                      shadowColor: Color(0xFF4169E1).withAlpha(204), // Shadow effect
                      elevation: 13, // Elevation for shadow
                    ).copyWith(
                      foregroundColor: WidgetStateProperty.all(Colors.white), // Text color
                      backgroundColor: WidgetStateProperty.all(Colors.transparent), // Transparent background
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
                        borderRadius: BorderRadius.circular(50), // Same rounded border as button
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
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2, // Dynamic width based on screen size
                        vertical: screenHeight * 0.025, // Dynamic height based on screen size
                      ),
                      child: const Text(
                        "Exit",
                        style: TextStyle(
                          fontFamily: 'CherryBombOne-Regular',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3.0,
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
