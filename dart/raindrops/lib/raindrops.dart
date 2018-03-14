class Raindrops {
  Map<String, int> rain = {
    "Pling": 3,
    "Plang": 5,
    "Plong": 7
  };
  String convert(int number) {
    var drops = rain.keys.where((key) => number % rain[key] == 0).join();
    if (drops.length == 0) drops += number.toString();
    return drops;
  }
}
