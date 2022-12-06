const regex = "([01]?[0-9]|2[0-3]):[0-5][0-9]"
const str = "Lunch at 10:10 in the room 123:456";
const matches = str.match(regex);
console.log(matches); // ["10:10", "123:456"]

// diff o/p