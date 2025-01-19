
import 'package:api_quizapp/view/splash_screen.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  final int totalPoints;

  const SummaryScreen({required this.totalPoints, super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getReward() {
    if (widget.totalPoints >= 8) {
      return "Gold Medal 🥇";
    } else if (widget.totalPoints >= 5) {
      return "Silver Medal 🥈";
    } else {
      return "Bronze Medal 🥉";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/images/cup.jpg",
                height: 300,
                width: 300,
              ),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              opacity: _controller.value,
              duration: const Duration(seconds: 1),
              child: const Text(
                "Congratulations!!!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "You Are Successfully Completed Quiz!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "You Scored: ${widget.totalPoints}/10",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Reward: ${getReward()}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 239, 197, 91))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
