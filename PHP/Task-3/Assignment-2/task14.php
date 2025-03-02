<?php
$nums = [10, 100, -20, 50, 30];

$min = $nums[0];
foreach($nums as $num) :
    if($num < $min){
        $min = $num;
    }       
endforeach;
echo $min;