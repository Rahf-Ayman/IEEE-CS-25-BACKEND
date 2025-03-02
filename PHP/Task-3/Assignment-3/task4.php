<?php

$filter = filter_list();
$new =[];
foreach($filter as $key => $f){
    $key = filter_id($f);
    $new[$key] = $f;
    
}
echo '<pre>';
print_r($new);

echo '</pre>';