<?php
function change_permissions($fileName) : string{
    if(!is_dir($fileName) ){
        if(pathinfo($fileName, PATHINFO_EXTENSION) == "txt"){
            chmod($fileName, 0700);
            return "Permissions Changed". "<br>";
        }else{
            return "File Extension Is Not Txt". "<br>";
        }
    }else{
        return "This Is Directory And Only Files Allowed". "<br>";
    }    
}
echo change_permissions("Elzero"); // This Is Directory And Only Files Allowed
echo change_permissions("Work.docx"); // File Extension Is Not Txt
echo change_permissions("Result.txt"); // Permissions Changed
