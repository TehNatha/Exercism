class WordCount {
  countWords(String val) {
    var value = val
        .toLowerCase()
        .replaceAll(new RegExp(r"(' | ')"), " ")
        .replaceAll(new RegExp(r"[.,?!:;""@&@\$%\^]+"), " ")
        .replaceAll(new RegExp(r"\s+"), " ")
        .trim();
    var wordList = value.split(new RegExp(r"\s+"));
    var wordSet = new Set.from(wordList);
    var wordMap = new Map.fromIterable(wordSet,
        key: (word) => word,
        value: (word) => wordList.where((item) => item == word).length);
    return wordMap;
  }
}
