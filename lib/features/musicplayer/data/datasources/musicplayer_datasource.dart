// ignore_for_file: deprecated_member_use

import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';
import 'package:musicapp/gen/assets.gen.dart';

@LazySingleton(as: AudioRepository)
class AudioRepositoryImpl implements AudioRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late final ConcatenatingAudioSource _playlist;

  bool _initialized = false;

  int? _lastIndex;

  AudioRepositoryImpl() {
    _audioPlayer.currentIndexStream.listen((index) async {
      if (index != _lastIndex) {
        _lastIndex = index;
        if (index == 1) {
          await _audioPlayer.setLoopMode(LoopMode.one);
        } else {
          await _audioPlayer.setLoopMode(LoopMode.off);
        }
      }
    });
  }

  @override
  Stream<int?> get currentIndexStream => _audioPlayer.currentIndexStream;

  @override
  Future<void> playWelcomeAudio() async {
    if (_initialized) return;

    _playlist = ConcatenatingAudioSource(
      children: [
        AudioSource.asset(Assets.audios.welcomeAudio),
        AudioSource.asset(Assets.audios.shapeOfYou),
      ],
    );

    await _audioPlayer.setAudioSource(_playlist);
    _initialized = true;

    await _audioPlayer.play();
  }

  @override
  Future<void> playMainAudioLoop() async {
    if (!_initialized) await playWelcomeAudio();
    await _audioPlayer.seek(Duration.zero, index: 1);
    await _audioPlayer.play();
  }

  @override
  Future<void> play() async => await _audioPlayer.play();

  @override
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> seek(Duration position) async =>
      await _audioPlayer.seek(position);

  @override
  Future<void> setSpeed(double speed) async =>
      await _audioPlayer.setSpeed(speed);

  @override
  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  @override
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  @override
  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
