// Select all the h2 elements
let h2s = document.querySelectorAll("h2");

// Loop through the h2 elements
h2s.forEach(function (h2) {
  // Change the color of the h2 element to purple
  h2.style.color = "purple";
});


/**
//Alternatively, you could use the classList property to add a CSS class to each h2 element that contains the desired style, like this:
// Select all the h2 elements
let allh2s = document.querySelectorAll("h2");

// Loop through the h2 elements
allh2s.forEach(function(h2) {
  // Add the "purple" class to the h2 element
  h2.classList.add("purple");
});
.purple {
    color: purple;
  }
*/