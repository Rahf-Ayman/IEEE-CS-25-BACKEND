<?php
$something = "Programming";

echo <<<code
Hello \\PHP\\
We Love $something
code;

// [1] Fix The Error -> add \ before \ in PHP
// [2] Remove 2 Characters To Get The Output -> remove '' from code 
