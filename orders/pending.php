<?php
include "../connect.php";
$userId=null;
if(isset($_POST["userId"])){
    $userId=filterRequest("userId");
}
getAllData("orderview","orders_userid=$userId AND order_status!=4");
?>