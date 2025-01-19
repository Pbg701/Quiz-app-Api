import 'package:api_quizapp/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Centered button
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                   ///NAVIGATE TO THE HOME SCREEN
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Test",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
