import 'package:flutter/material.dart';
import 'package:apple/W7-S1/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    required this.quizTitle,
    required this.startQuiz,
  });

  final String quizTitle;
  final VoidCallback startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/W7-S1/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          Text(
            quizTitle, 
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          AppButton(
            'Start Quiz',
            icon: Icons.arrow_right_alt,
            onTap: startQuiz,
          )
        ],
      ),
    );
  }
}
