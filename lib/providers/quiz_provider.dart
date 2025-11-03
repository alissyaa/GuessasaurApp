import 'package:flutter/material.dart';
import 'package:guessasaur/data/dummy_data.dart';
import 'package:guessasaur/models/question_model.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  Map<int, int> _answers = {};
  bool _showFeedback = false;
  bool _lastAnswerCorrect = false;
  bool _isQuizCompleted = false;

  QuizProvider() {
    _questions = dummyQuestions;
  }

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  Map<int, int> get answers => _answers;
  bool get showFeedback => _showFeedback;
  bool get lastAnswerCorrect => _lastAnswerCorrect;
  bool get isQuizCompleted => _isQuizCompleted;

  int get score {
    int correctAnswers = 0;
    _answers.forEach((questionIndex, answerIndex) {
      if (_questions[questionIndex].correctAnswerIndex == answerIndex) {
        correctAnswers++;
      }
    });
    if (_questions.isEmpty) return 0;
    return ((correctAnswers / _questions.length) * 100).round();
  }

  void answerQuestion(int questionIndex, int answerIndex) {
    _answers[questionIndex] = answerIndex;
    _lastAnswerCorrect = currentQuestion.correctAnswerIndex == answerIndex;
    _showFeedback = true;
    notifyListeners();
  }

  void nextQuestion() {
    _showFeedback = false;
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      _isQuizCompleted = true;
    }
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _answers = {};
    _showFeedback = false;
    _lastAnswerCorrect = false;
    _isQuizCompleted = false;
    notifyListeners();
  }
}
