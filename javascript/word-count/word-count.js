module.exports = function(phrase) {
  var wordalizer = {};
  for (var word of phrase.split(/\s+/))
    if (!wordalizer[word]++)
      wordalizer[word] = 1;
  return wordalizer;
}