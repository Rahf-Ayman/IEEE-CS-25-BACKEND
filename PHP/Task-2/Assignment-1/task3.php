<?php
    $admins = ["Osama", "Ahmed", "Sayed"];
    
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $user = $_POST['user'];
        $server = $_SERVER['REQUEST_METHOD'];
        echo "The Request Method Is $server And username Is $user";
        echo "<br>";
        if(in_array($user, $admins)){
            echo "This Username $user Is Admin";
        }
    }

?>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            task3    
        </title>
    </head>
    <body>
        <form action="" method="POST">
            <input type="text" name="user">
            <input type="submit" value="Send">
        </form>
    </body>
</html>