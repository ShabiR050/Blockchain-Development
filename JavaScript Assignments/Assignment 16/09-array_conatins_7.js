function boom(arr) {
  // use the Array.prototype.includes() method to check if the array contains the digit 7
  if (arr.includes(7)) {
    return "Boom!";
  } else {
    return "there is no 7 in the array";
  }
}

// test the function with some inputs
console.log(boom([1, 2, 3, 4, 5, 6, 7, 8, 9])); // "Boom!"
console.log(boom([1, 2, 3, 4, 5, 6, 8, 9])); // "there is no 7 in the array"
console.log(boom([7])); // "Boom!"
console.log(boom([])); // "there is no 7 in the array"
