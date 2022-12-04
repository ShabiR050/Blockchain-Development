let temperature = prompt("Enter the Value:");

function convertToCelsius(temperature) {
    return (temperature - 32) * (5 / 9);
}

function convertToFahrenheit(temperature) {
    return (temperature * (9 / 5)) + 32;
}

console.log(convertToCelsius(cel) + "°C");
console.log(convertToFahrenheit(fahrenheit) + "°F");