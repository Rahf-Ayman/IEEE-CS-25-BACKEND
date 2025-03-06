# PHP Research
### what is PHP?
The term PHP is an acronym for - *Hypertext Preprocessor*. 
PHP is a server-side scripting language created primarily for web development but it is also used as a general-purpose programming language. Unlike client-side languages like JavaScript, which are executed on the user’s browser, PHP scripts run on the server. The results are then sent to the client’s web browser as plain HTML.

### what are the three main error types in PHP?
There are various types of errors in PHP but it contains basically three main type of errors:
1. **Syntax Error**: It is the type of error done by the programmer in the source code of the program. The syntax error is caught by the compiler. After fixing the syntax error the compiler compile the code and execute it.
1. **Fatal Error**: It is the type of error where PHP compiler understand the PHP code but it recognizes an undeclared function. This means that function is called without the definition of function.
    ```php
    <?php 
    
    function add($x, $y) 
    { 
        $sum = $x + $y; 
        echo "sum = " . $sum; 
    } 
    $x = 0; 
    $y = 20; 
    add($x, $y); 
    
    diff($x, $y); 
    ?> 
    ```
1. **Warning Errors** : The main reason of warning errors are including a missing file. This means that the PHP function call the missing file.
    ```php
    <?php  
    
    $x = "GeeksforGeeks"; 
    
    include ("gfg.php"); 
    
    echo $x . "Computer science portal"; 
    ?> 
    ```
### echo vs print.
echo | print
|:-------|:-------
has no return value | has a return value of 1
can take multiple parameters | can take one argument
marginally faster | slower

### Programming language vs Scripting language.

Scripting Language | Programming Language
|:------- |:-------
A scripting language is a language that uses a naive method to bring codes to a runtime environment | A Programming language is a language which is used by humans to navigate their communication with computers. 
They are used to create dynamic web applications | Programming languages are used to write computer programs.
These languages requires a host. | These languages are self executable.
Do not create a .exe file. | These generate .exe files.
Example -: Bash, Ruby, Python, JavaScript etc. | Example -: C++, Java, PHP High-level etc.
These languages requires a host. | These languages are self executable.
Most of the scripting languages are interpreted language. | Most of the programming languages are compiled languages.
All the scripting languages are programming languages. | All the programming languages are not scripting languages.
It does not create any binary files. | It does creates binary files.
It is run inside another program. | It is independently run.
It has low maintenance cost. | It has high maintenance cost.

### Dynamically typed vs Statically typed language.
Statically Typed Languages | Dynamically Typed Languages
|:------- |:-------
Type checking is completed at compile time | Type checking is completed during runtime
Explicit type declarations are usually required |	Explicit declarations are not required
Errors are detected earlier | Type errors are detected later during execution
Variable assignments are static and cannot be changed | Variable assignments are dynamic and can be altered
Produces more optimized code | 	Produces less optimized code, runtime errors are possible

### Assign by Value VS Assign by Reference.
**Pass by value:**
1. In pass-by value, a copy of the value of the argument is passed to the function.

1. The called function works with the copy of the value and any modifications made within the function do not affect the original value outside the function.

1. The original value remains unchanged.

**Pass by reference:**

1. In pass-by reference, a reference or memory address of the argument is passed to the function.

1. The called function can directly access and modify the original value of the argument using the reference.

1. Any modifications made to the parameter within the function will affect the original value outside the function.

### What is the difference between for and foreach loop in PHP?

for loop | foreach loop
|:------- |:-------
The iteration is clearly visible. The block of code is repeated as long as the condition is met or the counter meets a specific value. | The iteration is hidden. The block of code is repeated until iterating over the array is completed.
Good performance. | Better performance.
The stop condition is specified easily. | The stop condition has to be explicitly specified.
Upon working with collections, it needs the usage of the count() function. | It can simply work without the usage of the count() method. 

### Sessions vs. Cookies.
Cookies | Sessions
|:------- |:-------
Stored on the client side (browser). | Stored on the server side.
Less secure, as it is exposed to the client. | More secure, as data is stored on the server.
Faster as data is stored on the client. | Slightly slower as each request requires server processing.
Limited to 4KB per cookie. | Can store large amounts of data.
Can be set manually (maxAge, expires). | Expires automatically after inactivity or when explicitly destroyed.
Often used for storing authentication tokens like JWT. | Commonly used for session-based authentication.

### Error Handling in PHP.
Error handling in PHP is simple. An error message with filename, line number and a message describing the error is sent to the browser.

Ways to handle PHP Errors:  
- Using die() method
- Custom Error Handling

Basic error handling: Using die() function The die() function print a message and exit from current script.
 ```php
        <?php
 
// PHP code to check errors
 
// If file is not present 
// then exit from script
if( !file_exists("geeks.txt") ) {
    die("File is not present");
}
 
// If file is present
// then continue
else {
    $file = fopen("geeks.txt", "w");
}
?>
 ```
 Custom Error handling: Creating a custom error handler in PHP is quite simple. Create a function that can be called when a error has been occurred in PHP.
 ```php
 <?php
 
// Creates my error function which prints message
//to user
function myerror($error_no, $error_msg) {
    echo "Error: [$error_no] $error_msg ";
    echo "\n Now Script will end";
     
    // When error occurred script has to be stopped
    die();
} 
 
// Setting set_error_handler
set_error_handler("myerror");
 
$a = 10;
$b = 0;
 
// This will generate error
echo($a / $b);;
?>
 ```

### How PHP Executes Code.

In PHP, code execution is linear, and the compiling is carried out as well as the executing in cycles per line of a script. Yet, to enhance this flow, PHP uses caching such as opcode caching, which is the set of compiled byte codes that are necessary to run the matter faster in following requests.

Components of Execution Flow:

- Opcode Caching: OPcache helps to optimize PHP execution flow by storing precompiled code. If opcode caching is used, it becomes possible to work with the script loading time that has been reduced by several times.
- Garbage Collection: Most of PHP’s memory management is based on garbage collection, a form of memory recycling necessary for effective handling of big programs. 

##### Resources
- *task 1*
    - [GeeksforGeeks_PHPintro](https://www.geeksforgeeks.org/php-introduction/)
    - [GeeksforGeeks_phperror](https://www.geeksforgeeks.org/php-types-of-errors/)
    - [w3schools](https://www.w3schools.com/php/php_echo_print.asp)
- *task 2*
    - [GeeksforGeeks_scriptOrProg](https://www.geeksforgeeks.org/whats-the-difference-between-scripting-and-programming-languages/)
    - [baeldung](https://www.baeldung.com/cs/statically-vs-dynamically-typed-languages)
    - [medium](https://medium.com/@tesfaygidey21/pass-by-value-vs-pass-by-reference-navigating-the-essence-of-function-parameterization-in-c-4d9fe34896d7)
- *task 3*
    - [GeeksforGeeks_for&foreach](https://www.geeksforgeeks.org/what-is-the-difference-between-for-and-foreach-loop-in-php/)
- *task 4*
    - [GeeksforGeeks_cookies](https://www.geeksforgeeks.org/difference-between-session-and-cookies/)
    - [GeeksforGeeks_error](https://www.geeksforgeeks.org/error-handling-in-php/)
    - [Medium](https://medium.com/@shivanisingh16012004/understanding-php-internals-how-php-executes-code-41576dbc4a7f#:~:text=In%20PHP%2C%20code%20execution%20is,matter%20faster%20in%20following%20requests.)    

