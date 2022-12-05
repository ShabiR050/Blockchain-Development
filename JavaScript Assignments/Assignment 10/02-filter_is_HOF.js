/**
 * Yes, filter is a higher order function in JavaScript. It takes a callback function as an argument and returns an array of elements from the original array that pass the given criteria.
 */

 const words = ['spray', 'limit', 'elite', 'exuberant', 'destruction', 'present'];

 const result = words.filter(word => word.length < 6);
 
 console.log(result);