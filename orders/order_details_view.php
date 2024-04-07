<?php
include "../connect.php";
$orderId=null;
if(isset($_POST["orderId"])){
    $orderId=filterRequest("orderId");
}
getAllData("orderdetailsview","orders_id='$orderId'");
?>