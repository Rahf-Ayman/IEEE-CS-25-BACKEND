/*
 * Modify and return the array so that all even elements are doubled and all odd elements are tripled.
 * 
 * Parameter(s):
 * nums: An array of numbers.
 */

let modifyArray = nums =>
  nums.map(n => (n % 2 === 0 ? n * 2 : n * 3));