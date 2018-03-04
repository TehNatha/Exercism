class DifferenceOfSquares {
  
  int squareOfSums(int val) {
    int res = 0;
    for (int i = 1; i <= val; i++) res += i;
    return res * res;
  }
  
  int sumOfSquares(int val) {
    int res = 0;
    for (int i = 1; i <= val; i++) res += i * i;
    return res;
  }
  difference(int val) => squareOfSums(val) - sumOfSquares(val);
}
