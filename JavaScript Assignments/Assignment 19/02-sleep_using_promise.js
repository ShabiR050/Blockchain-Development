function sleep(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

// Sleep for 1 second
sleep(1000).then(() => {
  console.log("Wake up!");
});
