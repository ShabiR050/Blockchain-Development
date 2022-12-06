/**
 * he main difference between a generator and a function is that a generator is a special type of function that can be paused and resumed at any point, while a regular function always runs to completion.

A generator is a function that uses the yield keyword to pause its execution and return a value to the caller. When the generator is called, it does not run immediately, but instead returns a special iterator object that can be used to control the execution of the generator. The caller can then use the iterator's next() method to resume the generator's execution, which will run until the next yield keyword is encountered, at which point the generator will pause again and return another value. This process can be repeated until the generator reaches the end of its execution and returns the done property with a value of true.
 */

// Here is an example of a generator function in JavaScript:

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
 * In contrast, a regular function always runs to completion when it is called. It cannot be paused and resumed, and it always returns a single value when it is done executing.
 */

//Here is an example of a regular function in JavaScript:
function regularFunction() {
  return 1;
}

console.log(regularFunction()); // 1

/**
 * Generator functions are often used to implement iterators, because they allow the caller to control the iteration process, rather than having the function run to completion and return all of the values at once. This can be useful for working with large or infinite sequences of data, where it is not practical to store all of the values in memory at once.
 */