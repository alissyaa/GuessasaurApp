import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';
import 'package:guessasaur/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/deco.png',
              width: 100,
            ),
            const SizedBox(height: 7),
            Image.asset(
              'assets/images/guessasaur_logo.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
