<?php
// setcookie("site[layout]","boxed" , time()+ 65 * 24*60 * 60 , "/" ,"localhost" );
// setcookie("site[font]","swat" , time()+ 65 * 24*60 * 60 , "/" ,"localhost" );
// setcookie("site[color]","blue" , time()+ 65 * 24*60 * 60 , "/" ,"localhost" );

echo "<pre>";
print_r($_COOKIE);
echo "</pre>";
echo "Your Color Is ".$_COOKIE['site']['color']." And Your Font Is ".$_COOKIE['site']['font'];
