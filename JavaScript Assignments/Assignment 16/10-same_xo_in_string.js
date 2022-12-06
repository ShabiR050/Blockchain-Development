function matchXO(str) {
  // convert the string to lowercase
  str = str.toLowerCase();

  // count the number of x's and o's in the string
  let xCount = 0;
  let oCount = 0;
  for (const c of str) {
    if (c === "x") xCount++;
    if (c === "o") oCount++;
  }

  // return true if the number of x's and o's is equal, otherwise false
  return xCount === oCount;
}

// test the function with some inputs
console.log(matchXO("oxox")); // true
console.log(matchXO("xooxx")); // false
console.log(matchXO("ooxXm")); // true
console.log(matchXO("XOXOXOXOXOXOXOXOX")); // false
console.log(matchXO("xooxoxoxoxoxoxoxo")); // true
console.log(matchXO("abcd")); // true as "x" and "o" are not in the string, return true.
