
import 'package:api_quizapp/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      ///NAVIGATE TO THE SPLASH SCREEN
      home: SplashScreen(),
    );
  }
}
