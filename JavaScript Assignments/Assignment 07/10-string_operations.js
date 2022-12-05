const str="Hello JavaScript World."

//To Upper Case
const strUpperCase=str.toUpperCase()

//To Lower Case
const strLowerCase=str.toLowerCase()

//Only First Char into Upper Case
const firstCharUpper=str[0].toUpperCase()

//String Dividing and swaping
const len=str.length
const hal=len/2
const firstHalf=str.slice(0,hal)
const secondhalf=str.slice(hal,len)
const merge=firstHalf.concat(secondhalf)
console.log(firstHalf)
console.log(secondhalf)
console.log(merge)

//Counting the repeating charcters
let obj={}
for(x = 0, length = str.length; x < length; x++) {
    var l = str.charAt(x)
    obj[l] = (isNaN(obj[l]) ? 1 : obj[l] + 1);
}

console.log(obj)


//Reversing the String
let reversedStr = str.split("").reverse().join("");
console.log(reversedStr)
