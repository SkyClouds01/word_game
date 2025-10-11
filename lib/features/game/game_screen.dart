import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_game/features/game/bloc/cubit.dart';
import 'package:word_game/features/game/widgets/_widgets.dart';

class GameScreen extends StatelessWidget {
  static const id = '/game';

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const phrase =
        'This is a large phrase to complete please let me finish this project';

    return BlocProvider(
      create: (context) => GameCubit()..onSetup(phrase),
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade300,
          title: const Text('Phrases Screen'),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: GameView(),
          ),
        ),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GamePhrase(),
        Spacer(),
        GameKeyboard(),
      ],
    );
  }
}
