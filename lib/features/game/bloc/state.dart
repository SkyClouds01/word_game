part of 'cubit.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required String completePhrase,
    required List<String> parsedPhrase,
    required List<String> encodedPhrase,
    required Map<String, int> letterToNumber,
    required int activeIndex,
  }) = _GameState;

  factory GameState.initial() {
    return const GameState(
      completePhrase: '',
      parsedPhrase: [],
      encodedPhrase: [],
      letterToNumber: {},
      activeIndex: 0,
    );
  }
}
