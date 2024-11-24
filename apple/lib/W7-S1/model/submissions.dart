import 'package:apple/W7-S1/model/quiz.dart';

// Class Answer
class Answer {
  final String questionAnswer;
  Question question;

  Answer(this.questionAnswer, this.question);

  bool isCorrect() {
    return questionAnswer == question.goodAnswer;
  }
}

// Class Submission
class Submissions {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int score = 0;
    for (Answer answer in _answers.values) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String userAnswer) {
    _answers[question] = Answer(userAnswer, question);
  }

  void removeAnswer(Question question) {
    _answers.remove(question);
  }
}

