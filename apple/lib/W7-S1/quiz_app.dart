import 'package:flutter/material.dart';
import 'package:apple/W7-S1/screens/welcome_screen.dart';
import 'package:apple/W7-S1/screens/question_screen.dart';
import 'package:apple/W7-S1/screens/result_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;
 
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentQuestionIndex = 0; 
   List<String> userAnswers= [];

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

  //switch screen
    switch (quizState) {
      case QuizState.notStarted:
        currentScreen = WelcomeScreen(
          startQuiz: () {
            setState(() {
              quizState = QuizState.started;
              currentQuestionIndex = 0; 
              userAnswers.clear();
            });
          },
          quizTitle: 'Crazy Quizz',
        );
        break;

      case QuizState.started:
        final currentQuestion = widget.quiz.questions[currentQuestionIndex];
        currentScreen = QuestionScreen(
          question: currentQuestion,
          onTap: (selectedChoice) {
            setState(() {
              userAnswers.add(selectedChoice);
              if (currentQuestionIndex < widget.quiz.questions.length - 1) {
                setState(() {
                  currentQuestionIndex++;
                });
              } else {
                setState(() {
                  quizState = QuizState.finished;
                });
              }
            });
          },
        );
        break;
      case QuizState.finished:
        currentScreen = ResultScreen(
          quiz: widget.quiz,
          userAnswers: userAnswers,
          onRestartQuiz: () {
            setState(() {
              quizState = QuizState.notStarted;
            });
          },
        );
        break;
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: currentScreen,
      ),
    );
  }
}
