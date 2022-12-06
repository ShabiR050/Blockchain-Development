/**
 * Yes, it is possible to use async/await with promise chains in JavaScript. To use async/await with promise chains, you can mark the function that contains the promise chain as async, and then use the await keyword to wait for each promise in the chain to be resolved before continuing with the next step in the chain.
 */
//Here is an example of using async/await with a promise chain in JavaScript:

async function promiseChain() {
  // Step 1: Start the promise chain by creating a new promise
  let result = await new Promise((resolve) => {
    setTimeout(() => {
      resolve("First step!");
    }, 1000);
  });

  // Step 2: Wait for the previous promise to be resolved, and then
  //         continue the chain by creating a new promise
  result = await new Promise((resolve) => {
    setTimeout(() => {
      resolve(result + " Second step!");
    }, 1000);
  });

  // Step 3: Wait for the previous promise to be resolved, and then
  //         continue the chain by creating a new promise
  result = await new Promise((resolve) => {
    setTimeout(() => {
      resolve(result + " Third step!");
    }, 1000);
  });

  // Step 4: Wait for the previous promise to be resolved, and then
  //         return the final result of the promise chain
  return result;
}

// Start the promise chain and print the final result
promiseChain().then((result) => {
  console.log(result); // "First step! Second step! Third step!"
});

/**
 * In this example, the promiseChain() function is marked as async, which allows you to use the await keyword inside the function. The promiseChain() function uses the await keyword to wait for each promise in the chain to be resolved before continuing with the next step in the chain.
 */
