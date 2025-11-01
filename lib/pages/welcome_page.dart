import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guessasaur/routes.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/button.dart';
import 'package:guessasaur/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Background(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.12,
            vertical: screenHeight * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.12),
                Text(
                  'Welcome to',
                  style: AppColors.gradientTextStyle(
                    fontSize: 70,
                    fontFamily: 'Jolly',
                    height: 0.8,
                  ),
                ),
                Text(
                  'Guessasaur!',
                  style: AppColors.gradientTextStyle(
                    fontSize: 85,
                    fontFamily: 'Jolly',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Think you know your dinosaurs? Let\'s find out!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    fontSize: 25,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                PrimaryButton(
                  text: 'Im ready!',
                  onPressed: () {
                    context.go(AppRoutes.form);
                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
