// Select the button
let button = document.querySelector("button");

// Set the onclick event of the button to log "hello" to the console
button.onclick = function() {
  console.log("hello");
};

//Alternatively, you could use the addEventListener method to add an event listener to the "click" event of the button, like this:

// Select the button
let button1 = document.querySelector("button");

// Add an event listener to the "click" event of the button
button1.addEventListener("click", function() {
  console.log("hello");
});
