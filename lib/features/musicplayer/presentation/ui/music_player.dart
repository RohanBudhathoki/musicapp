import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/core/dependecy_injection/injectable_config.dart';
import 'package:musicapp/core/utils/ui_helper.dart';
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart';
import 'package:musicapp/features/musicplayer/presentation/ui/widget/controls_button.dart';
import 'package:musicapp/features/musicplayer/presentation/ui/widget/cover_art_animation.dart';
import 'package:musicapp/features/musicplayer/presentation/ui/widget/seek_slider.dart';
import 'package:musicapp/features/musicplayer/presentation/ui/widget/speed_control.dart';
import 'package:musicapp/gen/assets.gen.dart';

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
      backgroundColor: Color(0xffE4F0FA),
      appBar: AppBar(
        backgroundColor: Color(0xffE4F0FA),
        title: Text(
          'Now Playing',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    final imagePath =
                        store.currentAudioIndex == 0
                            ? Assets.png.welcome.path
                            : Assets.png.shapeOfYouCover.path;

                    return SpinningCoverArt(
                      imagePath: imagePath,
                      isPlaying: store.isPlaying,
                    );
                  },
                ),

                UiHelper.verticalSpacing(32.h),
                SeekBar(store: store),
                UiHelper.verticalSpacing(24.h),
                NeumorphicControlsRow(store: store),
                UiHelper.verticalSpacing(32.h),
              ],
            ),
          ),

          Positioned(
            top: 16.h,
            right: 16.w,
            child: NeumorphicSpeedControl(store: store),
          ),
        ],
      ),
    );
  }
}
