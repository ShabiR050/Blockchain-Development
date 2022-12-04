function checkTriangle(sideA, sideB, sideC) {
  let result = "scalene";

  if (sideA === sideB && sideB === sideC) {
    result = "equilateral";
  } else if (sideA === sideB || sideA === sideC || sideB === sideC) {
    result = "isosceles";
  }
  return result;
}

console.log(checkTriangle(21,13,21));