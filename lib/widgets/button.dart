import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const PrimaryButton({super.key, required this.text, required this.onPressed, required this.color,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.secondary,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.play_arrow, color: Colors.white),
        ],
      ),
    );
  }
}
