<?php
$help_num = 0;
$nums = [2, 4, 5, 6, 10];



foreach($nums as $i){
    echo $i . "  +  " . $nums[4 - $help_num] . "  =  " . ($i + $nums[4 - $help_num]) . " <br>";
    $help_num++;
}