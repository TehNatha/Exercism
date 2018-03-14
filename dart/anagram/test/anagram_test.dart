import 'package:test/test.dart';
import 'package:anagram/anagram.dart';

Anagram anagram = new Anagram();

void main() {
  group("simple tests", simpleTests);

  group("slightly less simple tests", slightlyLessSimpleTests);

  group("more challenging tests", moreChallengingTests);

  /// Edge cases are scenarios that are problems that occur under specific conditions
  /// Read more: https://en.wikipedia.org/wiki/Edge_case
  group("edge case tests", edgeCaseTests);
}

void simpleTests() {
  test("no matches", () {
    expect(anagram.findAnagrams("diaper", ["hello", "world", "zombies", "pants"]), equals([]));
  });

  test("detects simple anagram", () {
    expect(anagram.findAnagrams("ant", ["tan", "stand", "at"]), equals(["tan"]));
  });

  test("does not detect false positives", () {
    expect(anagram.findAnagrams("galea", ["eagle"]), equals([]));
  });
}

void slightlyLessSimpleTests() {
  test("detects two anagrams", () {
    expect(anagram.findAnagrams("master", ["stream", "pigeon", "maters"]), equals(["stream", "maters"]));
  });

  test("does not detect anagram subsets", () {
    expect(anagram.findAnagrams("good", ["dog", "goody"]), equals([]));
  });

  test("detects anagram", () {
    expect(anagram.findAnagrams("listen", ["enlists", "google", "inlets", "banana"]), equals(["inlets"]));
  });

  test("detects three anagrams", () {
    expect(anagram.findAnagrams("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]),
        equals(["gallery", "regally", "largely"]));
  });
}

void moreChallengingTests() {
  test("does not detect a word as its own anagram", () {
    expect(anagram.findAnagrams("banana", ["Banana"]), equals([]));
  });

  test("does not detect identical words", () {
    expect(anagram.findAnagrams("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]), equals(["cron"]));
  });

  test("does not detect non-anagrams with identical checksum", () {
    expect(anagram.findAnagrams("mass", ["last"]), equals([]));
  });

  test("detects anagrams case-insensitively", () {
    expect(anagram.findAnagrams("Orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  });

  test("detects anagrams using case-insensitive subject", () {
    expect(anagram.findAnagrams("Orchestra", ["cashregister", "carthorse", "radishes"]), equals(["carthorse"]));
  });

  test("detects anagrams using case-insensitive possible matches", () {
    expect(anagram.findAnagrams("orchestra", ["cashregister", "Carthorse", "radishes"]), equals(["Carthorse"]));
  });
}

void edgeCaseTests() {
  test("does not detect a anagram if the original word is repeated", () {
    expect(anagram.findAnagrams("go", ["go Go GO"]), equals([]));
  });

  test("anagrams must use all letters exactly once", () {
    expect(anagram.findAnagrams("tapper", ["patter"]), equals([]));
  });

  test("capital word is not own anagram", () {
    expect(anagram.findAnagrams("BANANA", ["Banana"]), equals([]));
  });
}
