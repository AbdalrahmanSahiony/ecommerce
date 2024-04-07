<?php
include "../../connect.php";
$deliveryId = null;
if (isset($_POST["deliveryId"])) {
    $deliveryId = filterRequest("deliveryId");
}
getAllData("orderView", "orders_delivery='$deliveryId' AND order_status=3");
