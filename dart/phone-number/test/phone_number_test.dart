import 'package:test/test.dart';
import 'package:phone_number/phone_number.dart';

final phoneNumber = new PhoneNumber();

void main() {
  group("PhoneNumber: Cleanup special characters - ", cleanUpTest);
  group("PhoneNumber: Number length - ", numberLengthTest);
  group("PhoneNumber: Accept only numbers - ", numbersOnlyTest);
  group("PhoneNumber: Area/Exchange Code - ", codeRangeTest);
  group("PhoneNumber: Edge cases - ", edgeCases);
}

void cleanUpTest() {
  test("cleans the number", () {
    expect(phoneNumber.cleanNumber("(223) 456-7890"), equals("2234567890"));
  }, skip: false);
  test("cleans numbers with multiple spaces", () {
    expect(phoneNumber.cleanNumber("223 456   7890   "), equals("2234567890"));
  });
  test("cleans numbers with dots", () {
    expect(phoneNumber.cleanNumber("223.456.7890"), equals("2234567890"));
  });
}

void numberLengthTest() {
  test("invalid when 9 digits", () {
    expect(phoneNumber.cleanNumber("123456789"), equals(null));
  });
  test("invalid when 11 digits and does not start with a 1", () {
    expect(phoneNumber.cleanNumber("22234567890"), equals(null));
  });
  test("valid when 11 digits and starting with 1", () {
    expect(phoneNumber.cleanNumber("12234567890"), equals("2234567890"));
  });
  test("valid when 11 digits and starting with 1 even with punctuation", () {
    expect(phoneNumber.cleanNumber("+1 (223) 456-7890"), equals("2234567890"));
  });
  test("invalid when more than 11 digits", () {
    expect(phoneNumber.cleanNumber("321234567890"), equals(null));
  });
}

void numbersOnlyTest() {
  test("invalid with letters", () {
    expect(phoneNumber.cleanNumber("123-abc-7890"), equals(null));
  });
  test("invalid with punctuations", () {
    expect(phoneNumber.cleanNumber("123-@:!-7890"), equals(null));
  });
}

void codeRangeTest() {
  test("invalid if area code does not start with 2-9", () {
    expect(phoneNumber.cleanNumber("(123) 456-7890"), equals(null));
  });
  test("invalid if exchange code does not start with 2-9", () {
    expect(phoneNumber.cleanNumber("(223) 056-7890"), equals(null));
  });
}

void edgeCases() {
  test("invalid if passes all other tests but contains special characters", () {
    expect(phoneNumber.cleanNumber("123-@:!-78901256"), equals(null));
  });
}
