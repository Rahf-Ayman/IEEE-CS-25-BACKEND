/**
 * @param {Array} arr
 * @param {Function} fn
 * @return {Array}
 */

let mergeSort = function(arr , l,r , fn){
    if(l < r){
        let mid = Math.floor(l + (r - l) / 2);;
        mergeSort(arr ,l ,mid ,fn);
        mergeSort(arr ,mid + 1 ,r ,fn);
        merge(arr , l ,mid ,r ,fn);
    }
} 

let merge = function(arr , l, mid , r , fn){
    let left = [];
    let right = [];

    let size1 = mid - l + 1;
    let size2 = r - mid;

    for(let i = 0;i < size1;i++){
        left[i] = arr[l + i];
    }

    for(let i = 0;i < size2;i++){
        right[i] = arr[mid + 1 + i];
    }
    let i = 0;
    let j = 0;
    let k = l;

    while(i < size1 && j < size2){
        if(fn(left[i]) <= fn(right[j])){
            arr[k] = left[i];
            i++
        }else{
            arr[k] = right[j];
            j++;
        }
        k++;
    }

    while(i < size1){
        arr[k] = left[i];
        i++;
        k++;
    }

    while(j < size2){
        arr[k] = right[j];
        j++;
        k++;
    }
}
var sortBy = function(arr, fn) {
    mergeSort(arr , 0 , arr.length - 1, fn );
    // arr.sort((a , b) => fn(a) - fn(b)); // with built in function
    return arr;
};