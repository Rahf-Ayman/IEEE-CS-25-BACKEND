<?php
$a = 100;
$b = 200;      // Test Case 1
$c = 300;

// $a = 200;
// $b = 100;      // Test Case 2
// $c = 300;

// $a = 200;
// $b = 200;      // Test Case 3
// $c = 100;

if($a > $b)
    echo "A Is Larger Than B";
elseif($a > $c)
    echo "A Is Larger Than C";
else 
    echo "A Is Not Larger Than B Or C";