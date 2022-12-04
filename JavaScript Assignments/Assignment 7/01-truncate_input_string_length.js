function truncateString(str,length) {
    if (str.length > length) {
        return str.substring(0, length);
    } else {
        return str;
    }
}

console.log(truncateString("Icecream",4))