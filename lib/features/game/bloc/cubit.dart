import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit.freezed.dart';
part 'state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  /// Encodes a phrase for the cryptogram game
  /// Each unique letter gets mapped to a random number (1-9)
  /// Maximum 9 unique letters per phrase
  void onSetup(String phrase) {
    final upperPhrase = phrase.toUpperCase();

    // Get unique letters (excluding spaces and punctuation)
    final letters = upperPhrase
        .split('')
        .where((char) => RegExp(r'[A-Z]').hasMatch(char))
        .toSet()
        .toList();

    // Create random number assignments (1-9)
    final availableNumbers = List.generate(26, (i) => i + 1)..shuffle(Random());
    final letterToNumber = <String, int>{};

    for (var i = 0; i < letters.length; i++) {
      letterToNumber[letters[i]] = availableNumbers[i];
    }

    // Encode the phrase
    final encodedPhrase = upperPhrase.split('').map((char) {
      if (letterToNumber.containsKey(char)) {
        return letterToNumber[char]!.toString();
      }
      return char; // Keep spaces and punctuation as-is
    }).toList();

    emit(
      state.copyWith(
        completePhrase: upperPhrase,
        parsedPhrase: upperPhrase.split(''),
        encodedPhrase: encodedPhrase,
        letterToNumber: letterToNumber,
      ),
    );
  }
}
