import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
          // Top
          Image.asset(
            'assets/images/deco_top.png',
            height: 150,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Expanded(
            child: child,
          ),
          // Bottom
          Image.asset(
            'assets/images/deco_bottom.png',
            height: 150,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
