function* naturalNumbers() {
    let n = 1;
  
    while (true) {
      yield n;
      n++;
    }
  }
  
  // Create an iterator for the generator
  const iterator = naturalNumbers();
  
  // Resume the generator's execution and print the first 10 natural numbers
  for (let i = 0; i < 10; i++) {
    console.log(iterator.next().value);
  }
  