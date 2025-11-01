import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF28452D);
  static const Color secondary = Color(0xFFEAE0C7);
  static const Color right = Color(0xFFACC4B0);
  static const Color wrong = Color(0xFFF19999);
  static const Color red = Color(0xFF2C6D37);
  static const Color green = Color(0xFF6D2C2C);
  static const Color text = Color(0xFF0D2F11);
  static const Color mix = Color(0xFF64AB70);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, mix],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static TextStyle gradientTextStyle({
    double fontSize = 24,
    String fontFamily = 'Inter',
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      height: height,
      foreground: Paint()
        ..shader = AppColors.primaryGradient.createShader(
          const Rect.fromLTWH(0, 0, 550, 100),
        ),
    );
  }
}