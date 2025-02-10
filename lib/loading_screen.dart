import 'package:flutter/material.dart';
import 'info.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for the LinearProgressIndicator
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();


    // Trigger navigation after a delay
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const InfoScreen()),
        );
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          double imageWidth = isLandscape
              ? constraints.maxWidth * 0.4
              : constraints.maxWidth * 0.6;

          double imageHeight = isLandscape
              ? constraints.maxHeight * 0.4
              : constraints.maxHeight * 0.3;

          double fontSize = isLandscape
              ? constraints.maxWidth * 0.07
              : constraints.maxWidth * 0.1;

          double progressBarWidth = isLandscape
              ? constraints.maxWidth * 0.6
              : constraints.maxWidth * 0.8;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Loading Screen.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/BooK.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // Loading Text
                  Text(
                    'Loading . . .',
                    style: TextStyle(
                      fontFamily: 'CherryBombOne-Regular',
                      fontSize: fontSize,
                      color: const Color(0xFFD383B6),
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          color: Colors.black,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Progress Bar
                  SizedBox(
                    width: progressBarWidth,
                    height: constraints.maxHeight * 0.02,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF5A1945).withAlpha(204),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              value: _controller.value,
                              color: const Color(0xFFD383B6),
                              backgroundColor: const Color(0xFFCCCCCC),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
