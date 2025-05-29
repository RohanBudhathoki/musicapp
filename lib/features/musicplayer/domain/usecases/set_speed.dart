import 'package:injectable/injectable.dart';
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart';

@lazySingleton
class SetSpeed {
  final AudioRepository repository;

  SetSpeed(this.repository);

  Future<void> call(double speed) async {
    await repository.setSpeed(speed);
  }
}
