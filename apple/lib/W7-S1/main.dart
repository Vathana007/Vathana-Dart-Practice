import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
    title: "Who is the best teacher?",
    possibleAnswers: ["RONAN", "HONGLY", "LEANGSIV"],
    goodAnswer: "RONAN",
  );
  Question q2 = const Question(
    title: "Which color is the best?",
    possibleAnswers: ["BLUE", "RED", "GREEN"],
    goodAnswer: "RED",
  );

   Question q3 = const Question(
    title: "Which one is programming language?",
    possibleAnswers: ["HTML", "CSS", "PYTHON"],
    goodAnswer: "PYTHON",
  );  

   Question q4 = const Question(
    title: "What is the capital city of FRANCE?",
    possibleAnswers: ["PARIS", "PHNOM PENH", "NEW YORK"],
    goodAnswer: "PARIS",
  );

  List<Question> myQuestions = [q1, q2, q3, q4];
  Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
