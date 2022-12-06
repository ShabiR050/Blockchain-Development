// Take array as input from user
var myArray = prompt("Please enter an array of numbers separated by commas").split(",");

// Create an empty array to store unique values 
var uniqueArray = [];

// Create an empty array to store duplicate values 
var duplicatesArray = [];

// Loop through myArray
for (var i = 0; i < myArray.length; i++) {
  // Check if the value exists in the unique array
  var itemFound = false;
  for (var j = 0; j < uniqueArray.length; j++) {
    if (myArray[i] == uniqueArray[j]) {
      itemFound = true;
    }
  }
  // If value doesn't exist in unique array, add it
  if (itemFound == false) {
    uniqueArray.push(myArray[i]);
  } else {
    // If value does exist in unique array, add it to the duplicates array
    duplicatesArray.push(myArray[i]);
  }
}

// Log both arrays
console.log("Original Array:- ",myArray)
console.log("Unique Array: " + uniqueArray.join(", "));
console.log("Duplicates Array: " + duplicatesArray.join(", "));