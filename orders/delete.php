<?php
include "../connect.php";
$orderId=null;
if(isset($_POST["orderId"])){
    $orderId=filterRequest("orderId");
}
deleteData("orders","'$orderId'=orders_id AND order_status=0")
?>