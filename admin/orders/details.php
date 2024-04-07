<?php
include "../../connect.php";
$orderId=null;
if(isset($_POST["order_id"])){
    $orderId=filterRequest("order_id");
}
getAllData("orderdetailsview","orders_id='$orderId'");

?>