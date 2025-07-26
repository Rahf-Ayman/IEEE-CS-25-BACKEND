/*
 * Determine the original side lengths and return an array:
 * - The first element is the length of the shorter side
 * - The second element is the length of the longer side
 * 
 * Parameter(s):
 * literals: The tagged template literal's array of strings.
 * expressions: The tagged template literal's array of expression values (i.e., [area, perimeter]).
 */
function sides(literals, ...expressions) {
    
    let s = expressions[1];
    let disc = Math.sqrt(s * s - 16 * expressions[0]);
    
    let s1 = (s + disc) / 4;
    let s2 = (s - disc) / 4;
    
    return [Math.min(s1, s2), Math.max(s1, s2)];
}