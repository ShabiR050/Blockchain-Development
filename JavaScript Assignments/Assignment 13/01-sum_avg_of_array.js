// define the input array
const arr = [1, 2, 3, 4, 5];

// calculate the sum and average of the array elements
const result = arr.reduce(
  (acc, x) => {
    acc.sum += x;
    acc.count++;
    return acc;
  },
  { sum: 0, count: 0 }
);

// calculate the average
const avg = result.sum / result.count;

console.log(`Sum: ${result.sum}, Average: ${avg}`);
