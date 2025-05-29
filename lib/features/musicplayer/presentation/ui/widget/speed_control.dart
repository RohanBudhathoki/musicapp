import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart';

class NeumorphicSpeedControl extends StatelessWidget {
  final AudioStore store;

  const NeumorphicSpeedControl({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    const speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];

    return Observer(
      builder: (_) {
        final currentIndex = speeds.indexOf(store.speed);
        final nextIndex = (currentIndex + 1) % speeds.length;
        final nextSpeed = speeds[nextIndex];

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeumorphicButton(
              onPressed: () => store.setSpeed(nextSpeed),
              style: NeumorphicStyle(
                boxShape: const NeumorphicBoxShape.circle(),
                depth: 6,
                intensity: 0.8,
                shape: NeumorphicShape.flat,
                color: const Color(0xFFEAF6FE),
                shadowDarkColor: Colors.black26,
                shadowLightColor: Colors.white,
              ),
              padding: EdgeInsets.zero,
              child: Container(
                width: 48.w,
                height: 48.w,
                alignment: Alignment.center,
                child: Text(
                  '${store.speed}x',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
