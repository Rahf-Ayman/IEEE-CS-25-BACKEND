<?php
$chars = ["E", 1, 2, "l", "z", "E", "R", "o"];

// Output
// "Elzero"
$str2 = implode("", $chars);
echo  ucfirst(strtr(strtolower($str2), ["1" => "", "2" => ""])) . "<br>";