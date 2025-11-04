import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guessasaur/constants/app_colors.dart';
import 'package:guessasaur/providers/quiz_provider.dart';
import 'package:guessasaur/widgets/background.dart';
import 'package:guessasaur/widgets/button.dart';
import 'package:guessasaur/widgets/score.dart';

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth > 900;

            final textContent = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
              isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Text(
                  'RAWRRR',
                  style: TextStyle(
                    fontFamily: 'Jolly',
                    fontSize: isWide ? 80 : 70,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Good job $_playerName,',
                  style: TextStyle(
                    fontFamily: 'Jolly',
                    fontSize: isWide ? 60 : 50,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 20),
                if (!isWide)
                  ScoreCircleWidget(score: quizProvider.score),
                if (!isWide) const SizedBox(height: 25),
                const Text(
                  'You\'re a',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  quizProvider.resultLevel,
                  style: AppColors.gradientTextStyle(
                    fontFamily: 'Inter',
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                PrimaryButton(
                  text: 'Try Again?',
                  color: AppColors.primary,
                  onPressed: () {
                    quizProvider.resetQuiz();
                    context.go('/form');
                  },
                ),
              ],
            );

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: isWide
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: ScoreCircleWidget(score: quizProvider.score),
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(flex: 1, child: textContent),
                  ],
                )
                    : textContent,
              ),
            );
          },
        ),
      ),
    );
  }
}
