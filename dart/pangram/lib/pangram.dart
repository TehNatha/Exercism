class Pangram {
  bool isPangram(String value) =>
    value
      .toLowerCase()
      .split("")
      .where((value) => new RegExp(r"[a-z]").hasMatch(value))
      .toSet()
      .length == 26;
}
