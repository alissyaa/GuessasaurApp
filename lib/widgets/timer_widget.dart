import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class TimerWidget extends StatelessWidget {
  final int seconds;

  const TimerWidget({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.timer_outlined,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Text(
            '$seconds',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
