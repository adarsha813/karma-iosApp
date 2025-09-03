import 'package:flutter/material.dart';

class BouncingDots extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const BouncingDots({
    super.key,
    this.color = Colors.black,
    this.size = 2.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Each dot offset in time
            double t = (_controller.value + index * 0.2) % 1.0;

            // Bounce effect
            double dy = -4 * (1 - (t - 0.5) * (t - 0.5) * 4);

            // Fade in/out
            double opacity = (t < 0.5) ? t * 2 : (1 - t) * 2;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: Transform.translate(
                offset: Offset(0, dy),
                child: Opacity(
                  opacity: opacity.clamp(0.0, 1.0),
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
