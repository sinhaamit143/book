import 'package:flutter/material.dart';

class WordsGame extends StatelessWidget {
  const WordsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Words Game',
          style: TextStyle(
            fontFamily: 'CherryBomb',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Words Game!',
          style: TextStyle(
            fontFamily: 'CherryBomb',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
