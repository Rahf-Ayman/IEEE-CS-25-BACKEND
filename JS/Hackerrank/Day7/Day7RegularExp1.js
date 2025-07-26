function regexVar() {
    /*
    * Declare a RegExp object variable named 're'
    * It must match a string that starts and ends with the same vowel (i.e., {a, e, i, o, u})
    */
    let re = {
        test(s){
        if(s[0] == s[s.length - 1] && (s[0] == 'a'
        || s[0] == 'e' || s[0] == 'i' || s[0] == 'o'
        || s[0] == 'u')){
            return true;
        }else{
            return false;
        } 
        }
    }
    /*
    * Do not remove the return statement
    */
    return re;
}