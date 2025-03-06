<?php
if(isset($_COOKIE['site']['layout']) ){
    setcookie("site[layout]","boxed" , time() - 60*60 , "/" ,"localhost" );
    
}    