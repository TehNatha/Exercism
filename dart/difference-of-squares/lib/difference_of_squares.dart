class DifferenceOfSquares {
  list(val) => new Iterable.generate(val, (i) => i + 1);
  square(val) => val * val;
  sum(left, right) => left + right;
  squareOfSums(int val) => square(list(val).reduce(sum));
  sumOfSquares(int val) => list(val).map(square).reduce(sum);
  difference(int val) => squareOfSums(val) - sumOfSquares(val);
}
