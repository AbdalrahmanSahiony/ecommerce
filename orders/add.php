<?php
include"../connect.php";
$userId=null;
$addressId=null;
$addressPrice=null;
$orderType=null;
$couponId=null;
$deliveryPrice=null;
$paymentWay=null;
$now=date("Y-m-d H:i:s");
if(isset($_POST["userId"])){
    $userId=filterRequest("userId");
}
if(isset($_POST["addressId"])){
    $addressId=filterRequest("addressId");
}
if(isset($_POST["addressPrice"])){
    $addressPrice=filterRequest("addressPrice");
}
if(isset($_POST["orderType"])){
    $orderType=filterRequest("orderType");
}
if(isset($_POST["couponId"])){
    $couponId=filterRequest("couponId");
}
if(isset($_POST["deliveryPrice"])){
    $deliveryPrice=filterRequest("deliveryPrice");
}
if(isset($_POST["paymentWay"])){
    $paymentWay=filterRequest("paymentWay");
}
if($orderType=="0"){
    $deliveryPrice="0";
}
$stmt = $con->prepare("INSERT INTO `orders` (`orders_userid`, `orders_address`, `orders_price`, `orders_type`,`orders_pricedelivery`,`orders_coupon`,`orders_paymentway`)
VALUES ('$userId','$addressId','$addressPrice','$orderType','$deliveryPrice','$couponId','$paymentWay')");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    $s = $con->prepare("SELECT MAX(orders_id) FROM `orders`");
    $s->execute();
    $maxId=$s->fetchColumn();
    $data=array("cart_order"=>$maxId);
    updateData("cart",$data,"cart_userid='$userId' AND cart_order=0");
    if($couponId!=0){
        $data4=getData("coupon","$couponId=coupun_id",null,false);
        $data3=array("coupon_count"=>$data4["coupon_count"]-1);
        updateData("coupon",$data3,"$couponId=coupun_id AND coupun_count>0 AND coupon_expiaredate>'$now'" ,false);
    }
}
?>