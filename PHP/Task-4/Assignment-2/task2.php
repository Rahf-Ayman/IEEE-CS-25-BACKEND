<?php
$date = "2005-10-02";
date_default_timezone_set("Africa/Cairo");
echo date_default_timezone_get() . "<br>";
$d = date_create($date, timezone_open("Africa/Cairo")); 
date_add($d, date_interval_create_from_date_string("15 hours 15 minutes 15 seconds"));

echo date_format($d, "Y, F, l \'dS\' H:i:s") . "<br>";