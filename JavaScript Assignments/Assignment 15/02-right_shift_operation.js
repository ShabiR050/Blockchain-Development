function rightShift(x, y) {
    // base case: if y is 0, return x
    if (y === 0) return x;
  
    // recursive case: divide x by 2, decrement y by 1, and recursively call rightShift
    return rightShift(Math.floor(x / 2), y - 1);
  }
  
  // test the function with some inputs
  console.log(rightShift(8, 1)); // 4
  console.log(rightShift(8, 2)); // 2
  console.log(rightShift(8, 3)); // 1
  console.log(rightShift(8, 4)); // 0
  