import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/features/musicplayer/presentation/ui/music_player.dart';

class Musicapp extends StatelessWidget {
  const Musicapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(home: AudioPlayerScreen());
      },
    );
  }
}
