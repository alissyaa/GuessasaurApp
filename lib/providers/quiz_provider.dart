import 'package:flutter/material.dart';
import 'package:guessasaur/models/question_model.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  Map<int, int> _answers = {};
  bool _showFeedback = false;
  bool _lastAnswerCorrect = false;

  QuizProvider() {
    _questions = [
      Question(
        text: 'Who\'s this dinosaur?',
        imagePath: 'assets/images/velociraptor.png',
        options: ['Stegosaurus', 'Velociraptor', 'T-Rex', 'Triceratops'],
        correctAnswerIndex: 1,
      ),
      Question(
        text: 'Who\'s this dinosaur?',
        imagePath: 'assets/images/allosaurus.png',
        options: ['Velociraptor', 'T-Rex', 'Triceratops', 'Allosaurus'],
        correctAnswerIndex: 3,
      ),
      // Add more questions here
    ];
  }

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  Map<int, int> get answers => _answers;
  bool get showFeedback => _showFeedback;
  bool get lastAnswerCorrect => _lastAnswerCorrect;

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
      // TODO: Handle quiz completion
    }
    notifyListeners();
  }
}
