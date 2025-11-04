import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guessasaur/providers/quiz_provider.dart';
import 'package:guessasaur/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: MaterialApp.router(
        routerConfig: createRouter(),
        title: 'Guessasaur',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}