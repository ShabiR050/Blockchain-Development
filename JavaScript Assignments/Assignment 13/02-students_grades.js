let students = [
  { name: "John", marks: 92 },
  { name: "Oliver", marks: 85 },
  { name: "Michael", marks: 79 },
  { name: "Dwight", marks: 95 },
  { name: "Oscar", marks: 64 },
  { name: "Kevin", marks: 48 },
];

//a) Calculate grades on basis of marks and b)map the grades of each student:
// define the grade boundaries
const boundaries = {
  A: 90,
  B: 80,
  C: 70,
  D: 60,
  E: 50,
};

// iterate over the students and calculate their grades
students.forEach((student) => {
  // get the marks of the current student
  const marks = student.marks;

  // initialize the grade to "F"
  let grade = "F";

  // iterate over the grade boundaries
  for (const [key, value] of Object.entries(boundaries)) {
    // check if the student's marks are equal to or higher than the boundary
    if (marks >= value) {
      // if so, set the grade to the corresponding grade letter
      grade = key;
      // stop iterating over the boundaries
      break;
    }
  }

  // add the grade property to the student object
  student.grade = grade;
});

// display the students with their grades
console.log(students);

//c) Group students according to the grades they have received and display:

// create an object to store the groups
const groups = {};

// iterate over the students and group them by grade
students.forEach((student) => {
  // get the grade of the current student
  const grade = student.grade;

  // check if the grade is already in the groups object
  if (!groups[grade]) {
    // if not, create a new array for the grade
    groups[grade] = [];
  }

  // add the student to the array for their grade
  groups[grade].push(student);
});

// display the groups
console.log(groups);

// let stuGradesA = students.filter((item) => item.marks >= 90);
// let A = stuGradesA.map(({ name, marks }) => ({ name, Grade: "A" }));
// console.log(A);

// let stuGradesB = students.filter((item) => item.marks >= 80 && item.marks < 90);
// let B = stuGradesB.map(({ name, marks }) => ({ name, Grade: "B" }));
// console.log(B);

// let stuGradesC = students.filter((item) => item.marks >= 70 && item.marks < 80);
// let C = stuGradesC.map(({ name, marks }) => ({ name, Grade: "C" }));
// console.log(C);

// let stuGradesD = students.filter((item) => item.marks >= 60 && item.marks < 70);
// let D = stuGradesD.map(({ name, marks }) => ({ name, Grade: "D" }));
// console.log(D);

// let stuGradesE = students.filter((item) => item.marks >= 50 && item.marks < 60);
// let E = stuGradesE.map(({ name, marks }) => ({ name, Grade: "E" }));
// console.log(E);

// let stuGradesF = students.filter((item) => item.marks < 50);
// let F = stuGradesF.map(({ name, marks }) => ({ name, Grade: "F" }));
// console.log(F);
