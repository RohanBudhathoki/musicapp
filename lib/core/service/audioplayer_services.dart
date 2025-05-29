// ignore_for_file: deprecated_member_use

import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer player = AudioPlayer();

  Future<void> setSource(String path, {bool loop = false}) async {
    final source =
        loop
            ? LoopingAudioSource(count: 9999, child: AudioSource.asset(path))
            : AudioSource.asset(path);
    await player.setAudioSource(source);
  }

  Future<void> play() async => player.play();
  Future<void> pause() async => player.pause();
  Future<void> seek(Duration pos) async => player.seek(pos);
  Future<void> setSpeed(double speed) async => player.setSpeed(speed);
  Stream<Duration> get positionStream => player.positionStream;
  Stream<Duration?> get durationStream => player.durationStream;
  Stream<PlayerState> get playerStateStream => player.playerStateStream;
  void dispose() => player.dispose();
}
