import 'dart:async';
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

  Timer? _timer;
  int _timeRemaining = 15;

  QuizProvider() {
    _questions = dummyQuestions;
    startTimer();
  }

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  Map<int, int> get answers => _answers;
  bool get showFeedback => _showFeedback;
  bool get lastAnswerCorrect => _lastAnswerCorrect;
  bool get isQuizCompleted => _isQuizCompleted;
  int get timeRemaining => _timeRemaining;

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

  String get resultLevel {
    if (score <= 30) {
      return 'Newbie Dino Learner';
    } else if (score <= 70) {
      return 'Almost Dino Expert';
    } else {
      return 'Dino Expert';
    }
  }

  void startTimer() {
    _timeRemaining = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        _timeRemaining--;
      } else {
        answerQuestion(_currentQuestionIndex, -1);
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void answerQuestion(int questionIndex, int answerIndex) {
    stopTimer();
    _answers[questionIndex] = answerIndex;
    _lastAnswerCorrect = currentQuestion.correctAnswerIndex == answerIndex;
    _showFeedback = true;
    notifyListeners();
  }

  void nextQuestion() {
    _showFeedback = false;
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      startTimer();
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
    startTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
