class Diamond {

  static const int _ascii_a = 65;

  List<String> _alphabet = new List.generate(26, (i) => new String.fromCharCode(i + _ascii_a));

  String _row(String char, int innerPad, int width) {
    StringBuffer buffer = new StringBuffer();
    buffer.writeAll(new List<String>.filled((width - innerPad) ~/ 2 - 1, " "));
    buffer.write(char);
    if (innerPad >= 0) {
      buffer.writeAll(new List<String>.filled(innerPad, " "));
      buffer.write(char);
    }
    buffer.writeAll(new List<String>.filled((width - innerPad) ~/ 2 - 1, " "));
    return buffer.toString();
  }


  List<String> rows(String letter) =>
    _alphabet
      .sublist(0, _alphabet.indexOf(letter) + 1)
      .reversed
      .fold<List<String>>(
        _alphabet.sublist(0, _alphabet.indexOf(letter)).reversed.toList(),
        (list, char) => list..insert(0, char)
      )
      .map((char) => _row(char, _alphabet.indexOf(char) * 2 - 1, _alphabet.indexOf(letter) * 2 + 1))
      .toList();
}
