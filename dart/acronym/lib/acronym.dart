class Acronym {

  String abbreviate(String name) =>
    name
      .replaceAll("_", "")
      .split(new RegExp(r"[\s-]"))
      .map((word) => word.length > 1 ? word[0] : word)
      .map((letter) => letter.toUpperCase())
      .where((item) => item.contains(new RegExp(r"[A-Z]")))
      .reduce((result, item) => result + item);
}
