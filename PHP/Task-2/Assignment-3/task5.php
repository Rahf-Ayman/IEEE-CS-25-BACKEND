<?php

function check_status($a, $b, $c) {
    $string_type = "";
    $age = 0;
    $is_ava= false;   
    for($i =0;$i<3;$i++){
        switch(gettype(func_get_arg($i))){
            case "string":
                $string_type = func_get_arg($i);
                break;
            case "integer":
                $age = func_get_arg($i);
                break;
            case "boolean":
                $is_ava = func_get_arg($i);
                break;
        }
    }
    return "Hello $string_type, Your Age Is $age, You Are ".($is_ava ? "Available" : "Not Available")." For Hire";
}

  // Needed Output
  echo check_status("Osama", 38, true); // "Hello Osama, Your Age Is 38, You Are Available For Hire"
  echo "<br>";
  echo check_status(38, "Osama", true); // "Hello Osama, Your Age Is 38, You Are Available For Hire"
  echo "<br>";
  echo check_status(true, 38, "Osama"); // "Hello Osama, Your Age Is 38, You Are Available For Hire"
  echo "<br>";
  echo check_status(false, "Osama", 38); // "Hello Osama, Your Age Is 38, You Are Not Available For Hire"