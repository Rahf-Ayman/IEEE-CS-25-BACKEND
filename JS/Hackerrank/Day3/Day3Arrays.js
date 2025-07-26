/**
*   Return the second largest number in the array.
*   @param {Number[]} nums - An array of numbers.
*   @return {Number} The second largest number in the array.
**/
function getSecondLargest(nums) {
    // Complete the function
    let max = nums[0];
    let smax = nums[0];
    for(let i = 0 ;i < nums.length ; i++){
        if(nums[i] > max){
            smax = max;
            max = nums[i];
        }else if(nums[i] > smax && nums[i] != max){
            smax = nums[i];
        }
    }
    return smax;
}