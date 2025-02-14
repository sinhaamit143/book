import 'package:flutter/material.dart';
import 'package:book/exit.dart';
import 'package:book/utils/audio_manager.dart'; // Import AudioManager
import 'package:book/support.dart';
import 'package:book/inviteFriend.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    _loadInitialStates(); // Load initial music and sound states
  }

  // ✅ Load initial music, sound, and vibration states
  Future<void> _loadInitialStates() async {
    setState(() {
      // No need to manually load states; AudioManager handles it
    });
  }

  // ✅ Toggle music
  void _toggleMusic() {
    bool isMusicEnabled = AudioManager().isMusicEnabled();
    AudioManager().toggleMusic(!isMusicEnabled);
    setState(() {});
  }

  // ✅ Toggle sound
  void _toggleSound() {
    bool isSoundEnabled = AudioManager().isSoundEnabled();
    AudioManager().toggleSound(!isSoundEnabled);
    setState(() {});
  }

  // ✅ Toggle vibration
  void _toggleVibration() {
    bool isVibrationEnabled = AudioManager().isVibrationEnabled();
    AudioManager().toggleVibration(!isVibrationEnabled);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Center(
                      child: Image.asset(
                        'assets/images/BooK.png',
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: screenHeight * 0.03,
                        crossAxisSpacing: screenWidth * 0.05,
                        children: [
                          _buildImageButton(
                            imagePath: AudioManager().isVibrationEnabled()
                                ? 'assets/images/Vibration.png'
                                : 'assets/images/VCross.png',
                            label: "Vibration",
                            onPressed: () {
                              AudioManager().triggerVibration(); // Trigger vibration
                              _toggleVibration();
                              AudioManager()
                                  .playSoundEffect(); // Play sound effect
                            },
                          ),
                          _buildImageButton(
                            imagePath: AudioManager().isMusicEnabled()
                                ? 'assets/images/Music.png'
                                : 'assets/images/MCross.png',
                            label: "Music",
                            onPressed: () {
                              AudioManager().triggerVibration(); // Trigger vibration
                              _toggleMusic();
                              AudioManager()
                                  .playSoundEffect(); // Play sound effect
                            },
                          ),
                          _buildImageButton(
                            imagePath: AudioManager().isSoundEnabled()
                                ? 'assets/images/Sound.png'
                                : 'assets/images/SCross.png',
                            label: "Sound",
                            onPressed: () {
                              AudioManager().triggerVibration(); // Trigger vibration
                              _toggleSound();
                              AudioManager()
                                  .playSoundEffect(); // Play sound effect
                            },
                          ),
                          _buildImageButton(
                              imagePath: 'assets/images/Support.png',
                              label: "Support",
                              onPressed: () {
                                AudioManager().triggerVibration(); // Trigger vibration
                                AudioManager()
                                    .playSoundEffect(); // Play sound effect
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Support()));
                              }),
                          _buildImageButton(
                              imagePath: 'assets/images/InviteFriends.png',
                              label: "Invite Friend",
                              onPressed: () {
                                AudioManager().triggerVibration(); // Trigger vibration
                                AudioManager()
                                    .playSoundEffect(); // Play sound effect
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const InviteFriend()));
                              }),
                          _buildImageButton(
                            imagePath: 'assets/images/Exit.png',
                            label: "Exit",
                            onPressed: () {
                              AudioManager().triggerVibration(); // Trigger vibration
                              AudioManager()
                                  .playSoundEffect(); // Play sound effect
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ExitPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      width: screenWidth * 0.12,
                      height: screenHeight * 0.1,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4169E1).withAlpha(51),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                        padding: const EdgeInsets.all(1.0),
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
                            AudioManager().triggerVibration(); // Trigger vibration
                            AudioManager()
                                .playSoundEffect(); // Play sound effect
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 32,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton({
    required String imagePath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF4DC3),
                  Color(0xFF002174),
                  Color(0xFFD9D9D9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontFamily: 'CherryBombOne-Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}