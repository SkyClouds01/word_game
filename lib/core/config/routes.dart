import 'package:flutter/cupertino.dart';
import 'package:word_game/features/features.dart';

abstract final class AppRouter {
  static const homeWidget = HomeScreen();

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      HomeScreen.id: (context) => const HomeScreen(),
      GameScreen.id: (context) => const GameScreen(),
    };
  }
}
