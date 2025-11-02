import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class OptionWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showFeedback;
  final VoidCallback onTap;

  const OptionWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showFeedback,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = AppColors.secondary;
    Color textColor = AppColors.primary;

    if (showFeedback) {
      if (isCorrect) {
        buttonColor = AppColors.right; // Green for correct
      } else if (isSelected) {
        buttonColor = AppColors.wrong; // Red for selected but wrong
      }
    } else if (isSelected) {
      buttonColor = AppColors.secondary;
    }

    return GestureDetector(
      onTap: showFeedback ? () {} : onTap, // Disable tap when showing feedback
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              blurRadius: 25,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
