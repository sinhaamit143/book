import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'terms.dart'; // Import the TermsScreen file

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  InfoScreenState createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    ageController.dispose();
    contactController.dispose();
    cityController.dispose();
    mailController.dispose();
    super.dispose();
  }

  // Save data to local storage using SharedPreferences
  Future<void> _saveDataToLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('age', ageController.text);
    await prefs.setString('contact', contactController.text);
    await prefs.setString('city', cityController.text);
    await prefs.setString('mail', mailController.text);
  }

  // Save data and navigate to TermsScreen safely
  Future<void> _saveDataAndNavigate() async {
    await _saveDataToLocalStorage();

    if (!mounted) return; // Check if the widget is still in the tree

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TermsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          double logoWidth = isLandscape
              ? constraints.maxWidth * 0.3
              : constraints.maxWidth * 0.7;

          double logoHeight = isLandscape
              ? constraints.maxHeight * 0.5
              : constraints.maxHeight * 0.3;

          double textFieldWidth = isLandscape
              ? constraints.maxWidth * 0.5
              : constraints.maxWidth * 0.8;

          double buttonWidth = isLandscape
              ? constraints.maxWidth * 0.4
              : constraints.maxWidth * 0.6;

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Loading Screen.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/BooK.png',
                      width: logoWidth,
                      height: logoHeight,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),

                    // Input fields with dynamic width
                    _buildTextField("Name", nameController, textFieldWidth),
                    const SizedBox(height: 10),
                    _buildTextField("Age", ageController, textFieldWidth),
                    const SizedBox(height: 10),
                    _buildTextField("Contact", contactController, textFieldWidth),
                    const SizedBox(height: 10),
                    _buildTextField("City", cityController, textFieldWidth),
                    const SizedBox(height: 10),
                    _buildTextField("Mail", mailController, textFieldWidth),
                    const SizedBox(height: 20),

                    // Done button
                    ElevatedButton(
                      onPressed: _saveDataAndNavigate,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: buttonWidth * 0.2,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Container(
                        width: buttonWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFD9D9D9), // 50% opacity gray
                              Color(0xFFFF4DC3), // 50% opacity pink
                              Color(0xFF002FA7), // 50% opacity blue
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "DONE",
                          style: TextStyle(
                            fontFamily: 'CherryBombOne-Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(String label, TextEditingController controller, double width) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "$label :",
          labelStyle: TextStyle(
            fontFamily: 'CherryBombOne-Regular',
            fontSize: width * 0.08, // Dynamic font size
            fontWeight: FontWeight.bold,
            color: const Color(0xFF002174),
            letterSpacing: 3.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
