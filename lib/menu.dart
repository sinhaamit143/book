import 'package:flutter/material.dart';
import 'package:book/exit.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
        child: Column(
          children: [
            // Logo and Title
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/BooK.png',
                    width: 400,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Menu options
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(20),
                children: [
                  _buildMenuOption(
                    icon: Icons.vibration,
                    label: "Vibration",
                    onPressed: () {
                      // Handle Vibration button logic
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.music_note,
                    label: "Music",
                    onPressed: () {
                      // Handle Music button logic
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.volume_up,
                    label: "Sound",
                    onPressed: () {
                      // Handle Sound button logic
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.support_agent,
                    label: "Support",
                    onPressed: () {
                      // Handle Support button logic
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.person_add,
                    label: "Invite Friend",
                    onPressed: () {
                      // Handle Invite Friend button logic
                    },
                  ),
                  // Exit Button
                  _buildMenuOption(
                    icon: Icons.exit_to_app,
                    label: "Exit",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExitPage()),
                      ); // Navigate to ExitPage
                    },
                  ),
                ],
              ),
            ),
            // Back Button (Cross Icon)
            Container(
              width: 60, // Outer container for the white border
              height: 70,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Outer container as a circle
                color: Colors.white, // White border
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF4169E1).withOpacity(0.4), // Shadow for depth
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Container(
                width: 50, // Inner container for the button
                height: 50,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Inner container as a circle
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF4DC3), // Gradient blue start
                      Color(0xFF0066FF), // Gradient pink end
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  icon: const Icon(
                    Icons.close, // Cross icon
                    color: Colors.white, // Icon color
                    size: 40, // Icon size
                  ),
                  padding: EdgeInsets.zero, // Remove any padding around the icon
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper method to build a menu option
  Widget _buildMenuOption({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
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
            size: 30,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'CherryBombOne-Regular',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
