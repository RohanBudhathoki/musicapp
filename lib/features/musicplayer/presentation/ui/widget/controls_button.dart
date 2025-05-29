import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart';
import 'package:musicapp/gen/assets.gen.dart';

class NeumorphicControlsRow extends StatelessWidget {
  final AudioStore store;

  const NeumorphicControlsRow({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNeumorphicImageButton(
                image: Image.asset(Assets.png.previous.path),
                size: 60.w,
                onTap: () {
                  final newPosition =
                      store.currentPosition - const Duration(seconds: 5);
                  store.seek(
                    newPosition > Duration.zero ? newPosition : Duration.zero,
                  );
                },
                tooltip: 'Rewind 5 seconds',
              ),
              SizedBox(width: 24.w),
              _buildNeumorphicIconButton(
                icon: store.isPlaying ? Icons.pause : Icons.play_arrow,
                size: 90.w,
                onTap: () => store.isPlaying ? store.pause() : store.play(),
                tooltip: store.isPlaying ? 'Pause' : 'Play',
              ),
              SizedBox(width: 24.w),
              _buildNeumorphicImageButton(
                image: Image.asset(Assets.png.next.path),
                size: 60.w,
                onTap: () {
                  final newPosition =
                      store.currentPosition + const Duration(seconds: 5);
                  store.seek(
                    newPosition < store.currentDuration
                        ? newPosition
                        : store.currentDuration,
                  );
                },
                tooltip: 'Forward 5 seconds',
              ),
            ],
          ),
    );
  }

  Widget _buildNeumorphicImageButton({
    required Widget image,
    required double size,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    return NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
        boxShape: const NeumorphicBoxShape.circle(),
        depth: 6,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        color: const Color(0xFFEAF6FE),
        shadowDarkColor: Colors.black26,
        shadowLightColor: Colors.white,
      ),
      padding: EdgeInsets.all(size * 0.2),
      child: Tooltip(
        message: tooltip ?? '',
        child: SizedBox(width: size * 0.6, height: size * 0.6, child: image),
      ),
    );
  }

  Widget _buildNeumorphicIconButton({
    required IconData icon,
    required double size,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    return NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
        boxShape: const NeumorphicBoxShape.circle(),
        depth: 6,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        color: const Color(0xFFEAF6FE),
        shadowDarkColor: Colors.black26,
        shadowLightColor: Colors.white,
      ),
      padding: EdgeInsets.all(size * 0.2),
      child: Tooltip(
        message: tooltip ?? '',
        child: Icon(icon, size: size * 0.6, color: Colors.black87),
      ),
    );
  }
}
