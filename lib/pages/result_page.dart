import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guessasaur/constants/app_colors.dart';
import 'package:guessasaur/providers/quiz_provider.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/button.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String _playerName = '';

  @override
  void initState() {
    super.initState();
    _loadPlayerName();
  }

  Future<void> _loadPlayerName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _playerName = prefs.getString('playerName') ?? 'rawr';
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RAWRRR',
                  style: AppColors.gradientTextStyle(
                    fontSize: 70,
                    fontFamily: 'Jolly',
                  ),
                ),
                Text(
                  'Good job $_playerName,',
                  style: AppColors.gradientTextStyle(
                    fontSize: 55,
                    fontFamily: 'Jolly',
                  ),
                ),
                const SizedBox(height: 10),
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
                      height: 160,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 20,
                      child: Container(
                        width: 50, height: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 20,
                      child: Container(
                        width: 50, height: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '${quizProvider.score}',
                      style: TextStyle(
                        fontFamily: 'Jolly',
                        fontSize: 80,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'You\'re now officially a',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Dino Expert',
                  style: AppColors.gradientTextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                PrimaryButton(
                  text: 'Try Again?',
                  onPressed: () {
                    quizProvider.resetQuiz();
                    context.go('/form');
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
