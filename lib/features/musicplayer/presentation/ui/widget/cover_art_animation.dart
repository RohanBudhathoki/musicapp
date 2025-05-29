import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/gen/assets.gen.dart';

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
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        depth: -10,
        intensity: 0.8,
        surfaceIntensity: 0.3,
        boxShape: NeumorphicBoxShape.circle(),
        color: const Color(0xFFEAF6FE),
        shadowDarkColor: Colors.black26,
        shadowLightColor: Colors.white,
      ),
      child: Container(
        height: 300.r,
        width: 300.r,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.r),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: child,
            );
          },
          child: Container(
            height: 250.r,
            width: 250.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.png.coverBg.path),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 70.r,
              backgroundImage: AssetImage(widget.imagePath),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
