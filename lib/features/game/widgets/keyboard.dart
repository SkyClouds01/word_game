import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: firstRow
                  .map(
                    (letter) => GameKey(
                      label: letter,
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
                    onTap: gameCubit.onPreviousLetter,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: GameKey(
                    label: 'NEXT',
                    onTap: gameCubit.onNextLetter,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GameKey extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const GameKey({
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.white,
      elevation: 2,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      child: InkWell(
        onTap: onTap,
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
