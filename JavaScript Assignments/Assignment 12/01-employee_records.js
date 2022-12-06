let employees = [
  {
    id: 1,
    Name: "Sabir",
    salary: 80000,
  },
  {
    id: 2,
    Name: "Azam",
    salary: 50000,
  },
  {
    id: 3,
    Name: "Shaikh",
    salary: 120000,
  },
  {
    id: 4,
    Name: "SK",
    salary: 100000,
  },
];

//Print an array of all employee ids
let arrayOfEmpIDs = employees.map((item) => item.id);
console.log(arrayOfEmpIDs);

//Print count of employees
let empCount = employees.length;
console.log(empCount);

//Print the name of the employee according to their id { key: value }
let nameOfEmpByID = employees.map(({ id, Name }) => ({ id, Name }));
console.log(nameOfEmpByID);

//Store the salaries of all employees in an array

let empSalaries = employees.map((item) => item.salary);
console.log(empSalaries);

//Calculate the average salary the company is paying to its employees
let avgSalary =
  empSalaries.reduce((sum, num) => sum + num, 0) / empSalaries.length;
console.log(avgSalary);
