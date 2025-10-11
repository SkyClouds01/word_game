import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_game/core/core.dart';
import 'package:word_game/features/game/bloc/cubit.dart';

class GameKeyboard extends StatelessWidget {
  const GameKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    const firstRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    const secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    const thirdRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];
    final gameCubit = context.read<GameCubit>();

    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            return Column(
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: firstRow
                      .map(
                        (letter) => GameKey(
                          label: letter,
                          status:
                              state.keyboardStatus[letter] ?? KeyStatus.initial,
                          onTap: () => gameCubit.onGuess(letter),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: secondRow
                      .map(
                        (letter) => GameKey(
                          label: letter,
                          status:
                              state.keyboardStatus[letter] ?? KeyStatus.initial,
                          onTap: () => gameCubit.onGuess(letter),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: thirdRow
                      .map(
                        (letter) => GameKey(
                          label: letter,
                          status:
                              state.keyboardStatus[letter] ?? KeyStatus.initial,
                          onTap: () => gameCubit.onGuess(letter),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GameKey(
                        label: 'BACK',
                        status: KeyStatus.initial,
                        onTap: gameCubit.onPreviousLetter,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: GameKey(
                        label: 'NEXT',
                        status: KeyStatus.initial,
                        onTap: gameCubit.onNextLetter,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GameKey extends StatelessWidget {
  final String label;
  final KeyStatus status;
  final VoidCallback? onTap;

  const GameKey({
    required this.label,
    required this.status,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.white;
    var foregroundColor = Colors.black;

    if (status.isActive) {
      backgroundColor = Colors.green.shade400;
      foregroundColor = Colors.white;
    } else if (status.isInactive) {
      backgroundColor = Colors.grey.shade300;
      foregroundColor = Colors.black38;
    }

    return Material(
      type: MaterialType.button,
      color: backgroundColor,
      elevation: 2,
      textStyle: TextStyle(
        color: foregroundColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      child: InkWell(
        onTap: status.isInactive ? null : onTap,
        child: Ink(
          height: 48,
          width: 32,
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
