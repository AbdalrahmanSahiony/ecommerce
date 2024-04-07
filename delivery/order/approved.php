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
$data=array("order_status"=>3,"orders_delivery"=>$deliveryId);
updateData("orders", $data, "orders_id='$orderId'");
sendGCM("succes", "your order  has been on the way", "user$userId");
saveNotify("succes", "the order $orderId is on the way", $userId);
sendGCM("succes", "the order $orderId has approved by delivery $deliveryId", "delivery");
?>