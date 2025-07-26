import 'package:flutter/material.dart';

class ScreenBackgroundOne extends StatelessWidget {
 // final Widget? child;

  const ScreenBackgroundOne({super.key, });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _OnboardBackgroundPainter(),
     // child: child ?? const SizedBox(),
    );
  }
}

class _OnboardBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF7B42F6),
          Color(0xFFB01EFF),
        ],
      ).createShader(rect);

    canvas.drawRect(rect, paint);

    final Path waveTop = Path()
      ..moveTo(0, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.50, size.width * 0.6, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.64, size.width, size.height * 0.56)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    final Paint waveTopPaint = Paint()..color = Colors.white.withOpacity(0.08);
    canvas.drawPath(waveTop, waveTopPaint);

    final Path wave1 = Path()
      ..moveTo(0, size.height * 0.63)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.67)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.74, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final Paint wavePaint1 = Paint()..color = Colors.white.withOpacity(0.3);
    canvas.drawPath(wave1, wavePaint1);

    final Path wave2 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.78, size.width * 0.6, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.72, size.width, size.height * 0.82)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final Paint wavePaint2 = Paint()..color = Colors.white.withOpacity(0.9);
    canvas.drawPath(wave2, wavePaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
