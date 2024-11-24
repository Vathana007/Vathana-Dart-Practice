import 'package:flutter/material.dart';
import 'package:apple/W7-S1/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Question question; 
  final Function(String) onTap;

  const QuestionScreen({ required this.question, required this.onTap,super.key,}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            ...question.possibleAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                child: ElevatedButton(
                  onPressed: () => onTap(answer),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    foregroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
