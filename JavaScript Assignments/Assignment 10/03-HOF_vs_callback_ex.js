//HOF:A function that accepts functions as parameters and/or returns a function is referred to as a "higher-order function.
const isEven = (x) => x > 0 && x % 2 === 0;

const logger = (Fn, Num) => {
  const isEven = Fn(Num);
  console.log(isEven);
};

logger(isEven, 6);

// Callback: A callback is a function that is sent to another function as an argument. After another function has been completed, a callback function can be called.

const log = (output) => console.log(output);

const add = (x, y, callback) => {
  const z = x + y;
  log(z);
};

add(51, 96, log);

//Closure: Variables in JavaScript can be in the local or global scope. Closures can be used to make global variables local (private). A closure is a function that continues to have access to the outer variables after the outer function has been returned.

let countryCode = "+1";

function getPhoneNumber() {
  let phone = "2354687262";
  function encryptedPhone() {
    // A closure function
    let encryptedNumber = phone * 5;
    return countryCode + encryptedNumber;
  }

  return encryptedPhone;
}
getPhoneNumber()(); // +111773436310
