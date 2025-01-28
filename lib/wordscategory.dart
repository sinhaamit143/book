import 'package:flutter/material.dart';
import 'menu.dart'; // Import the menu.dart page
import 'wordsgame.dart'; // Import the wordsgame.dart page

class WordsCategory extends StatelessWidget {
  const WordsCategory({super.key});

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
    // Back Button
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
    const SizedBox(height: 50),
    // Buttons Grid
    Expanded(
    child: GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    padding: const EdgeInsets.all(20),
    children: [
    // Weeks Button
    _buildIconButton(
    icon: Icons.calendar_today,
    label: "Weeks",
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const WordsGame(),
    ),
    ); // Navigate to wordsgame.dart
    },
    ),
    // Planets Button
    _buildIconButton(
    icon: Icons.public,
    label: "Planets",
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const WordsGame(),
    ),
    ); // Navigate to wordsgame.dart
    },
    ),
    // Animals Button
      _buildIconButton(
        icon: Icons.pets,
        label: "Animals",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WordsGame(),
            ),
          ); // Navigate to wordsgame.dart
        },
      ),
      // Fruits Button
      _buildIconButton(
        icon: Icons.apple,
        label: "Fruits",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WordsGame(),
            ),
          ); // Navigate to wordsgame.dart
        },
      ),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
        ),
    );
  }

  // Helper method to build each icon button
  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.white, // Button color
            foregroundColor: Colors.pink, // Icon and ripple color
          ),
          child: Icon(
            icon,
            size: 60, // Icon size
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'CherryBomb',
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

