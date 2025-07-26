/*
 * Complete the Rectangle function
 */
function Rectangle(a, b) {
    let rec = {
        length: a,
        width: b,
        perimeter: (a + b) * 2,
        area: a * b
    }
    return rec;  
}