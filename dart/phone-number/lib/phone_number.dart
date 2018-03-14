class PhoneNumber {
  String cleanNumber(String number) {
    if (number.contains(new RegExp(r"[!\:@]"))) return null;

    String digits = new RegExp(r"[0-9]")
      .allMatches(number)
      .map((item) => item.group(0))
      .reduce((lhs, rhs) => lhs + rhs);

    if (digits[0] == "1") digits = digits.substring(1);
    if (digits.length != 10) return null;
    if (digits[3] == "1" || digits[3] == "0") return null;
    return digits;
  }
}
