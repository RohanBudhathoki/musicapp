import 'package:flutter/material.dart';
import 'package:musicapp/core/dependecy_injection/injectable_config.dart';
import 'package:musicapp/musicapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Musicapp());
}
