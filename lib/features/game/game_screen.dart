import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_game/features/game/bloc/cubit.dart';
import 'package:word_game/features/game/widgets/_widgets.dart';

class GameScreen extends StatelessWidget {
  static const id = '/game';

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const phrase = 'This is a large phrase ';

    return BlocProvider(
      create: (context) => GameCubit()..onSetup(phrase),
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade300,
          title: BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    index < state.lives
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  );
                }),
              );
            },
          ),
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
