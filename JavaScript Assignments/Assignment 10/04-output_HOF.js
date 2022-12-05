const names = ["John", "Tina", "Kale", "Max"];
function useFunction(arr, fn) {
  for (let i = 0; i < arr.length; i++) {
    fn(arr[I]);
  }
}
function argFn(name) {
  console.log("Hello " + name);
}
useFunction(names, argFn);

//Output: ReferenceError: I is not defined

/**  if i isdefined then, :-
Hello John
Hello Tina
Hello Kale
Hello Max
*/