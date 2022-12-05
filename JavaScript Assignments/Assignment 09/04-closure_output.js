for (var i = 0; i < 3; i++) {
  setTimeout(function log() {
    console.log(i); // What is logged?
  }, 1000);
}

// output: 3 3 3
// if you change var to let, then output ll be: 0 1 2