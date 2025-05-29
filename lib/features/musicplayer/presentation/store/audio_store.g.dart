// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioStore on _AudioStore, Store {
  late final _$isPlayingAtom =
      Atom(name: '_AudioStore.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$speedAtom = Atom(name: '_AudioStore.speed', context: context);

  @override
  double get speed {
    _$speedAtom.reportRead();
    return super.speed;
  }

  @override
  set speed(double value) {
    _$speedAtom.reportWrite(value, super.speed, () {
      super.speed = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_AudioStore.currentPosition', context: context);

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$currentDurationAtom =
      Atom(name: '_AudioStore.currentDuration', context: context);

  @override
  Duration get currentDuration {
    _$currentDurationAtom.reportRead();
    return super.currentDuration;
  }

  @override
  set currentDuration(Duration value) {
    _$currentDurationAtom.reportWrite(value, super.currentDuration, () {
      super.currentDuration = value;
    });
  }

  late final _$currentAudioIndexAtom =
      Atom(name: '_AudioStore.currentAudioIndex', context: context);

  @override
  int get currentAudioIndex {
    _$currentAudioIndexAtom.reportRead();
    return super.currentAudioIndex;
  }

  @override
  set currentAudioIndex(int value) {
    _$currentAudioIndexAtom.reportWrite(value, super.currentAudioIndex, () {
      super.currentAudioIndex = value;
    });
  }

  late final _$playAsyncAction =
      AsyncAction('_AudioStore.play', context: context);

  @override
  Future<void> play() {
    return _$playAsyncAction.run(() => super.play());
  }

  late final _$pauseAsyncAction =
      AsyncAction('_AudioStore.pause', context: context);

  @override
  Future<void> pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  late final _$seekAsyncAction =
      AsyncAction('_AudioStore.seek', context: context);

  @override
  Future<void> seek(Duration position) {
    return _$seekAsyncAction.run(() => super.seek(position));
  }

  late final _$setSpeedAsyncAction =
      AsyncAction('_AudioStore.setSpeed', context: context);

  @override
  Future<void> setSpeed(double newSpeed) {
    return _$setSpeedAsyncAction.run(() => super.setSpeed(newSpeed));
  }

  late final _$_AudioStoreActionController =
      ActionController(name: '_AudioStore', context: context);

  @override
  void setCurrentAudioIndex(int index) {
    final _$actionInfo = _$_AudioStoreActionController.startAction(
        name: '_AudioStore.setCurrentAudioIndex');
    try {
      return super.setCurrentAudioIndex(index);
    } finally {
      _$_AudioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
speed: ${speed},
currentPosition: ${currentPosition},
currentDuration: ${currentDuration},
currentAudioIndex: ${currentAudioIndex}
    ''';
  }
}
