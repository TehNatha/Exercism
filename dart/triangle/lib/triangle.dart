class Triangle {

  bool _triangle(num a, num b, num c) =>
    a + b + c != 0 &&
    a + b >= c &&
    a + c >= b &&
    b + c >= a;

  int _uniqueSides(num a, num b, num c) =>
    [a, b, c].toSet().length;

  bool equilateral(num a, num b, num c) =>
    _triangle(a, b, c) &&
    _uniqueSides(a, b, c) == 1;

  bool isosceles(num a, num b, num c) =>
    _triangle(a, b, c) &&
    _uniqueSides(a, b, c) <= 2;

  bool scalene(num a, num b, num c) =>
    _triangle(a, b, c) &&
    _uniqueSides(a, b, c) == 3;
}
