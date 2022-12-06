/**
 * To create a generator function in JavaScript, you use the function* syntax, which is similar to the regular function syntax, but with an asterisk (*) after the function keyword.
 */

//Here is an example of a generator function in JavaScript:
function* generator() {
  // Generator code goes here...
}

/**
 * nside the generator function, you can use the yield keyword to pause the execution of the function and return a value to the caller. You can then use the caller's next() method to resume the generator's execution, which will run until the next yield keyword is encountered, at which point the generator will pause again and return another value.
 */

//Here is an example of using the yield keyword inside a generator function:
function* generator() {
  yield 1;
  yield 2;
  yield 3;
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

/**
 * Note that you can use the return keyword inside a generator function to return a value and immediately stop the generator's execution. This is similar to how a regular function works, but it allows you to return a value in the middle of a generator function, rather than only at the end.
 */

//Here is an example of using the return keyword inside a generator function:
function* generator() {
  yield 1;
  return 2;
  yield 3;
}

// Create an iterator for the generator
const iterator1 = generator();

// Resume the generator's execution and print the first value
console.log(iterator1.next()); // { value: 1, done: false }

// Resume the generator's execution and print the second value
console.log(iterator1.next()); // { value: 2, done: true }

// Resume the generator's execution and print the final value
console.log(iterator1.next()); // { value: undefined, done: true }

/**
 * In this example, the generator function yields the value 1, then returns the value 2, and then yields the value 3. However, because the return statement stops the generator's execution, the value 3 is never returned. Instead, the generator's final next() call returns the done property with a value of true.
 */