import 'package:flutter/material.dart';
import 'widgets/background.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tes font sama background',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const FontTestPage(),
    );
  }
}

class FontTestPage extends StatelessWidget {
  const FontTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Inter yang thin',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Inter yang bold',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Inter yang italic',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Ini font jolly',
                  style: TextStyle(
                    fontFamily: 'Jolly',
                    fontSize: 28,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
