import 'package:flutter/material.dart';
import 'menu.dart'; // Import the menu.dart page
import 'wordscategory.dart'; // Import the wordscategory.dart page
import 'calculationscategory.dart'; // Import the calculationscategory.dart page

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Header with Back Button and Menu Button
            // Back Button
            Positioned(
              top: 40,
              left: 30,
              child: Container(
                padding: const EdgeInsets.all(2.0), // Space for the white border
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // White border
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF4169E1), // Royal blue shadow color
                      blurRadius: 10.0, // Shadow blur
                      spreadRadius: 1.0, // Shadow spread
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(5.0), // Space around the icon
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF4DC3), // Pink
                        Color(0xFF0066FF), // Blue
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    icon: const Icon(
                      Icons.arrow_back, // Back button icon
                      color: Colors.white, // White icon color
                      size: 30, // Icon size
                    ),
                  ),
                ),
              ),
            ),

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
            // Content
            Column(
              children: [
                const SizedBox(height: 200),
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/BooK.png',
                    width: 400,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 50),
                // Scrollable Icon Buttons
                Expanded(
                  child: PageView.builder(
                    itemCount: 2, // Number of categories (can increase in the future)
                    controller: PageController(viewportFraction: 0.6),
                    itemBuilder: (context, index) {
                      final isCentered = index == 0;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Transform.scale(
                          scale: isCentered ? 1.0 : 1.0,
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WordsCategory(),
                                  ),
                                ); // Navigate to wordscategory.dart
                              } else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const CalculationsCategory(),
                                  ),
                                ); // Navigate to calculationscategory.dart
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.lightGreen,
                                  child: Icon(
                                    index == 0
                                        ? Icons.edit_calendar // Words icon
                                        : Icons.calculate, // Calculations icon
                                    size: 100,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  index == 0 ? "Words" : "Calculations",
                                  style: const TextStyle(
                                    fontFamily: 'CherryBombOne-Regular',
                                    fontSize: 26,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
