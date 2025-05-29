import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart';

class SeekBar extends StatefulWidget {
  final AudioStore store;
  const SeekBar({required this.store, super.key});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  bool _isUserSeeking = false;
  double _seekValue = 0;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final store = widget.store;
        final duration = store.currentDuration.inMilliseconds.toDouble();
        final position = store.currentPosition.inMilliseconds.toDouble();

        final currentValue = _isUserSeeking ? _seekValue : position;

        return Column(
          children: [
            Slider(
              activeColor: Color(0xffF9B9B0),
              min: 0,
              max: duration > 0 ? duration : 1,
              value: currentValue.clamp(0, duration),
              onChangeStart: (_) {
                setState(() => _isUserSeeking = true);
              },
              onChanged: (value) {
                setState(() => _seekValue = value);
              },
              onChangeEnd: (value) {
                setState(() => _isUserSeeking = false);
                store.seek(Duration(milliseconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(Duration(milliseconds: currentValue.toInt())),
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  _formatDuration(store.currentDuration),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}
