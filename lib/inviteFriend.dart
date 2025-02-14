import 'package:flutter/material.dart';
import 'menu.dart';
import 'utils/audio_manager.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<InviteFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Loading Screen.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 100, // Adjusted height to move the book logo to the top
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/BooK.png', // Book logo
                width: 300,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 50,
            left: 30,
            child: _buildGradientCircle(
              child: IconButton(
                onPressed: () {
                  AudioManager().triggerVibration();
                  AudioManager().playSoundEffect();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),

          // Menu Button
          Positioned(
            top: 50,
            right: 30,
            child: _buildGradientSquare(
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {
                  AudioManager().triggerVibration();
                  AudioManager().playSoundEffect();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for gradient circle (Back Button)
  Widget _buildGradientCircle({required Widget child}) {
    return Container(
      width: 40.0, // Adjust button width
      height: 40.0, // Adjust button height
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
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4169E1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }

  // Helper method for gradient square (Menu Button)
  Widget _buildGradientSquare({required Widget child}) {
    return Container(
      width: 40.0, // Adjust button width
      height: 40.0, // Adjust button height
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF4DC3), // Pink
            Color(0xFF0066FF), // Blue
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4169E1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
