// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:musicapp/features/musicplayer/data/datasources/musicplayer_datasource.dart'
    as _i496;
import 'package:musicapp/features/musicplayer/domain/repo/music_player_repo.dart'
    as _i267;
import 'package:musicapp/features/musicplayer/domain/usecases/pause_audio.dart'
    as _i986;
import 'package:musicapp/features/musicplayer/domain/usecases/play_audio.dart'
    as _i600;
import 'package:musicapp/features/musicplayer/domain/usecases/play_main_audio_loop.dart'
    as _i869;
import 'package:musicapp/features/musicplayer/domain/usecases/play_welcome_audio.dart'
    as _i903;
import 'package:musicapp/features/musicplayer/domain/usecases/seek_audio.dart'
    as _i627;
import 'package:musicapp/features/musicplayer/domain/usecases/set_speed.dart'
    as _i564;
import 'package:musicapp/features/musicplayer/presentation/store/audio_store.dart'
    as _i91;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i267.AudioRepository>(() => _i496.AudioRepositoryImpl());
    gh.lazySingleton<_i600.PlayAudio>(
        () => _i600.PlayAudio(gh<_i267.AudioRepository>()));
    gh.lazySingleton<_i986.PauseAudio>(
        () => _i986.PauseAudio(gh<_i267.AudioRepository>()));
    gh.lazySingleton<_i564.SetSpeed>(
        () => _i564.SetSpeed(gh<_i267.AudioRepository>()));
    gh.lazySingleton<_i627.SeekAudio>(
        () => _i627.SeekAudio(gh<_i267.AudioRepository>()));
    gh.lazySingleton<_i903.PlayWelcomeAudio>(
        () => _i903.PlayWelcomeAudio(gh<_i267.AudioRepository>()));
    gh.lazySingleton<_i869.PlayMainAudioLoop>(
        () => _i869.PlayMainAudioLoop(gh<_i267.AudioRepository>()));
    gh.factory<_i91.AudioStore>(
        () => _i91.AudioStore(gh<_i267.AudioRepository>()));
    return this;
  }
}
