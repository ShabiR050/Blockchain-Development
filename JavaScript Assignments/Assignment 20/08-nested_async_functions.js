/**
 * Yes, it is possible to nest async functions in JavaScript. An async function is just a function that contains the async keyword in its declaration and uses the await keyword to wait for the completion of a Promise.
 */

//Here is an example of a nested async function:
async function outer() {
  console.log("I am the outer function");

  async function inner() {
    console.log("I am the inner function");
  }

  await inner();
}

outer();
/**
 * In this example, the outer function is an async function that contains an inner async function called inner. The outer function uses the await keyword to wait for the inner function to complete before continuing.
 */