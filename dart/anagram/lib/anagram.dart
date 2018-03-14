class Anagram {
  List<String> findAnagrams(String needle, List<String> haystack) {
    List<String> splitNeedle = needle.toLowerCase().split('');
    splitNeedle.sort();
    var sortedNeedle = splitNeedle.join();
    return haystack.where((String straw) {
      List<String> splitStraw = straw.toLowerCase().split('');
      splitStraw.sort();
      var sortedStraw = splitStraw.join().toLowerCase();
      return sortedStraw == sortedNeedle && needle.toLowerCase() != straw.toLowerCase();
    }).toList();
  }
}
