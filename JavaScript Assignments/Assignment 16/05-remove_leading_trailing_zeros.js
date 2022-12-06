function removeZeros(n) {
  // remove the leading zeros using a regular expression
  n = n.replace(/^0+/, "");

  // remove the trailing zeros using a regular expression
  n = n.replace(/0+$/, "");

  // return the resulting number
  return n;
}

// test the function with some inputs
console.log(removeZeros("00402")); // 12345
console.log(removeZeros("230.000")); // 12345
console.log(removeZeros("00001234500000")); // 12345

//  To make the code more readable and maintainable, you could use other methods, such as the String.prototype.trimStart() and String.prototype.trimEnd() methods, which remove the leading and trailing white space (including zeros) from a string.
