import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_game/core/core.dart';

part 'cubit.freezed.dart';
part 'state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void onSetup(String phrase) {
    final upperPhrase = phrase.toUpperCase();
    final letters = upperPhrase
        .split('')
        .where((char) => RegExp('[A-Z]').hasMatch(char))
        .toSet()
        .toList();

    final availableNumbers = List.generate(26, (i) => i + 1)..shuffle(Random());
    final letterToNumber = <String, int>{};
    final keyboardStatus = <String, KeyStatus>{};

    for (var i = 0; i < letters.length; i++) {
      letterToNumber[letters[i]] = availableNumbers[i];
      keyboardStatus[letters[i]] = KeyStatus.initial;
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

    final newState = state.copyWith(
      phraseCharacters: phraseLetters,
      keyboardStatus: keyboardStatus,
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

          final newKeyboardStatus = Map<String, KeyStatus>.from(
            state.keyboardStatus,
          );
          final hasMoreLettersToGuess = updatedPhrase.any((word) {
            return word.any(
              (char) => char.value == letter && !char.status.isCorrect,
            );
          });

          if (isCorrect) {
            if (hasMoreLettersToGuess) {
              newKeyboardStatus[letter] = KeyStatus.active;
            } else {
              newKeyboardStatus[letter] = KeyStatus.inactive;
            }
          }

          final newState = state.copyWith(
            phraseCharacters: updatedPhrase,
            keyboardStatus: newKeyboardStatus,
          );
          emit(newState);
        }
      }
    }

    if (isCorrect) {
      onNextLetter();
    } else {
      final newState = state.copyWith(
        lives: state.lives - 1,
      );
      emit(newState);
    }
  }
}
