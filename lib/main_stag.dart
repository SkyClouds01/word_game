import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:word_game/core/core.dart';

Future<void> main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  Bloc.observer = const SCBlocLogger();

  // Initialize dependencies

  // Run the app
  runApp(const WordsApp());

  FlutterNativeSplash.remove();
}
