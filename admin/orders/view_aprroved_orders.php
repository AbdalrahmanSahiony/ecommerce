<?php
include "../../connect.php";
getAllData("orders","order_status!=4 AND order_status!=0");
?>