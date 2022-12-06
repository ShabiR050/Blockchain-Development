function num_of_digits(num) {
    // convert the number to a string
    const str = num.toString();
  
    // return the length of the string
    return str.length;
  }
  
  // test the function with some inputs
  console.log(num_of_digits(1000)); // 5
  console.log(num_of_digits(12)); // 2
  console.log(num_of_digits(-12345)); // 5
  console.log(num_of_digits(1305981031)) // 10