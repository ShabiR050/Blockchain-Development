// Select the two input elements
let input1 = document.querySelector("#input1");
let input2 = document.querySelector("#input2");

// Add an event listener to the "click" event of the "add" button
let addButton = document.querySelector("#add");
addButton.addEventListener("click", function () {
  // Get the values from the input elements
  let value1 = input1.value;
  let value2 = input2.value;

  // Convert the values to numbers
  let number1 = parseInt(value1);
  let number2 = parseInt(value2);

  // Add the numbers together
  let result = number1 + number2;

  // Display the result
  alert(result);
});
