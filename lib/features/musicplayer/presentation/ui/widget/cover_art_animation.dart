import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpinningCoverArt extends StatefulWidget {
  final String imagePath;
  final bool isPlaying;

  const SpinningCoverArt({
    required this.imagePath,
    required this.isPlaying,
    super.key,
  });

  @override
  State<SpinningCoverArt> createState() => _SpinningCoverArtState();
}

class _SpinningCoverArtState extends State<SpinningCoverArt>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant SpinningCoverArt oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Control animation on play/pause
    if (widget.isPlaying && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isPlaying && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 250.r,
            width: 250.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/png/cover_bg.png'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Colors.black87, Colors.black45],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 70.r,
            backgroundImage: AssetImage(widget.imagePath),
          ),
        ],
      ),
    );
  }
}
