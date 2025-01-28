import 'package:flutter/material.dart';
import 'play_screen.dart'; // Import the PlayScreen file

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
          child: SingleChildScrollView(
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
                const SizedBox(height: 20),
                // Terms box
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "We've updated our Terms",
                        style: TextStyle(
                          fontFamily: 'CherryBomb',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Add logic if needed
                        },
                        child: const Text(
                          "Terms of Services\nPrivacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Accept button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to PlayScreen when "Accept" is clicked
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlayScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          backgroundColor: Colors.transparent, // Set background to transparent to show the gradient
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // Same rounded corners as the decoration
                            side: const BorderSide(
                              color: Color(0xFF002FA7), // Dark blue border
                              width: 2, // Border width
                            ),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25), // Same rounded corners
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFD9D9D9),
                                Color(0xFF002FA7), // Gradient blue
                                Color(0xFFFF4DC3), // Gradient pink
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Accept",
                              style: TextStyle(
                                fontFamily: 'CherryBombOne-Regular',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Text color
                              ),
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
        ),
      ),
    );
  }
}
