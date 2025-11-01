import 'package:flutter/material.dart';
import 'package:guessasaur/widgets/background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
          child: Text('Welcome!'),
        ),
      ),
    );
  }
}
