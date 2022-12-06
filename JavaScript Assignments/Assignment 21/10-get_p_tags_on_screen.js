// Select all the p elements on the page
let ps = document.querySelectorAll("p");

// Get the length of the p elements
let count = ps.length;

// Log the count to the console
console.log(count);

//Alternatively, you could use the getElementsByTagName method to get the p elements, like this:
// Get all the p elements on the page
let pss = document.getElementsByTagName("p");

// Get the length of the p elements
let counts = pss.length;

// Log the count to the console
console.log(counts);
