/**
 * @param {number} n
 * @return {Function} counter
 */
var createCounter = function(n) {
    let c = n - 1;
    return function() {
        return ++c;
    };
};

/** 
 * const counter = createCounter(10)
 * counter() // 10
 * counter() // 11
 * counter() // 12
 */