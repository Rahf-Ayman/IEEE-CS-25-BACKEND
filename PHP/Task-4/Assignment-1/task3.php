<?php


$file1 ="Programming" ;
$file2 ="Programming/PHP";
makedir($file1);
removedir($file2);
removedir($file1);  

function makedir($file){
    if(!file_exists($file)){
        mkdir($file, 0711, true);
        
    }
}
function  removedir($file){
    if(file_exists($file)){
        rmdir($file);
        echo "Directory ". $file." Removed<br>"; 
    }
}
    
