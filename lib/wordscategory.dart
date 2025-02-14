import 'package:flutter/material.dart';
import 'menu.dart';
import 'wordsgame.dart';
import 'utils/audio_manager.dart';

class WordsCategory extends StatelessWidget {
  const WordsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: screenHeight * 0.05,
              left: screenWidth * 0.07,
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
              top: screenHeight * 0.05,
              right: screenWidth * 0.07,
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

            // Scrollable Content
            Positioned(
              top: screenHeight * 0.15,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/BooK.png',
                        width: isLandscape ? screenWidth * 0.4 : screenWidth * 0.6,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    // Buttons Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: screenHeight * 0.03,
                      crossAxisSpacing: screenWidth * 0.05,
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      children: [
                        _buildImageButton(
                          image: 'assets/images/Weeks.png',
                          label: "Weeks",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onPressed: () {
                            AudioManager().triggerVibration();
                            AudioManager().playSoundEffect();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WordsGame(),
                              ),
                            );
                          },
                        ),
                        _buildImageButton(
                          image: 'assets/images/Planets.png',
                          label: "Planets",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onPressed: () {
                            AudioManager().triggerVibration();
                            AudioManager().playSoundEffect();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WordsGame(),
                              ),
                            );
                          },
                        ),
                        _buildImageButton(
                          image: 'assets/images/Animals.png',
                          label: "Animals",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onPressed: () {
                            AudioManager().triggerVibration();
                            AudioManager().playSoundEffect();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WordsGame(),
                              ),
                            );
                          },
                        ),
                        _buildImageButton(
                          image: 'assets/images/Fruits.png',
                          label: "Fruits",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onPressed: () {
                            AudioManager().triggerVibration();
                            AudioManager().playSoundEffect();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WordsGame(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCircle({required Widget child}) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: const [
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

  Widget _buildGradientSquare({required Widget child}) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: const [
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

  Widget _buildImageButton({
    required String image,
    required String label,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
  }) {
    final bool isLandscape = screenWidth > screenHeight;
    final double buttonSize = isLandscape ? screenWidth * 0.2 : screenWidth * 0.3;
    final double imageSize = isLandscape ? screenWidth * 0.15 : screenWidth * 0.25;
    final double fontSize = isLandscape ? screenWidth * 0.04 : screenWidth * 0.05;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: buttonSize,
                height: buttonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF4DC3),
                      Color(0xFF002174),
                      Color(0xFFD9D9D9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  image,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        SizedBox(
          width: screenWidth * 0.35,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CherryBombOne-Regular',
                fontSize: fontSize,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}