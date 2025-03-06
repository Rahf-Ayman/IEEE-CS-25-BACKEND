<?php
$date = "1990-10-01";

$datee = strtotime($date);
$diff = $datee - 0;
$days = $diff / (60.0 * 60 * 24);
$years = $days / 365;

echo "From Epoch Time Till ". $date." Is Approximately ".number_format($days ,1)." Days<br>";
echo "From Epoch Time Till ". $date." Is Approximately ".number_format($years ,1)." Years<br>";