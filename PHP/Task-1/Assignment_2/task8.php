<?php
$arr = array( 'Frontend' => ["0" => 'HTML' 
, "1" => 'CSS' 
, "JS" => ['Vuejs' => ['2' => 'v2' , 'v3'] , '0' => 'Reactjs' , 'Svelte'] ] 
, 'Backend' => ['PHP' , 'MySQL' , 'Security']
, 'Git', 'Github'
, 'Testing' => ['Unit Testing','End To End', 'Integration']);

echo "<pre>";
print_r($arr);
echo "</pre>";