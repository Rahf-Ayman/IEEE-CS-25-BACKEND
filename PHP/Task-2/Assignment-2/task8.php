<?php
$nums = [1, 13, 12, 20, 51, 17, 30];

foreach($nums as $i){
    if($i % 2 === 0)
        echo $i / 2 . "<br>";
}

// Output
// 6
// 10
// 15