/**
 * @param {integer} init
 * @return { increment: Function, decrement: Function, reset: Function }
 */
var createCounter = function(init) {
    let c = init;
    return {
        increment: _ => ++c
        ,
        reset: _ =>{
            c = init;
            return c;
        },
        decrement: _ => --c
        
        
    }
};

/**
 * const counter = createCounter(5)
 * counter.increment(); // 6
 * counter.reset(); // 5
 * counter.decrement(); // 4
 */