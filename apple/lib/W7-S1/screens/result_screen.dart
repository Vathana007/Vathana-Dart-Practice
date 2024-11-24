import 'package:flutter/material.dart';
import 'package:apple/W7-S1/model/quiz.dart';
import 'package:apple/W7-S1/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestartQuiz;
  final List<String> userAnswers;

  const ResultScreen({
    required this.quiz,
    required this.onRestartQuiz,
    required this.userAnswers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      if (quiz.questions[i].goodAnswer.toLowerCase() == userAnswers[i].toLowerCase()) {
        score++;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Title
            Text(
              'You answered $score out of ${quiz.questions.length}!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Results List
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final userAnswer = userAnswers[index];
                  final isCorrect = userAnswer.toLowerCase() == question.goodAnswer.toLowerCase();

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: isCorrect ? Colors.green : Colors.red,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Question Card
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Question title
                                  Text(
                                    question.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Correct and User Answer
                                  Row(
                                    children: [
                                      const Text('Your Answer: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text(
                                        userAnswer,
                                        style: TextStyle(
                                          color: isCorrect ? Colors.green : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Correct Answer: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text(question.goodAnswer, style: const TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Restart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: AppButton(
                'Restart Quiz',
                icon: Icons.restart_alt,
                onTap: onRestartQuiz,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
