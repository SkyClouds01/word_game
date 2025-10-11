part of 'cubit.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required List<List<PhraseCharacter>> phraseCharacters,
    required int activeWordIndex,
    required int activeLetterIndex,
  }) = _GameState;

  factory GameState.initial() {
    return const GameState(
      phraseCharacters: [],
      activeWordIndex: 0,
      activeLetterIndex: 0,
    );
  }

  const GameState._();

  PhraseCharacter get activeCharacter {
    return phraseCharacters[activeWordIndex][activeLetterIndex];
  }

  bool isActiveCharacter(int wordIndex, int letterIndex) {
    return wordIndex == activeWordIndex && letterIndex == activeLetterIndex;
  }
}

@freezed
abstract class PhraseCharacter with _$PhraseCharacter {
  const factory PhraseCharacter({
    required String value,
    required String guess,
    required int code,
  }) = _PhraseCharacter;

  factory PhraseCharacter.initial() {
    return const PhraseCharacter(
      value: '',
      guess: '',
      code: 0,
    );
  }

  const PhraseCharacter._();

  CharacterStatus get status {
    if (guess.isEmpty) {
      return CharacterStatus.initial;
    } else if (guess == value) {
      return CharacterStatus.correct;
    } else {
      return CharacterStatus.incorrect;
    }
  }
}
