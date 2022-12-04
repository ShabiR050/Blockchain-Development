function find_largest(arr, n) {
    if (arr.length < n) {
        return null;
    }

    arr.sort((a,b) => b - a);
    return arr[n-1];
}
console.log(find_largest([3,45,6,7,23,5,7,8],3));