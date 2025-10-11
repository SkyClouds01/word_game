import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/core/core.dart';

part 'cubit.freezed.dart';
part 'state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void onSetup(String phrase) {
    // // Get unique letters (excluding spaces and punctuation)
    final upperPhrase = phrase.toUpperCase();
    final letters = upperPhrase
        .split('')
        .where((char) => RegExp('[A-Z]').hasMatch(char))
        .toSet()
        .toList();

    // Create random number assignments (1-9)
    final availableNumbers = List.generate(26, (i) => i + 1)..shuffle(Random());
    final letterToNumber = <String, int>{};

    for (var i = 0; i < letters.length; i++) {
      letterToNumber[letters[i]] = availableNumbers[i];
    }

    final phraseWords = upperPhrase.split(' ');
    final phraseLetters = phraseWords.map((word) {
      return word.split('').map((char) {
        return PhraseCharacter(
          value: char,
          guess: '',
          code: letterToNumber[char]!,
        );
      }).toList();
    }).toList();

    // // Encode the phrase
    // final encodedPhrase = upperPhrase.split('').map((char) {
    //   if (letterToNumber.containsKey(char)) {
    //     return letterToNumber[char]!.toString();
    //   }
    //   return char; // Keep spaces and punctuation as-is
    // }).toList();

    final newState = state.copyWith(
      phraseCharacters: phraseLetters,
    );
    emit(newState);
  }

  void onFocusLetter(int wordIndex, int letterIndex) {
    final newState = state.copyWith(
      activeWordIndex: wordIndex,
      activeLetterIndex: letterIndex,
    );

    emit(newState);
  }

  void onPreviousLetter() {
    var wordIndex = state.activeWordIndex;
    var letterIndex = state.activeLetterIndex;

    if (wordIndex >= 0) {
      if (letterIndex > 0) {
        letterIndex--;
      } else if (wordIndex > 0) {
        wordIndex--;
        letterIndex = state.phraseCharacters[wordIndex].length - 1;
      }
    }

    final newState = state.copyWith(
      activeWordIndex: wordIndex,
      activeLetterIndex: letterIndex,
    );

    emit(newState);
  }

  void onNextLetter() {
    var wordIndex = state.activeWordIndex;
    var letterIndex = state.activeLetterIndex;

    if (wordIndex < state.phraseCharacters.length) {
      final currentWord = state.phraseCharacters[wordIndex];
      if (letterIndex < currentWord.length - 1) {
        letterIndex++;
      } else if (wordIndex < state.phraseCharacters.length - 1) {
        wordIndex++;
        letterIndex = 0;
      }
    }

    final newState = state.copyWith(
      activeWordIndex: wordIndex,
      activeLetterIndex: letterIndex,
    );

    emit(newState);
  }

  void onGuess(String letter) {
    final newGuess = state.activeCharacter.copyWith(guess: letter);
    final isCorrect = letter == state.activeCharacter.value;

    for (var i = 0; i < state.phraseCharacters.length; i++) {
      for (var j = 0; j < state.phraseCharacters[i].length; j++) {
        final isActiveWord = i == state.activeWordIndex;
        final isActiveLetter = j == state.activeLetterIndex;
        if (isActiveWord && isActiveLetter) {
          final updatedWord = List<PhraseCharacter>.from(
            state.phraseCharacters[i],
          );
          updatedWord[j] = newGuess;
          final updatedPhrase = List<List<PhraseCharacter>>.from(
            state.phraseCharacters,
          );
          updatedPhrase[i] = updatedWord;
          emit(state.copyWith(phraseCharacters: updatedPhrase));
        }
      }
    }
    final newState = state.copyWith(
      phraseCharacters: state.phraseCharacters.map((word) {
        return word.map((character) {
          return character == state.activeCharacter ? newGuess : character;
        }).toList();
      }).toList(),
    );

    emit(newState);

    if (isCorrect) {
      onNextLetter();
    }
  }
}
