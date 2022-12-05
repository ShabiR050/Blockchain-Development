function isArmstrongNumber(num) {
  let originalNum = num;
  let digits = getDigits(num);
  let len = digits.length;
  let sum = 0;

  for (let i = 0; i < len; i++) {
    sum += Math.pow(digits[i], len);
  }

  if (sum == originalNum) {
    return true;
  } else {
    return false;
  }
}

function getDigits(num) {
  let digits = [];
  while (num > 0) {
    digits.push(num % 10);
    num = parseInt(num / 10);
  }
  return digits;
}

console.log(isArmstrongNumber(153));
