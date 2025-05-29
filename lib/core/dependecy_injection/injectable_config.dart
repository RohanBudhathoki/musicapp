// ignore_for_file: await_only_futures

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_config.config.dart';

final GetIt sl = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => await sl.init();
