function* generator() {
  try {
    yield 1;
    yield 2;
    yield 3;

    throw new Error("Something went wrong!");
  } catch (error) {
    console.error(error.message);
  }
}

// Create an iterator for the generator
const iterator = generator();

// Resume the generator's execution and print the first value
console.log(iterator.next()); // { value: 1, done: false }

// Resume the generator's execution and print the second value
console.log(iterator.next()); // { value: 2, done: false }

// Resume the generator's execution and print the third value
console.log(iterator.next()); // { value: 3, done: false }

// Resume the generator's execution and print the final value
console.log(iterator.next()); // { value: undefined, done: true }
