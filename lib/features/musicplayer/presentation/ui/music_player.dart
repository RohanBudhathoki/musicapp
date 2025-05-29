import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/core/dependecy_injection/injectable_config.dart';
import 'package:musicapp/core/utils/ui_helper.dart';
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late final AudioStore store;

  @override
  void initState() {
    super.initState();
    store = sl<AudioStore>();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                final imagePath =
                    store.currentAudioIndex == 0
                        ? 'assets/png/welcome.png'
                        : 'assets/png/shape_of_you_cover.png';

                return ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 200.w,
                    height: 200.w,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

            UiHelper.verticalSpacing(32.h),

            _buildSeekSlider(store),

            UiHelper.verticalSpacing(24.h),

            _buildControlsRow(store),

            UiHelper.verticalSpacing(32.h),

            _buildSpeedControl(store),
          ],
        ),
      ),
    );
  }

  Widget _buildControlsRow(AudioStore store) {
    return Observer(
      builder:
          (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 36.w,
                icon: const Icon(Icons.replay_5),
                onPressed: () {
                  final newPosition =
                      store.currentPosition - Duration(seconds: 5);
                  store.seek(
                    newPosition > Duration.zero ? newPosition : Duration.zero,
                  );
                },
                tooltip: 'Rewind 5 seconds',
              ),
              SizedBox(width: 24.w),
              IconButton(
                iconSize: 72.w,
                icon: Icon(
                  store.isPlaying ? Icons.pause_circle : Icons.play_circle,
                ),
                onPressed: () => store.isPlaying ? store.pause() : store.play(),
                tooltip: store.isPlaying ? 'Pause' : 'Play',
              ),
              SizedBox(width: 24.w),
              IconButton(
                iconSize: 36.w,
                icon: const Icon(Icons.forward_5),
                onPressed: () {
                  final newPosition =
                      store.currentPosition + Duration(seconds: 5);
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

  Widget _buildSeekSlider(AudioStore store) {
    return StreamBuilder<Duration>(
      stream: store.positionStream,
      builder: (context, positionSnapshot) {
        final position = positionSnapshot.data ?? Duration.zero;

        return StreamBuilder<Duration?>(
          stream: store.durationStream,
          builder: (context, durationSnapshot) {
            final duration = durationSnapshot.data ?? Duration.zero;

            final current = position.inMilliseconds.toDouble();
            final max = duration.inMilliseconds.toDouble();

            return Column(
              children: [
                Slider(
                  min: 0,
                  max: max > 0 ? max : 1,
                  value: current.clamp(0, max),
                  onChanged: (value) {
                    store.seek(Duration(milliseconds: value.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(position),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Text(
                      _formatDuration(duration),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSpeedControl(AudioStore store) {
    return Observer(
      builder:
          (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Speed: ', style: TextStyle(fontSize: 16.sp)),
              DropdownButton<double>(
                value: store.speed,
                items:
                    const [0.5, 0.75, 1.0, 1.25, 1.5, 2.0].map((speed) {
                      return DropdownMenuItem(
                        value: speed,
                        child: Text('${speed}x'),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) store.setSpeed(value);
                },
              ),
            ],
          ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
