import 'package:flutter/material.dart';
import 'package:guessasaur/constants/app_colors.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: child),

          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZigZagDecoration(isTop: true),
          ),

          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ZigZagDecoration(isTop: false),
          ),
        ],
      ),
    );
  }
}

class ZigZagDecoration extends StatelessWidget {
  final bool isTop;
  final Color? topColor;
  final Color? bottomColor;

  const ZigZagDecoration({
    super.key,
    this.isTop = true,
    this.topColor,
    this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ZigZagPainter(
        isTop: isTop,
        topColor: topColor ?? AppColors.secondary,
        bottomColor: bottomColor ?? AppColors.primary,
      ),
      size: const Size(double.infinity, 70),
    );
  }
}

class ZigZagPainter extends CustomPainter {
  final bool isTop;
  final Color topColor;
  final Color bottomColor;

  ZigZagPainter({
    required this.isTop,
    required this.topColor,
    required this.bottomColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = bottomColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    paint.color = topColor;
    final path = Path();

    const triangleWidth = 70.0;
    const triangleHeight = 70.0;
    const radius = 8.0;

    if (isTop) {
      path.moveTo(0, 0);
      for (double x = 0; x <= size.width; x += triangleWidth) {
        final midX = x + triangleWidth / 2;
        path.quadraticBezierTo(
          midX - radius,
          triangleHeight,
          midX,
          triangleHeight,
        );
        path.quadraticBezierTo(
          midX + radius,
          triangleHeight,
          x + triangleWidth,
          0,
        );
      }
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, size.height);
      for (double x = 0; x <= size.width; x += triangleWidth) {
        final midX = x + triangleWidth / 2;
        path.quadraticBezierTo(
          midX - radius,
          size.height - triangleHeight,
          midX,
          size.height - triangleHeight,
        );
        path.quadraticBezierTo(
          midX + radius,
          size.height - triangleHeight,
          x + triangleWidth,
          size.height,
        );
      }
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
