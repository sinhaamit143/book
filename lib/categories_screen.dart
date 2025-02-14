import 'package:flutter/material.dart';
import 'menu.dart';
import 'wordscategory.dart';
import 'calculationscategory.dart';
import 'colorsgame.dart';
import 'poems.dart';
import 'utils/audio_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get screen dimensions
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Check if the device is in landscape mode
          bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

          // Call the method to get adjusted sizes
          Map<String, double> sizes = _getAdjustedSizes(isLandscape, screenWidth, screenHeight);

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Loading Screen.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // Back and Menu Buttons at the Top
                Padding(
                  padding: EdgeInsets.only(top: sizes['topSpacing']!, left: sizes['sideSpacing']!, right: sizes['sideSpacing']!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      _buildGradientCircle(
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

                      // Menu Button
                      _buildGradientSquare(
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
                    ],
                  ),
                ),

                // Logo positioned below the buttons
                Container(
                  margin: EdgeInsets.only(top: sizes['logoTop']!),
                  child: Center(
                    child: Image.asset(
                      'assets/images/BooK.png',
                      width: sizes['logoWidth']!, // Adjusted logo width based on screen size
                    ),
                  ),
                ),

                // Scrollable Image Buttons with Circular Gradient Background
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: sizes['pageViewHeight']!,
                          child: PageView.builder(
                            itemCount: 4,
                            controller: PageController(viewportFraction: 0.6),
                            itemBuilder: (context, index) {
                              // Category Data
                              final List<Map<String, dynamic>> categories = [
                                {
                                  "name": "Words",
                                  "image": "assets/images/Weeks.png",
                                  "route": const WordsCategory()
                                },
                                {
                                  "name": "Calculations",
                                  "image": "assets/images/Calculations.png",
                                  "route": const CalculationsCategory()
                                },
                                {
                                  "name": "Colors",
                                  "image": "assets/images/Colors.png",
                                  "route": const ColorsGame()
                                },
                                {
                                  "name": "Poems",
                                  "image": "assets/images/Poems.png",
                                  "route": const Poems()
                                },
                              ];

                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: sizes['margin']!),
                                child: Transform.scale(
                                  scale: 1.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      AudioManager().triggerVibration();
                                      AudioManager().playSoundEffect();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => categories[index]["route"]),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Circular Gradient Background with Image
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: sizes['iconSize']!, // Adjusted size dynamically
                                              height: sizes['iconSize']!, // Adjusted size dynamically
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
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
                                                categories[index]["image"],
                                                width: sizes['iconSize']! * 0.9, // Adjusted size dynamically
                                                height: sizes['iconSize']! * 0.9, // Adjusted size dynamically
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: sizes['textSpacing']!), // Adjusted spacing dynamically
                                        Text(
                                          categories[index]["name"],
                                          style: TextStyle(
                                            fontFamily: 'CherryBombOne-Regular',
                                            fontSize: sizes['textSize']!, // Adjusted text size dynamically
                                            color: Colors.black,
                                            letterSpacing: 1.5,
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Method to get adjusted sizes based on orientation
  Map<String, double> _getAdjustedSizes(bool isLandscape, double screenWidth, double screenHeight) {
    if (isLandscape) {
      return {
        'topSpacing': screenHeight * 0.08,
        'sideSpacing': screenWidth * 0.02,
        'logoTop': screenHeight * 0.01,
        
        'logoWidth': screenWidth * 0.3,
        'scrollableTop': screenHeight * 0.35,
        'pageViewHeight': screenHeight * 0.5,
        'margin': screenWidth * 0.05,
        'iconSize': screenWidth * 0.15, // Reduced icon size in landscape
        'textSize': 16.0, // Reduced text size in landscape
        'textSpacing': screenHeight * 0.01,
      };
    } else {
      return {
        'topSpacing': screenHeight * 0.05,
        'sideSpacing': screenWidth * 0.05,
        'logoTop': screenHeight * 0.15,
        'logoWidth': screenWidth * 0.6,
        'scrollableTop': screenHeight * 0.35,
        'pageViewHeight': screenHeight * 0.5,
        'margin': screenWidth * 0.05,
        'iconSize': screenWidth * 0.35,
        'textSize': 26.0,
        'textSpacing': screenHeight * 0.02,
      };
    }
  }

  // Helper method for gradient circle (Back Button)
  Widget _buildGradientCircle({required Widget child}) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF4DC3),
            Color(0xFF0066FF),
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
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF4DC3),
            Color(0xFF0066FF),
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