
/*Create a set object with four random numbers from 0 to 10. Check if this
newly created set object has 8 in it. Use set object methods.
*/

let mySet = new Set();
while (mySet.size < 4) {
  mySet.add(Math.floor(Math.random() * 11));
}
console.log(mySet)
console.log(mySet.has(8)); 