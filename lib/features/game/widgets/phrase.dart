import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_game/core/core.dart';
import 'package:word_game/features/game/bloc/cubit.dart';

class GamePhrase extends StatelessWidget {
  const GamePhrase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: state.phraseCharacters.asMap().entries.map((entry) {
              final wordIndex = entry.key;
              final word = entry.value;

              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: word.asMap().entries.map((character) {
                    final characterIndex = character.key;
                    final value = character.value;
                    final isActive = state.isActiveCharacter(
                      wordIndex,
                      characterIndex,
                    );
                    var status = value.status;
                    if (isActive) {
                      status = CharacterStatus.focused;
                    }

                    return CharacterField(
                      value: value.value,
                      code: value.code.toString(),
                      status: status,
                      isCompleted:
                          state.keyboardStatus[value.value]?.isInactive ??
                          false,
                      onTap: () => context.read<GameCubit>().onFocusLetter(
                        wordIndex,
                        characterIndex,
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class CharacterField extends StatelessWidget {
  final String value;
  final String code;
  final CharacterStatus status;
  final bool isCompleted;
  final VoidCallback? onTap;

  const CharacterField({
    required this.value,
    required this.code,
    this.status = CharacterStatus.initial,
    this.isCompleted = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(4),
    );

    if (status.isFocused) {
      decoration = decoration.copyWith(
        color: Colors.blue.shade100,
        border: Border.all(color: Colors.blue, width: 2),
      );
    } else if (status.isIncorrect) {
      decoration = decoration.copyWith(
        color: Colors.red.shade100,
        border: Border.all(color: Colors.red, width: 2),
      );
    }

    return GestureDetector(
      onTap: status.isCorrect ? null : onTap,
      child: Container(
        decoration: decoration,
        padding: const EdgeInsets.all(2),
        height: 52,
        width: 24,
        child: Column(
          children: [
            Text(
              status.isCorrect ? value : '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
            const Divider(
              color: Colors.black54,
              thickness: 2,
              height: 1,
            ),
            Text(
              isCompleted ? '' : code,
              style: const TextStyle(
                fontSize: 10,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
