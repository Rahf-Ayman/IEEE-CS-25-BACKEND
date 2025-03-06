<?php
$file = "elzero.txt";
$content = file_get_contents($file); 
$content2 = str_replace("Osamaa", "Elzero", $content); 

file_put_contents($file, $content2); // Write back the modified content

