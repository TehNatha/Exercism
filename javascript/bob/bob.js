//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

var responders = [
  {
    response: 'Fine. Be that way!',
    test: function(input) {
      return !input.match(/[a-z0-9]/i);
    }
  },
  {
    response: 'Whoa, chill out!',
    test: function(input) {
      return input.replace(/[a-z]/i,'') !== input && input.toUpperCase() === input;
    }
  },
  {
    response: 'Sure.',
    test: function(input) {
      return input.substr(-1) === '?';
    }
  },
  {
    response: 'Whatever.',
    test: function(input) {
      return true;
    }
  }
];

Bob.prototype.hey = function(input) {
  for (responder of responders)
    if (responder.test(input))
      return responder.response;
};

module.exports = Bob;