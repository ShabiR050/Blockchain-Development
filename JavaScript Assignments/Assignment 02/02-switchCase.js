let grade = prompt("Enter the grade:-->");
switch (true) {
  case grade >= 90 && grade <= 100:
    console.log("Student has S Grade");
    break;
  case grade >= 80 && grade < 90:
    console.log("Student has A Grade");
    break;
  case grade >= 70 && grade < 80:
    console.log("Student has B Grade");
    break;
  case grade >= 60 && grade < 70:
    console.log("Student has C Grade");
    break;
  case grade >= 50 && grade < 60:
    console.log("Student has D Grade");
    break;
  case grade >= 40 && grade < 50:
    console.log("Student has E Grade");
    break;
  case grade > 0 && grade < 40:
    console.log("Student has failed");
    break;
  default:
    console.log("Invalid marks");
    break;
}
