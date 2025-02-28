<?php
$mix = [1, 2, "A", "B", "C", 3, 4];

$num = 0;
$char = 0;

foreach($mix as $i){
    if(is_int($i)){
        $num++;
        echo $i . "<br>";
    }
    elseif(is_string($i))
        $char++;
}
echo "$num Numbers Printed<br>";
echo "$char Letters Ignored";