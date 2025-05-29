import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class PlayWelcomeAudio {
  final AudioRepository repository;

  PlayWelcomeAudio(this.repository);

  Future<void> call() async {
    await repository.playWelcomeAudio();
  }
}
