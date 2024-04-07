<?php
include "../../connect.php";
$userId = null;
$orderId = null;
$orderType = null;
if ($_POST["userId"]) {
    $userId = filterRequest("userId");
}
if ($_POST["orderId"]) {
    $orderId = filterRequest("orderId");
}
if ($_POST["orderType"]) {
    $orderType = filterRequest("orderType");
}
if ($orderType == "0") {
    $data = array("order_status" => 2);
} else {
    $data = array("order_status" => 4);
}

updateData("orders", $data, "orders_id='$orderId'");
sendGCM("succes", "your order has been prepared", "user$userId");
saveNotify("succes", "the order $orderId has been prepared", $userId);
if ($orderType == "0") {
    sendGCM("succes", "the order $orderId wating for delivery", "delivery",null,"home");
}
