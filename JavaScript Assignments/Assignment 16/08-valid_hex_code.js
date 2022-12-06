function isValidHexCode(str) {
  // use a regular expression to match a hex code
  const regex = /^#[0-9A-Fa-f]{6}$/;

  // return true if the string matches the regular expression, otherwise false
  return regex.test(str);
}

// test the function with some inputs
console.log(isValidHexCode("#CD5C5C")); // true
console.log(isValidHexCode("#EAECEE")); // true
console.log(isValidHexCode("#CD5C!C")); // false
console.log(isValidHexCode("FF00FG")); // false
console.log(isValidHexCode("#FF00F")); // false

/**
 
    function isValidHexCode(str) {
  // use the String.prototype.startsWith() method to check if the string starts with a pound key (#)
  if (!str.startsWith("#")) return false;

  // use the String.prototype.match() method to match 6 characters that are digits from 0-9 or alphabetic characters from A-F (uppercase or lowercase)
  const matches = str.match(/[0-9A-Fa-f]{6}/);

  // return true if there are any matches, otherwise false

  //Using conditional operators and loop:-
  
  function validHexCode(str) {
  if (str[0] !== '#' || str.length !== 7) {
    return false;
  }
  
  for (let i = 1; i < str.length; i++) {
    let char = str[i];
    if (!(char >= '0' && char <= '9') && !(char >= 'a' && char <= 'f') && !(char >= 'A' && char <= 'F')) {
      return false;
    }
  }
  return true;
}
 
   */
