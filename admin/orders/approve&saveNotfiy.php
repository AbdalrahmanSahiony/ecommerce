<?php
include "../../connect.php";
$userId=null;
$orderId=null;
if($_POST["userId"]){
    $userId=filterRequest("userId");
}
if($_POST["orderId"]){
    $orderId=filterRequest("orderId");
}
$data=array("order_status"=>1);
updateData("orders",$data,"orders_id='$orderId'");
sendGCM("succes","your order has been approved","user$userId",null,"order");
saveNotify("succes","the order $orderId has been approved",$userId);
?>