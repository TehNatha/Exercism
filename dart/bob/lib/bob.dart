class Bob {
  static Map<String, bool Function(String)> teen = {
    "Whoa, chill out!":
      (String phrase) => phrase == phrase.toUpperCase() && phrase.contains(new RegExp(r"[A-Z]")),
    "Sure.":
      (String phrase) => phrase.endsWith("?"),
    "Fine. Be that way!":
      (String phrase) => phrase.trim().isEmpty
  };
  String hey(String phrase) {
    return teen.keys.firstWhere((response) => teen[response](phrase), orElse: ()=>"Whatever.");
  }
}
