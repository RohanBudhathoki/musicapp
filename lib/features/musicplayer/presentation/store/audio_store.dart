// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';
import 'package:rxdart/rxdart.dart';

part 'audio_store.g.dart';

@injectable
class AudioStore = _AudioStore with _$AudioStore;

abstract class _AudioStore with Store {
  final AudioRepository _repository;

  _AudioStore(this._repository) {
    _init();
  }

  late final Stream<Duration> positionStream = _repository.positionStream;
  late final Stream<Duration?> durationStream = _repository.durationStream;
  late final Stream<PlayerState> playerStateStream =
      _repository.playerStateStream;
  late final Stream<int?> currentIndexStream = _repository.currentIndexStream;

  @observable
  bool isPlaying = false;

  @observable
  double speed = 1.0;

  @observable
  Duration currentPosition = Duration.zero;

  @observable
  Duration currentDuration = Duration.zero;

  @observable
  int currentAudioIndex = 0;

  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  StreamSubscription<int?>? _indexSubscription;

  void _init() {
    _repository.playWelcomeAudio();

    _playerStateSubscription = playerStateStream.listen((state) {
      isPlaying = state.playing;
    });

    _positionSubscription = positionStream
        .throttleTime(const Duration(milliseconds: 1))
        .listen((pos) {
          currentPosition = pos;
        });
    _durationSubscription = durationStream.listen((dur) {
      currentDuration = dur ?? Duration.zero;
    });

    _indexSubscription = currentIndexStream.listen((index) {
      if (index != null) {
        setCurrentAudioIndex(index);
      }
    });
  }

  @action
  void setCurrentAudioIndex(int index) {
    currentAudioIndex = index;
  }

  @action
  Future<void> play() async {
    try {
      await _repository.play();
    } catch (e) {
      print("this playing error $e");
    }
  }

  @action
  Future<void> pause() async {
    try {
      await _repository.pause();
    } catch (e) {
      print("this Pause error $e");
    }
  }

  @action
  Future<void> seek(Duration position) async {
    await _repository.seek(position);
  }

  @action
  Future<void> setSpeed(double newSpeed) async {
    speed = newSpeed;
    await _repository.setSpeed(speed);
  }

  void dispose() {
    _playerStateSubscription?.cancel();
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _indexSubscription?.cancel();
  }
}
