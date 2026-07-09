import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBg extends StatefulWidget {
  final Widget child;
  final Color primaryColor;

  const ParticleBg({
    super.key,
    required this.child,
    required this.primaryColor,
  });

  @override
  State<ParticleBg> createState() => _ParticleBgState();
}

class _ParticleBgState extends State<ParticleBg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();

    final rng = Random(42);
    _particles = List.generate(15, (_) => _Particle(rng));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: _ParticlePainter(
                  particles: _particles,
                  progress: _controller.value,
                  primaryColor: widget.primaryColor,
                ),
                size: Size.infinite,
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double size;
  final double speedX;
  final double speedY;
  final double opacity;
  final double phase;

  _Particle(Random rng)
      : x = rng.nextDouble(),
        y = rng.nextDouble(),
        size = rng.nextDouble() * 3 + 1,
        speedX = (rng.nextDouble() - 0.5) * 0.02,
        speedY = (rng.nextDouble() - 0.5) * 0.02,
        opacity = rng.nextDouble() * 0.5 + 0.1,
        phase = rng.nextDouble() * 2 * pi;
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final Color primaryColor;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final x = ((p.x + p.speedX * progress * 20) % 1.0) * size.width;
      final y = ((p.y + p.speedY * progress * 20) % 1.0) * size.height;
      final shimmer = sin(progress * 2 * pi * 0.5 + p.phase) * 0.3 + 0.7;
      final paint = Paint()
        ..color = primaryColor.withValues(alpha: p.opacity * shimmer)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(Offset(x, y), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) =>
      (old.progress - progress).abs() > 0.001;
}
