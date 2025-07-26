/*
* Complete the reverseString function
* Use console.log() to print to stdout.
*/
function reverseString(s) {
try{
    let arr = s.split(""); // convert to array with , seperator
    arr.reverse(); //reverse
    let arr2 = arr.join(""); // convert to string
    console.log(arr2); 
}catch(err){
    console.log(err.message);
    console.log(s);
} 
}
