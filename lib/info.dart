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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/BooK.png',
                  width: 400,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 0),
                // Input fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      _buildTextField("Name", nameController),
                      const SizedBox(height: 10),
                      _buildTextField("Age", ageController),
                      const SizedBox(height: 10),
                      _buildTextField("Contact", contactController),
                      const SizedBox(height: 10),
                      _buildTextField("City", cityController),
                      const SizedBox(height: 10),
                      _buildTextField("Mail", mailController),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Done button
                ElevatedButton(
                  onPressed: () {
                    _saveDataAndNavigate();
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Rounded corners
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.transparent), // Transparent for gradient
                    elevation: WidgetStateProperty.all(10.0), // Shadow for depth
                    side: WidgetStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF002FA7), // Dark blue border color
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), // Same rounded corners
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFD9D9D9),
                          Color(0xFFFF4DC3), // Gradient pink
                          Color(0xFF002FA7), // Gradient blue

                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    child: const Text(
                      "DONE",
                      style: TextStyle(
                        fontFamily: 'CherryBombOne-Regular',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "$label :",
        labelStyle: const TextStyle(
          fontFamily: 'CherryBomb',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
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
    );
  }
}
