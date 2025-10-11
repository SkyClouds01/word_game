import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_game/core/core.dart';

class WordsApp extends StatelessWidget {
  const WordsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const App();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Game',
      home: AppRouter.homeWidget,
      routes: AppRouter.routes,
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: const Duration(milliseconds: 500),
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
