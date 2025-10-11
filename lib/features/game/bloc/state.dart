part of 'cubit.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required int lives,
    required List<List<PhraseCharacter>> phraseCharacters,
    required Map<String, KeyStatus> keyboardStatus,
    required int activeWordIndex,
    required int activeLetterIndex,
  }) = _GameState;

  factory GameState.initial() {
    return const GameState(
      lives: 3,
      phraseCharacters: [],
      keyboardStatus: {},
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

  bool get isGameOver {
    return lives <= 0;
  }

  bool get isCompleted {
    return keyboardStatus.values.every((status) => status.isInactive);
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
