let year = prompt("Enter the year to check leap year or not :-->");

function leapYear(year) {
  if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
    console.log(`${year} is Leap year!`);
  } else {
    console.log(`${year} is not a Leap Year.`);
  }
}

leapYear(year);
