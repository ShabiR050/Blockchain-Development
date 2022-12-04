function sumMultiples(max) {
  let sum = 0;
  for (let i = 0; i < max; i++) {
    if (i % 3 === 0 || i % 5 === 0) {
      sum += i;
    }
  }
  return sum;
}
console.log(sumMultiples(1000));
