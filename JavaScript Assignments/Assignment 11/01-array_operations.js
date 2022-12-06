let arr = [1,2,3,4,5]
let oddsum = 0,
  oddCount = 0;
let evensum = 0,
  evenCount = 0;
  console.log(arr,arr.length,Array.isArray(arr))
for (let i = 0; i < arr.length; i++) {
  if (i % 2 == 0) {
    oddCount += 1;
    oddsum += arr[i];
  } else {
    evenCount += 1;
    evensum += arr[i];
  }
}
const avg = (arr) => {
  const sum = arr.reduce((acc, cur) => acc + cur, 0);
  const average = sum / arr.length;
  return average;
};

let GCD;
for (let i = 1; i <= oddsum && i <= evensum; i++) {
  // check if is factor of both integers
  if (oddsum % i == 0 && evensum % i == 0) {
    GCD = i;
  }
}
let diffSum = oddsum - evensum;

console.log("Difference is :", diffSum);
console.log("Sum of numbers in odd places: " + oddsum);
console.log("Sum of numbers in even places: " + evensum);
console.log("Number of elements at odd places: " + oddCount);
console.log("Number of elements at even places: " + evenCount);
console.log("Average of array is:", avg([1, 2, 3, 4, 5]));
console.log("GCD of teo sum is: ", GCD);
