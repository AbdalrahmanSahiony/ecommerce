<?php
include "../connect.php";
$userId=null;
if(isset($_POST["userId"])){
    $userId=filterRequest("userId");
}
getAllData("notify","notify_userid='$userId' ORDER BY $userId DESC");
?>