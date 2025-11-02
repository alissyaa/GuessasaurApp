import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class QuestionWidget extends StatelessWidget {
  final int questionIndex;
  final int totalQuestions;
  final String questionText;
  final String imagePath;

  const QuestionWidget({
    super.key,
    required this.questionIndex,
    required this.totalQuestions,
    required this.questionText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Question ${questionIndex + 1} of $totalQuestions',
          style: AppColors.gradientTextStyle(
            fontSize: 60,
            fontFamily: 'Jolly',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          questionText,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 25,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
