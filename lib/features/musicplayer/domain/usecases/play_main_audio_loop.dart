import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class PlayMainAudioLoop {
  final AudioRepository repository;

  PlayMainAudioLoop(this.repository);

  Future<void> call() async {
    await repository.playMainAudioLoop();
  }
}
