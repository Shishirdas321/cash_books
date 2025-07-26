import 'package:flutter/material.dart';

class ScreenBackgroundTwo extends StatelessWidget {
  const ScreenBackgroundTwo({super.key, });
  // final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌈 Gradient Background (3 Colors)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF89049F), // Top Purple
                  Color(0xFFFFB6C1), // Middle Pink
                  Color(0xFF7B42F6), // Bottom Violet
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // ⚪ White wave over the gradient
          ClipPath(
            clipper: WavyBackgroundClipper(),
            child: Container(
              height: 300,
              color: Colors.white.withOpacity(0.9),
            ),
          ),

          // 👤 Foreground (optional)
        ],
      ),
    );
  }
}

class WavyBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 40,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 80,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

