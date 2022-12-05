//Taking input:
let number = parseInt(prompt("Enter the integer value:-->"));

if (number < 0) {
  console.log("number should Positive value");
}

function factorial(num) {
  if (num == 0 || num == 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}
console.log(factorial(number));
