<?php
echo number_format(disk_total_space("C:")/pow(2 , 40) ,2) ." Terabyte<br>";
echo number_format(disk_total_space("D:")/pow(2 , 40) ,2) ." Terabyte<br>";