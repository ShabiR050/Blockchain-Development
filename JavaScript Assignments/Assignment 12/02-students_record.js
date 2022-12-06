let map = new Map();

//a) Add data for 3 students (use map functions)
map.set("ids", [001, 002, 003]);
map.set("Names", ["Sabir", "Azam", "Sk"]);
map.set("Score", [80, 70, 90]);
console.log(map);

// b) Get Student Names using map functions
let studentsNames = map.get("Names");
console.log(studentsNames);

//c) Delete Student Marks using map function
let score = map.delete("Score");
console.log(score);
console.log(map);
