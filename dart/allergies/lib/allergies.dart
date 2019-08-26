class Allergies {
  static const _knownAllergens = const ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"];
  bool allergicTo(String allergen, int score) => score & (1 << _knownAllergens.indexOf(allergen)) == 1;
}
