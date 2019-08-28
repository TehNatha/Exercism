class Allergies {
  static const Map<String, int> _knownAllergens = const {
    "eggs" : 1,
    "peanuts" : 2,
    "shellfish" : 4,
    "strawberries" : 8,
    "tomatoes" : 16,
    "chocolate" : 32,
    "pollen" : 64,
    "cats" : 128
  };
  bool allergicTo(String allergen, int score) =>
    score & _knownAllergens[allergen] == _knownAllergens[allergen];
  List<String> list(int score) =>
    _knownAllergens.keys.where((allergen) => allergicTo(allergen, score)).toList();
}
