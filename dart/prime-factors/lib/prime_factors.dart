import 'dart:math';

class PrimeFactors {
  List<int> factors(int value) {
    if (value % 2 == 0){
        List<int> result = [2];
        result.addAll(factors((value/2).floor()));
        return result;
    } else if (value == 1)
      return [];

    for (int i = 3; i <= (sqrt(value)).floor(); i += 2)
      if (value % i == 0) {
        List<int> result = factors(i);
        result.addAll(factors((value/i).floor()));
        return result;
      }

    return [value];
  } 
}
