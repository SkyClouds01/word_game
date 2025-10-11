import 'dart:math';

void main() {
  const phrase = 'example phrase';

  final letters = phrase
      .split('')
      .where((char) => RegExp('[a-zA-Z]').hasMatch(char))
      .toSet()
      .toList();

  final availableNumbers = List.generate(26, (i) => i + 1)..shuffle(Random());
  final letterToNumber = <String, int>{};

  for (var i = 0; i < letters.length; i++) {
    letterToNumber[letters[i]] = availableNumbers[i];
  }

  print(letters);
  print(letterToNumber);
}
