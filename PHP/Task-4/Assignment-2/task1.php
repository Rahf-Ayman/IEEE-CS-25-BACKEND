<?php
date_default_timezone_set("Asia/Riyadh");
$d = date_create("now", timezone_open("Asia/Riyadh"));
echo date_format($d, "D, d M y - H:i:s A") . "<br>";
echo date_format($d, "l, d F Y - H:i:s A") . "<br>";
