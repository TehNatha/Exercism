class RnaTranscription {
  Map<String, String> transcription = {
    "G":"C",
    "C":"G",
    "T":"A",
    "A":"U"
  };
  String toRna (String dna) {
    if (dna.contains(new RegExp(r"[^GCTA]"))) throw new ArgumentError();
    return dna.split('').map((x) => transcription[x]).join();
  }
}
