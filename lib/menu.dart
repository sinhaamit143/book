import 'package:flutter/material.dart';
import 'package:book/exit.dart';
import 'package:book/utils/audio_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with WidgetsBindingObserver {
  bool isMusicPlaying = true;
  bool wasMusicPlayingBeforeBackground =
      true; // Track music state before backgrounding

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observe app lifecycle
    _resetMusicOnStartup();
  }

  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Remove observer when screen is disposed
    super.dispose();
  }

  // ✅ Handle app lifecycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is in the background → Stop music if it was playing
      if (isMusicPlaying) {
        wasMusicPlayingBeforeBackground =
            true; // Remember that music was playing
        AudioManager().stopMusic();
      } else {
        wasMusicPlayingBeforeBackground = false;
      }
    } else if (state == AppLifecycleState.resumed) {
      // App comes back to foreground → Resume music if it was playing before
      if (wasMusicPlayingBeforeBackground) {
        AudioManager().playBackgroundMusic();
      }
    }
  }

  // ✅ Ensure music always starts playing when reopening the app
  Future<void> _resetMusicOnStartup() async {
    setState(() {
      isMusicPlaying = true; // Always start with music ON
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicPlaying', true);

    AudioManager().playBackgroundMusic();
  }

  // ✅ Save music state to SharedPreferences
  Future<void> _saveMusicState(bool state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicPlaying', state);
  }

  // ✅ Toggle music
  void _toggleMusic() {
    setState(() {
      isMusicPlaying = !isMusicPlaying;
    });

    _saveMusicState(isMusicPlaying);

    if (isMusicPlaying) {
      AudioManager().playBackgroundMusic();
    } else {
      AudioManager().stopMusic();
    }
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
                              imagePath: 'assets/images/Vibration.png',
                              label: "Vibration",
                              onPressed: () {}),
                          _buildImageButton(
                            imagePath: isMusicPlaying
                                ? 'assets/images/Music.png'
                                : 'assets/images/MCross.png',
                            label: "Music",
                            onPressed: _toggleMusic,
                          ),
                          _buildImageButton(
                              imagePath: 'assets/images/Sound.png',
                              label: "Sound",
                              onPressed: () {}),
                          _buildImageButton(
                              imagePath: 'assets/images/Support.png',
                              label: "Support",
                              onPressed: () {}),
                          _buildImageButton(
                              imagePath: 'assets/images/InviteFriends.png',
                              label: "Invite Friend",
                              onPressed: () {}),
                          _buildImageButton(
                            imagePath: 'assets/images/Exit.png',
                            label: "Exit",
                            onPressed: () {
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
                              Color(0x80FF4DC3),
                              Color(0xFF002174),
                              Color(0xFFD9D9D9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
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
