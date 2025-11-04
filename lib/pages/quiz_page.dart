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
import 'package:guessasaur/widgets/timer_widget.dart';

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 900;

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 120.0,
                        ),
                        child: isWide
                            ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(right: 24.0),
                                child: QuestionWidget(
                                  questionIndex: quizProvider
                                      .currentQuestionIndex,
                                  totalQuestions:
                                  quizProvider.questions.length,
                                  questionText: question.text,
                                  imagePath: question.imagePath,
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 32),
                                  ...question.options
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final option = entry.value;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 16.0),
                                      child: OptionWidget(
                                        text: option,
                                        isSelected: quizProvider.answers[
                                        quizProvider
                                            .currentQuestionIndex] ==
                                            index,
                                        isCorrect: quizProvider
                                            .currentQuestion
                                            .correctAnswerIndex ==
                                            index,
                                        showFeedback:
                                        quizProvider.showFeedback,
                                        onTap: () =>
                                            quizProvider.answerQuestion(
                                              quizProvider
                                                  .currentQuestionIndex,
                                              index,
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ],
                        )
                            : Column(
                          children: [
                            QuestionWidget(
                              questionIndex:
                              quizProvider.currentQuestionIndex,
                              totalQuestions:
                              quizProvider.questions.length,
                              questionText: question.text,
                              imagePath: question.imagePath,
                            ),
                            const SizedBox(height: 32),
                            ...question.options
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final option = entry.value;
                              return Padding(
                                padding:
                                const EdgeInsets.only(bottom: 16.0),
                                child: OptionWidget(
                                  text: option,
                                  isSelected: quizProvider.answers[
                                  quizProvider
                                      .currentQuestionIndex] ==
                                      index,
                                  isCorrect: quizProvider.currentQuestion
                                      .correctAnswerIndex ==
                                      index,
                                  showFeedback:
                                  quizProvider.showFeedback,
                                  onTap: () => quizProvider.answerQuestion(
                                    quizProvider.currentQuestionIndex,
                                    index,
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),

                      Positioned(
                        top: isWide
                            ? MediaQuery.of(context).size.height * 0.15
                            : MediaQuery.of(context).size.height * 0.09,
                        left: isWide ? 300 : 0,
                        right: isWide ? null : 0,
                        child: isWide
                            ? TimerWidget(seconds: quizProvider.timeRemaining)
                            : Center(
                          child: TimerWidget(seconds: quizProvider.timeRemaining),
                        ),
                      ),

                      if (quizProvider.showFeedback)
                        Positioned.fill(
                          child: Container(
                            child: Center(
                              child: FeedbackCard(
                                isCorrect: quizProvider.lastAnswerCorrect,
                                onNext: () => quizProvider.nextQuestion(),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
