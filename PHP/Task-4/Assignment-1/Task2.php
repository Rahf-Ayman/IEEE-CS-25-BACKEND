<?php
echo "Size In Megabyte Is " .round( filesize("D:\movies\wild robot.mkv") / pow(2 , 20)) . "<br>";
echo "Size In Kilobyte Is " . round(filesize("D:\movies\wild robot.mkv") / pow(2 , 10)) . "<br>";