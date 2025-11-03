import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class FeedbackCard extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onNext;

  const FeedbackCard({super.key, required this.isCorrect, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final Color contentColor = isCorrect ? AppColors.primary : AppColors.red;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.7),
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isCorrect)
                    Image.asset(
                      'assets/images/true_dino.png',
                      height: 100,
                    ),
                  if (!isCorrect)
                    Image.asset(
                      'assets/images/false_dino.png',
                      height: 100,
                    ),
                  const SizedBox(height: 16),
                  Text(
                    isCorrect ? 'Rawr-some!' : 'Oh no!',
                    style: TextStyle(
                      fontFamily: 'Jolly',
                      fontSize: 60,
                      color: contentColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isCorrect ? 'You guessed it right!' : 'Not that one!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: contentColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: contentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next Dino',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.play_arrow, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
