<?php
function multiply(...$args){
    $result = 1;
    
    foreach($args as $arg){
        if(is_numeric($arg)){
            $result *= (int)$arg;
        }
    }
    return $result;
}

// Needed Output
echo multiply(10, 20); // 200
echo "<br>";
echo multiply("A", 10, 30); // 300
echo "<br>";
echo multiply(100.5, 10, "B"); // 1000