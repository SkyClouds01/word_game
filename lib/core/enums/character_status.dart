enum CharacterStatus {
  initial,
  focused,
  incorrect,
  correct;

  bool get isInitial => this == CharacterStatus.initial;

  bool get isFocused => this == CharacterStatus.focused;

  bool get isIncorrect => this == CharacterStatus.incorrect;

  bool get isCorrect => this == CharacterStatus.correct;
}
