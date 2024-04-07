<?php
include "../../connect.php";
$orderId=null;
$deliveryId=null;
$userId=null;
if(isset($_POST["orderId"])){
    $orderId=filterRequest("orderId");
}
if(isset($_POST["deliveryId"])){
    $deliveryId=filterRequest("deliveryId");
}
if(isset($_POST["userId"])){
    $userId=filterRequest("userId");
}
$data=array("order_status"=>4);
updateData("orders", $data, "orders_id='$orderId'");
sendGCM("succes", "your order has been recived", "user$userId");
saveNotify("succes", "the order $orderId has been recived", $userId);
sendGCM("succes", "the order $orderId has recived", "admin");
?>