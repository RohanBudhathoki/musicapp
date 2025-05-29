import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class PlayAudio {
  final AudioRepository repository;

  PlayAudio(this.repository);

  Future<void> call() async {
    await repository.play();
  }
}
