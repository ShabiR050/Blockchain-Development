function* iterator() {
  console.log("Azam");
  yield;
  console.log("Sabir");
  console.log("SK");
  yield;
  console.log("Shaikh");
  console.log("SK Sabiruddin");
}

let control = iterator();
console.log(control.next());
console.log(control.next());
console.log(control.next());
console.log(control.next());
