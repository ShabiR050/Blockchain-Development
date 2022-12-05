let rowNo = parseInt(prompt("Enter the no of rows to dispaly :-->"));
let string = "";
let count = 1;
for (let i = 1; i <= rowNo; i++) {
  for (let j = 1; j <= i; j++) {
    string += count;
    count++;
  }
  string += "\n";
}
console.log(string);
