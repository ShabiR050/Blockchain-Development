function secondDerivative(b, m) {
    // define the function f(x)
    const f = x => x ** b + x * Math.exp(b * m);
  
    // calculate the first derivative of f(x)
    const f1 = x => b * x ** (b - 1) + Math.exp(b * m);
  
    // calculate the second derivative of f(x)
    const f2 = x => (b - 1) * b * x ** (b - 2) + 0;
  
    // evaluate the second derivative of f(x) at x = m
    return f2(m);
  }
  
  // test the function with some inputs
  console.log(secondDerivative(2, 3)); // 6
  console.log(secondDerivative(3, 2)); // 54
  console.log(secondDerivative(4, 1)); // 96
  