//1).Using for loop:-
const array = [1, 2, 3, 4, 5];

for (let i = 0; i < array.length; i++) {
  console.log(array[i]);
}

//2).Using forEach method:-
const array1 = [1, 2, 3, 4, 5];

array1.forEach((element) => {
  console.log(element);
});

//3). Using the map method:-
const array2 = [1, 2, 3, 4, 5];

const mappedArray = array2.map((element) => {
  return element * 2;
});

console.log(mappedArray);

//4). Using the for-of loop:-

const array4 = [1, 2, 3, 4, 5];

for (const element of array4) {
  console.log(element);
}

//5). Using the Symbol.iterator property:-
const array5 = [1, 2, 3, 4, 5];
const iterator = array5[Symbol.iterator]();

let current = iterator.next();
while (!current.done) {
  console.log(current.value);
  current = iterator.next();
}
