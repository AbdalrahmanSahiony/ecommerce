<?php
include "../connect.php";
$couponName=null;
if(isset($_POST["name"])){
$couponName=filterRequest("name");
$now=date("Y-m-d H:i:s");
}
$coupon=getData("coupon","`coupon_name`='$couponName' And `coupon_expiaredate`>'$now' AND `coupon_count`>0",null,false);
$s = $con->prepare("SELECT * FROM `coupon` WHERE `coupon_name`='$couponName' And `coupon_expiaredate`>'$now' AND `coupon_count`>0");
$s->execute();
$count = $s->rowCount();
$data=$s->fetch(PDO::FETCH_ASSOC);
if ($count > 0) {
    echo json_encode(array("status" => "succes","data"=>$data));
} else {

    echo json_encode(array("status" => "fail"));
}
?>