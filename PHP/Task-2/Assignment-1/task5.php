<?php
$name = "Osama";
$age = 40;
$country = "Egypt";



echo $age > 18? "The Age Is Good To Go<br>" . 
(gettype($name) === "string"? "The Name Is Good To Go<br>" . 
($country === "Egypt"? "The Country Is Good To Go<br>" :"" ) :"" ) : "" ;




// Needed Output
// "The Age Is Good To Go"
// "The Name Is Good To Go"
// "The Country Is Good To Go"