function delay() {
  return new Promise((resolve) => {
    setTimeout(resolve, 1000);
  });
}

delay().then(() => {
  console.log("Delay is over!");
});
