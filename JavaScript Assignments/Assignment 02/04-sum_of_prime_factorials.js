function factorialPrimes(start, end) {
  let result = 1;
  for (let i = start; i <= end; i++) {
    if (isPrime(i)) {
      result += factorial(i);
    }
  }
  return result;
}

function isPrime(num) {
  let isPrime = true;
  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i == 0) {
      isPrime = false;
      break;
    }
  }
  return isPrime;
}

function factorial(num) {
  if (num == 0 || num == 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}

console.log(factorialPrimes(1, 100));
