<?php
$start = 0;
$mix = [1, 2, 3, "A", "B", "C", 4];

for($start = 0; $start < count($mix); $start++){
    if($mix[$start] == 1 || is_string($mix[$start]))
        continue;
    echo $mix[$start] . "<br>";
}
