class Hamming {
  int compute(String lhs, String rhs) {
    if (lhs.length != rhs.length) throw new ArgumentError();
    int ham = 0;
    for (int index = 0; index < lhs.length; index++)
      if (lhs[index] != rhs[index]) ham++;
    return ham;
  }
}
