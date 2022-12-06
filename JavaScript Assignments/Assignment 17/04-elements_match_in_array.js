// Define the two arrays
const array1 = ["a", "b", "c", "d", "e"];
const array2 = ["e", "f", "g", "h", "a", "i", "j"];

// Create an iterator for array1
const iterator1 = array1[Symbol.iterator]();

// Iterate over the elements in array1
let current = iterator1.next();
while (!current.done) {
  // Check if the current element exists in array2
  if (array2.includes(current.value)) {
    // If it does, print it as a matching element
    console.log(current.value);
  }

  // Move to the next element in the array
  current = iterator1.next();
}
