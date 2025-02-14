import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/audio_manager.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

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
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/BooK.png',
                    width: screenWidth * 0.6, // Dynamically adjust logo size based on screen width
                    height: screenHeight * 0.2, // Dynamically adjust logo height
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.03), // Adjust space dynamically

                  // Stack for Gradient & Exit Box
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gradient Background Box
                      Container(
                        width: screenWidth * 0.9, // Dynamically adjust container width
                        height: screenHeight * 0.6, // Dynamically adjust container height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFD9D9D9),
                              Color(0xC0FF4DC3), // Gradient pink
                              Color(0xC0002FA7), // Gradient blue
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(51),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),

                      // White Exit Box (Inside the Gradient)
                      Container(
                        width: screenWidth * 0.8, // Adjust width based on screen size
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(51),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Prevents excess height usage
                          children: [
                            const Text(
                              "Are you sure you want to exit the game?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'CherryBombOne-Regular',
                                fontSize: 22,
                                color: Color(0xFF002174),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "You will lose a life and your pre-game booster.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(height: 20),

                            // Play On Button
                            ElevatedButton(
                              onPressed: () {
                                AudioManager().triggerVibration();
                                AudioManager().playSoundEffect();
                                Navigator.pop(context); // Go back to the previous screen
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 12),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shadowColor: Colors.black.withAlpha(51),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF6B95FF), Color(0xFF002FA7), Color(0xFFD9D9D9)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Text(
                                    'Play On',
                                    style: TextStyle(
                                      fontFamily: 'CherryBombOne-Regular',
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.02), // Adjust spacing dynamically

                            // End Game Button
                            ElevatedButton(
                              onPressed: () {
                                AudioManager().triggerVibration();
                                AudioManager().playSoundEffect();
                                SystemNavigator.pop(); // Close the application
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 12),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shadowColor: Colors.black.withAlpha(51),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFE14DFF), Color(0xFFFF4DC3), Color(0xFFD9D9D9)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Text(
                                    'End Game',
                                    style: TextStyle(
                                      fontFamily: 'CherryBombOne-Regular',
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 1.0,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
