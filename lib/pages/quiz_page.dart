import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:guessasaur/providers/quiz_provider.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/question_widget.dart';
import 'package:guessasaur/widgets/option_widget.dart';
import 'package:guessasaur/widgets/feedback_card.dart';
import 'package:guessasaur/widgets/responsive_center.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            if (quizProvider.isQuizCompleted) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/result');
              });
            }

            final question = quizProvider.currentQuestion;
            return ResponsiveCenter(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    // Add more vertical padding to avoid the decorations
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
                    child: Column(
                      children: [
                        QuestionWidget(
                          questionIndex: quizProvider.currentQuestionIndex,
                          totalQuestions: quizProvider.questions.length,
                          questionText: question.text,
                          imagePath: question.imagePath,
                        ),
                        const SizedBox(height: 32),
                        ...question.options.asMap().entries.map((entry) {
                          final index = entry.key;
                          final option = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: OptionWidget(
                              text: option,
                              isSelected: quizProvider.answers[quizProvider.currentQuestionIndex] == index,
                              isCorrect: quizProvider.currentQuestion.correctAnswerIndex == index,
                              showFeedback: quizProvider.showFeedback,
                              onTap: () => quizProvider.answerQuestion(quizProvider.currentQuestionIndex, index),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  if (quizProvider.showFeedback)
                    Center(
                      child: FeedbackCard(
                        isCorrect: quizProvider.lastAnswerCorrect,
                        onNext: () => quizProvider.nextQuestion(),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
