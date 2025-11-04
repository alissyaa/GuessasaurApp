import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class ScoreCircleWidget extends StatelessWidget {
  final int score;

  const ScoreCircleWidget({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Your Final Score',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),

            Positioned(
              top: 0,
              left: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Text(
              '$score',
              style: const TextStyle(
                fontFamily: 'Jolly',
                fontSize: 80,
                color: AppColors.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
