<?php

function calculate($a, $b, $operation = "a"){
    if($operation == "a" || $operation == "add"){
        return $a + $b;
    }elseif($operation == "s" || $operation == "subtract"){
        return $a - $b;
    }elseif($operation == "m" || $operation == "multiply"){
        return $a * $b;
    }elseif($operation == "d" || $operation == "divide"){
        return $a / $b;
    }
}

// Needed Output
echo calculate(10, 20); // 30
echo "<br>";
echo calculate(10, 20, "a"); // 30
echo "<br>";
echo calculate(10, 20, "s"); // -10
echo "<br>";
echo calculate(10, 20, "subtract"); // -10
echo "<br>";
echo calculate(10, 20, "multiply"); // 200
echo "<br>";
echo calculate(10, 20, "m"); // 200