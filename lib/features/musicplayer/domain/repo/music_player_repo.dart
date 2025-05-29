import 'package:just_audio/just_audio.dart';

abstract class AudioRepository {
  Future<void> playWelcomeAudio();
  Future<void> playMainAudioLoop();
  Future<void> play();
  Future<void> pause();
  Future<void> seek(Duration position);
  Future<void> setSpeed(double speed);
  Stream<Duration> get positionStream;
  Stream<Duration?> get durationStream;
  Stream<PlayerState> get playerStateStream;
  Stream<int?> get currentIndexStream;
}
