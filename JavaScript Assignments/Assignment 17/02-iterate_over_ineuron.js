// define the word
const word = "iNeuron";

// get the iterator for the word
const iterator = word[Symbol.iterator]();

// iterate over the characters of the word using the iterator
let next = iterator.next();
while (!next.done) {
  // print the current character
  console.log(next.value);

  // get the next character
  next = iterator.next();
}
