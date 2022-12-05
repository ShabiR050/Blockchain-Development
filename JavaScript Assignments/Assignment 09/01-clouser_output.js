function OuterFunction() {
  var outerVariable = 100;
  function InnerFunction() {
    alert(outerVariable);
  }
  return InnerFunction;
}
var innerFunc = OuterFunction();
innerFunc();

/**
 * a) This innerFunction is a closure function.
 * b)output: 100
 */