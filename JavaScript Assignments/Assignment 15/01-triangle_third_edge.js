function nextEdge(a, b) {
  // calculate the maximum and minimum values of the third edge
  // using the triangle inequality theorem
  if (a < 0 || b < 0) {
    throw new Error("Sides values should be positive!!");
  }
  const max = a + b - 1;
  //const min = Math.abs(a - b) + 1;

  // return the range as an array
  // return [min, max];
  return max;
}

// test the function with some inputs
console.log(nextEdge(8, 10)); //➞ 17
console.log(nextEdge(5, 7)); //➞ 11
console.log(nextEdge(9, 2)); //➞ 10
