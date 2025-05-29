import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class PauseAudio {
  final AudioRepository repository;

  PauseAudio(this.repository);

  Future<void> call() async {
    await repository.pause();
  }
}
