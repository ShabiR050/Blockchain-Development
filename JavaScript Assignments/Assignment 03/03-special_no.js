function isSpecialNo(n) {
  let sum = 0;
  let temp = n;

  while (temp != 0) {
    sum = sum + factorial(temp % 10);

    temp = parseInt(temp / 10);
  }
  return sum == n;
}

function factorial(num) {
  if (num == 0 || num == 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}

console.log(isSpecialNo(145))
