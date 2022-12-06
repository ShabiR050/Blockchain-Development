let employees = [
  {
    id: 1,
    name: "Abhinav",
    department: "IT",
    Salary: 75000,
  },
  {
    id: 2,
    name: "Gaurav",
    department: "Sales",
    Salary: 52000,
  },
  {
    id: 3,
    name: "Raj",
    department: "IT",
    Salary: 64000,
  },
];

//a) filter employees according to department = IT
let ITEmployees = employees.filter((item) => item.department === "IT");
console.log(ITEmployees);

//b) filter employees who earn a salary < 65000
let SalEmployees = employees.filter((item) => item.Salary <= 65000);
console.log(SalEmployees);
