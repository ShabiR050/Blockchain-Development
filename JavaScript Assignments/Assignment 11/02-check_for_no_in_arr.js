let arr1 = [1,2,3,4,5]
let arr2 = [3,4,5,6]
let found1 = arr1.find(num => num === 4);
let found2 = arr2.find(num => num === 4);

if (found1 && found2) {
    console.log("The number 4 exists in both arrays.");
} else if (found1) {
    console.log("The number 4 exists in the first array only.");
} else if (found2) {
    console.log("The number 4 exists in the second")
}