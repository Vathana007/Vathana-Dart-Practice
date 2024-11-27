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
      if (quiz.questions[i].goodAnswer.toLowerCase() ==
          userAnswers[i].toLowerCase()) {
        score++;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[500] as Color,
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
                  final isCorrect = userAnswer.toLowerCase() ==
                      question.goodAnswer.toLowerCase();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor:
                              isCorrect ? Colors.green : Colors.red,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    question.possibleAnswers.map((answer) {
                                  Color answerColor;
                                  if (answer == question.goodAnswer) {
                                    answerColor = Colors.green;
                                  } else if (answer == userAnswer) {
                                    answerColor = Colors.red;
                                  } else {
                                    answerColor = Colors.black;
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                      answer,
                                      style: TextStyle(
                                          fontSize: 16.0, color: answerColor),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
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
