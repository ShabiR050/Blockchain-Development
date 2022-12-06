function doubleLetters(word) {
    // use a regular expression to match two consecutive identical letters
    const regex = /([a-zA-Z])\1/;
  
    // return true if the word matches the regular expression, otherwise false
    return regex.test(word);
  }
  
  // test the function with some inputs
  console.log(doubleLetters("hello")); // true
  console.log(doubleLetters("world")); // false
  console.log(doubleLetters("banana")); // false
  console.log(doubleLetters("yummy")) // true

  /**
    function doubleLetters(word) {
    // use the String.prototype.match() method to match two consecutive identical letters
    const matches = word.match(/([a-zA-Z])\1/);
  
    // return true if there are any matches, otherwise false
    return matches != null;
  }
  */
  