import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class SeekAudio {
  final AudioRepository repository;

  SeekAudio(this.repository);

  Future<void> call(Duration position) async {
    await repository.seek(position);
  }
}
