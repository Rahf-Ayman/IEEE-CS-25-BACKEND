/**
 * @param {Function} fn
 * @param {number} t milliseconds
 * @return {Function}
 */
var debounce = function(fn, t) {
    
    let timeId
    return function(...args) {
        
        if(timeId !== undefined){
            clearTimeout(timeId);
        }
        
        timeId = setTimeout(_ => fn(...args) , t); 
    }
};

/**
 * const log = debounce(console.log, 100);
 * log('Hello'); // cancelled
 * log('Hello'); // cancelled
 * log('Hello'); // Logged at t=100ms
 */