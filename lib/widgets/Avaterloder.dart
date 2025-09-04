import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class AvatarOrbitLoader extends StatefulWidget {
  final double size; // diameter of the loader
  final Color color;
  const AvatarOrbitLoader({
    super.key,
    required this.size,
    this.color = Colors.blue,
  });

  @override
  State<AvatarOrbitLoader> createState() => _AvatarOrbitLoaderState();
}

class _AvatarOrbitLoaderState extends State<AvatarOrbitLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: _OrbitPainter(
              progress: _controller.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final double progress;
  final Color color;

  _OrbitPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final startAngle = -progress * 2 * pi; // reversed rotation

    // Solid arc (first half, thick → thin)
    for (int i = 0; i < 60; i++) {
      final angle = startAngle + (i * (pi / 60));
      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      final Paint paint =
          Paint()
            ..strokeCap = StrokeCap.round
            ..color = color
            ..strokeWidth = 6 - (i * 0.08);

      canvas.drawPoints(PointMode.points, [Offset(dx, dy)], paint);
    }

    // Tail dots (second half, small + fading out)
    for (int i = 0; i < 6; i++) {
      final angle = startAngle + pi + (i * 0.2);
      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      final double opacity = (1 - i / 6).clamp(0.0, 1.0); // fade out gradually

      final Paint paint =
          Paint()
            ..strokeCap = StrokeCap.round
            ..color = color.withOpacity(opacity)
            ..strokeWidth = 4 - (i * 0.6);

      canvas.drawPoints(PointMode.points, [Offset(dx, dy)], paint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter oldDelegate) => true;
}
