let str1 = "Work makes me happy";
let str2 = "You give me the feeling of happiness"
let regex = /(happiness)/i
function findHappiness(str) {
    if (regex.test(str)) {
        console.log("Hurray... Hapines is there.")
    }
    else {
        console.log("There is no happiness.")
    }
}

findHappiness(str1);
findHappiness(str2)