<?php
$friends = [
    "AG" => "Ahmed Gamal",
    "OM" => "Osama Mohamed",
    "MG" => "Mahmoud Gamal",
    "AS" => "Ahmed Samy",
    "FA" => "Farid Ahmed",
    "SM" => "Sayed Mohamed"
  ];

  $friends= array_change_key_case($friends , CASE_LOWER);
echo "<pre>";
print_r(array_chunk($friends, 2 , true));
echo "</pre>";