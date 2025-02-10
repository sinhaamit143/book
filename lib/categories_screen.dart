import 'package:flutter/material.dart';
import 'menu.dart';
import 'wordscategory.dart';
import 'calculationscategory.dart';
import 'colorsgame.dart';
import 'poems.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get updated screen dimensions based on the layout builder's constraints
          screenWidth = constraints.maxWidth;
          screenHeight = constraints.maxHeight;

          return Container(
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
                  top: screenHeight * 0.05, // Adjusted top spacing based on screen size
                  left: screenWidth * 0.05, // Adjusted left spacing based on screen size
                  child: _buildGradientCircle(
                    child: IconButton(
                      onPressed: () {
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
                  top: screenHeight * 0.05, // Adjusted top spacing based on screen size
                  right: screenWidth * 0.05, // Adjusted right spacing based on screen size
                  child: _buildGradientSquare(
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuScreen()),
                        );
                      },
                    ),
                  ),
                ),

                // Logo positioned at the top (adjusted position)
                Positioned(
                  top: screenHeight * 0.2, // Adjusted top spacing based on screen size
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/BooK.png',
                      width: screenWidth * 0.6, // Adjusted logo width based on screen size
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.4), // Adjusted spacing dynamically

                    // Scrollable Image Buttons with Circular Gradient Background
                    Expanded(
                      child: PageView.builder(
                        itemCount: 4, // Now includes Words, Calculations, Colors, and Poems
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
                            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adjusted margin
                            child: Transform.scale(
                              scale: 1.0,
                              child: GestureDetector(
                                onTap: () {
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
                                          width: screenWidth * 0.4, // Adjusted size dynamically
                                          height: screenWidth * 0.4, // Adjusted size dynamically
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF4DC3), // Pink
                                                Color(0xFF002174), // Blue (50% opacity)
                                                Color(0xFFD9D9D9), // Gray
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                        ),
                                        ClipOval(
                                          child: Image.asset(
                                            categories[index]["image"],
                                            width: screenWidth * 0.35, // Adjusted size dynamically
                                            height: screenWidth * 0.35, // Adjusted size dynamically
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.02), // Adjusted spacing dynamically
                                    Text(
                                      categories[index]["name"],
                                      style: const TextStyle(
                                        fontFamily: 'CherryBombOne-Regular',
                                        fontSize: 26,
                                        color: Colors.black,
                                        letterSpacing: 2.0,
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
              ],
            ),
          );
        },
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
