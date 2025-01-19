// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/quiz_model.dart';
import 'summery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuizModel? quiz;
  Map<int, int?> selectedAnswers = {};
  int totalScore = 0; // Total score variable

  // Fetch quiz data from API
  Future<void> fetchQuizData() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.jsonserve.com/Uw5CrX"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        log(response.body);

        setState(() {
          quiz = QuizModel.fromJson(data);
        });
      } else {
        log("Failed to fetch data: ${response.statusCode}");
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  ///CALL THE FETCH QUIZ DATA FUNCTION
  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  ///CHECK THE LEVEL OF THE USER
  String getLevel() {
    if (totalScore >= 8) {
      return "Level: Expert 🚀";
    } else if (totalScore >= 5) {
      return "Level: Intermediate 🌟";
    } else {
      return "Level: Beginner 🌱";
    }
  }

  // Calculate total score
  void updateScore() {
    int score = 0;
    if (quiz != null) {
      for (int index = 0; index < (quiz!.questions?.length ?? 0); index++) {
        final question = quiz!.questions![index];
        final selectedOptionIndex = selectedAnswers[index];
        if (selectedOptionIndex != null &&
            question.options![selectedOptionIndex].isCorrect == true) {
          score += question.score ?? 0;

          score++;
          log("Score:$score");
        }
      }
    }

    ///UPDATE THE TOTAL SCORE
    setState(() {
      totalScore = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quiz App",
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
      ),

      ///CHECK IF THE QUIZ IS NULL
      body: quiz == null
          ? const Center(child: CircularProgressIndicator())

          ///DISPLAY THE QUIZ QUESTIONS
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: quiz!.questions?.length ?? 0,
                    itemBuilder: (context, index) {
                      final question = quiz!.questions![index];
                      return Card(
                        margin: const EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///DISPLAY THE QUESTIONS
                              Text(
                                "Q${index + 1}: ${question.description}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),

                              ///DISPLAY THE OPTIONS
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: question.options?.length ?? 0,
                                itemBuilder: (context, optionIndex) {
                                  ///CHECK IF THE OPTION IS SELECTED
                                  final option = question.options![optionIndex];
                                  final isSelected =
                                      selectedAnswers[index] == optionIndex;
                                  final isCorrect = option.isCorrect == true;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswers[index] = optionIndex;
                                        updateScore(); // Update score dynamically
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? (isCorrect
                                                ? Colors.green.withOpacity(0.5)
                                                : Colors.red.withOpacity(0.5))
                                            : Colors.white,
                                        border: Border.all(
                                          color: isSelected
                                              ? (isCorrect
                                                  ? Colors.green
                                                  : Colors.red)
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: Icon(
                                              Icons.circle,
                                              key: ValueKey(isSelected),
                                              color: isSelected
                                                  ? (isCorrect
                                                      ? Colors.green
                                                      : Colors.red)
                                                  : Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              option.description.toString(),
                                              style: TextStyle(
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),

                                          ///DISPLAY THE ICONS
                                          if (isSelected)
                                            AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: Icon(
                                                isCorrect
                                                    ? Icons.check_circle
                                                    : Icons.cancel,
                                                key: ValueKey(isCorrect),
                                                color: isCorrect
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getLevel(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                ///DISPLAY THE TOTAL SCORE
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.lightBlue)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          ///NAVIGATE TO THE SUMMARY SCREEN
                          builder: (context) => SummaryScreen(
                            totalPoints: totalScore,
                          ),
                        ),
                      );
                    },
                    child: const Text("Submit Quiz"),
                  ),
                ),
              ],
            ),
    );
  }
}
