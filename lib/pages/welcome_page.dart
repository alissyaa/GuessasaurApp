import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/button.dart';
import 'package:guessasaur/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.12,
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    PrimaryButton(
                      text: 'Im ready!',
                      color: AppColors.primary,
                      onPressed: () {
                        context.go('/form');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
