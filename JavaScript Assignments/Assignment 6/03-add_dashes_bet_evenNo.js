function addDashes(num) {
  let result = "";
  let digits = String(num).split("");
  for (let i = 0; i < digits.length; i++) {
    if (
      i > 0 &&
      Number(digits[i]) % 2 === 0 &&
      Number(digits[i - 1]) % 2 === 0
    ) {
      result += "-";
    }
    result += digits[i];
  }
  return result;
}

console.log(addDashes(025468));
