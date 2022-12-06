function* multiplyGenerator(x, y) {
    yield x * y;
  }
  
  // Create an iterator for the generator
  const iterator = multiplyGenerator(2, 3);
  
  // Resume the generator's execution and print the result of the multiplication
  console.log(iterator.next()); // { value: 6, done: false }
  