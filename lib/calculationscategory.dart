import 'package:flutter/material.dart';
import 'menu.dart'; // Import the menu.dart page
import 'numbergame.dart'; // Import the numbergame.dart page

class CalculationsCategory extends StatelessWidget {
  const CalculationsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              top: screenHeight * 0.05, // 5% from the top
              left: screenWidth * 0.07, // 7% from the left
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
              top: screenHeight * 0.05, // 5% from the top
              right: screenWidth * 0.07, // 7% from the right
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
                SizedBox(height: screenHeight * 0.15), // Adjusted spacing dynamically
                Center(
                  child: Image.asset(
                    'assets/images/BooK.png',
                    width: screenWidth * 0.6, // Adjusted dynamically
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Adjusted spacing dynamically

                // Buttons Grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenHeight * 0.03, // Dynamic spacing
                    crossAxisSpacing: screenWidth * 0.05, // Dynamic spacing
                    padding: EdgeInsets.all(screenWidth * 0.05), // Adjusted padding
                    children: [
                      _buildImageButton(
                        image: 'assets/images/Plus.png',
                        label: "Plus",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NumberGame(),
                            ),
                          );
                        },
                      ),
                      _buildImageButton(
                        image: 'assets/images/Minus.png',
                        label: "Minus",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NumberGame(),
                            ),
                          );
                        },
                      ),
                      _buildImageButton(
                        image: 'assets/images/Multiply.png',
                        label: "Multiply",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NumberGame(),
                            ),
                          );
                        },
                      ),
                      _buildImageButton(
                        image: 'assets/images/Divide.png',
                        label: "Divide",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NumberGame(),
                            ),
                          );
                        },
                      ),
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
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
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
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
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
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
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
                  image,
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.005), // Reduced spacing dynamically

        // Use SizedBox instead of Container
        SizedBox(
          width: screenWidth * 0.35, // Ensuring proper width to avoid overflow
          child: FittedBox(
            fit: BoxFit.scaleDown, // Prevents text from overflowing
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'CherryBombOne-Regular',
                fontSize: screenWidth * 0.05, // Reduced for better scaling
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
