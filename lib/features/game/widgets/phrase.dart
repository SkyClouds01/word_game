import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_game/features/game/bloc/cubit.dart';

class GamePhrase extends StatelessWidget {
  const GamePhrase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          final words = state.completePhrase.split(' ');
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: words.map((word) {
              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: word.split('').map(
                    (letter) {
                      var status = LetterStatus.initial;
                      if (state.activeIndex == 0) {
                        status = LetterStatus.focused;
                      }

                      return LetterField(
                        value: letter,
                        status: status,
                      );
                    },
                  ).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

enum LetterStatus {
  initial,
  focused,
  incorrect,
  correct;

  bool get isInitial => this == LetterStatus.initial;

  bool get isFocused => this == LetterStatus.focused;

  bool get isIncorrect => this == LetterStatus.incorrect;

  bool get isCorrect => this == LetterStatus.correct;
}

class LetterField extends StatelessWidget {
  final String value;
  final String encryptedValue;
  final LetterStatus status;

  const LetterField({
    required this.value,
    this.encryptedValue = '31',
    this.status = LetterStatus.initial,
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
    } else if (status.isCorrect) {
      decoration = decoration.copyWith(
        color: Colors.green.shade100,
        border: Border.all(color: Colors.green, width: 2),
      );
    }

    return Container(
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
            status.isCorrect ? '' : encryptedValue,
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
