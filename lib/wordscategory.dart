import 'package:flutter/material.dart';
import 'menu.dart'; // Import the menu.dart page
import 'wordsgame.dart'; // Import the wordsgame.dart page

class WordsCategory extends StatelessWidget {
  const WordsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = screenWidth > screenHeight; // Check for landscape mode

    return Scaffold(
      body: Container(
        width: screenWidth, // Set width to the screen width
        height: screenHeight, // Set height to the screen height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover, // This makes the image cover the entire screen
          ),
        ),
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: screenHeight * 0.05, // Adjusted based on screen height
              left: screenWidth * 0.05, // Adjusted based on screen width
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
              top: screenHeight * 0.05, // Adjusted based on screen height
              right: screenWidth * 0.05, // Adjusted based on screen width
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

            // Content
            Column(
              children: [
                SizedBox(height: screenHeight * 0.2), // Adjusted spacing dynamically
                Center(
                  child: Image.asset(
                    'assets/images/BooK.png',
                    width: isLandscape ? screenWidth * 0.4 : screenWidth * 0.6, // Adjusted image width based on orientation
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Adjusted spacing dynamically

                // Buttons Grid
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,  // Prevent unnecessary height expansion
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                    crossAxisCount: isLandscape ? 3 : 2, // More columns in landscape
                    mainAxisSpacing: screenHeight * 0.02, // Responsive spacing
                    crossAxisSpacing: screenWidth * 0.05,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    children: [
                      _buildImageButton(image: 'assets/images/Weeks.png', label: "Weeks", screenWidth: screenWidth, screenHeight: screenHeight, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WordsGame()));
                      }),
                      _buildImageButton(image: 'assets/images/Planets.png', label: "Planets", screenWidth: screenWidth, screenHeight: screenHeight, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WordsGame()));
                      }),
                      _buildImageButton(image: 'assets/images/Animals.png', label: "Animals", screenWidth: screenWidth, screenHeight: screenHeight, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WordsGame()));
                      }),
                      _buildImageButton(image: 'assets/images/Fruits.png', label: "Fruits", screenWidth: screenWidth, screenHeight: screenHeight, onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WordsGame()));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildImageButton({
    required String image,
    required String label,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: screenWidth * 0.3, // Responsive width
                height: screenWidth * 0.3, // Responsive height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF4DC3), Color(0xFF002174), Color(0xFFD9D9D9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  image,
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // Dynamic spacing
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center, // Ensure text wraps properly
            style: TextStyle(
              fontFamily: 'CherryBombOne-Regular',
              fontSize: screenWidth * 0.05, // Adjusted font size
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
