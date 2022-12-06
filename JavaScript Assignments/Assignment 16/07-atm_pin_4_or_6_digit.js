function isValid(str) {
  // use a regular expression to match 4 or 6 digits
  const regex = /^\d{4}(?:\d{2})?$/;

  // return true if the string matches the regular expression, otherwise false
  return regex.test(str);
}

// test the function with some inputs
console.log(isValid("1234")); // true
console.log(isValid("123456")); // true
console.log(isValid("12345")); // false
console.log(isValid("1234567")); // false
