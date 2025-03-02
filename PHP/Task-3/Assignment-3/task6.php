<?php
$url1 = "http://www.elz ero.org";
$url2 = "http://¥elzero.org";
$url3 = "https://elzero.org";
$url4 = "https://elzero.o¥rg";

for($i=1;$i<=4;$i++){
    echo filter_var(${"url".$i}, FILTER_SANITIZE_URL) . "<br>";
        
}