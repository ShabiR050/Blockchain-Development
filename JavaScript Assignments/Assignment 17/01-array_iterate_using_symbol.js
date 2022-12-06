// define the list of names
const names = ["John", "Rohn", "Danny", "James"];

// get the iterator for the list
const iterator = names[Symbol.iterator]();

// iterate over the list using the iterator
let next = iterator.next();
while (!next.done) {
  // print the current name
  console.log(next.value);

  // get the next name
  next = iterator.next();
}
/**
 * To make the code more readable and maintainable, you could use other methods, such as the Array.prototype.forEach() method, which allows you to iterate over an array and apply a callback function to each element in the array. 
 */