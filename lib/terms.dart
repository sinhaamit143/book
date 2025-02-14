import 'package:flutter/material.dart';
import 'play_screen.dart';
import 'utils/audio_manager.dart'; 

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = screenWidth > screenHeight;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
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
                SizedBox(height: isLandscape ? 30 : 50),

                // Logo
                Image.asset(
                  'assets/images/BooK.png',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: isLandscape ? 10 : 20),

                // Gradient Box & White Box Stack
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gradient Background Box (Bigger in Landscape)
                      Container(
                        width: screenWidth * 0.9,
                        height: isLandscape ? screenHeight * 0.65 : screenHeight * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFD9D9D9),
                              Color(0xC0FF4DC3),
                              Color(0xC0002FA7),
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

                      // White Terms Box (Inside Gradient Box)
                      Container(
                        width: screenWidth * 0.8,
                        padding: EdgeInsets.all(isLandscape ? 20 : 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "We've updated our Terms",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'CherryBombOne-Regular',
                                fontSize: 20,
                                color: Color(0xFF002174),
                              ),
                            ),
                            SizedBox(height: isLandscape ? 8 : 10),
                            const Text(
                              "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: isLandscape ? 8 : 10),
                            TextButton(
                              onPressed: () {
                                AudioManager().triggerVibration();
                                AudioManager().playSoundEffect();
                                // Open Terms of Services & Privacy Policy
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
                            SizedBox(height: isLandscape ? 10 : 15),

                            // Accept Button
                            ElevatedButton(
                              onPressed: () {
                                AudioManager().triggerVibration();
                                AudioManager().playSoundEffect();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PlayScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xC0D9D9D9),
                                      Color(0xC0FF4DC3),
                                      Color(0xC0002FA7),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.15,
                                    vertical: isLandscape ? 6 : 10,
                                  ),
                                  child: const Text(
                                    "Accept",
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
