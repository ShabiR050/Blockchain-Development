class Rectangle {
  constructor(area) {
    this.area = area;
  }
  calculateArea() {
    let result = this.area ** 2;
    console.log(`The area of given Square is:- ${result}.`);
  }
}

class Square extends Rectangle {
  constructor(area) {
    super(area);
  }
  showArea() {
    super.calculateArea();
  }
}

let SquareObj = new Square(5);
SquareObj.calculateArea();
