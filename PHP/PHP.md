# PHP Research
### what is PHP.
The term PHP is an acronym for - *Hypertext Preprocessor*. 
PHP is a server-side scripting language created primarily for web development but it is also used as a general-purpose programming language. Unlike client-side languages like JavaScript, which are executed on the user’s browser, PHP scripts run on the server. The results are then sent to the client’s web browser as plain HTML.

### what are the three main error types in PHP
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

##### Resources
- [GeeksforGeeks_PHPintro](https://www.geeksforgeeks.org/php-introduction/)
- [GeeksforGeeks_phperror](https://www.geeksforgeeks.org/php-types-of-errors/)
- [w3schools](https://www.w3schools.com/php/php_echo_print.asp)