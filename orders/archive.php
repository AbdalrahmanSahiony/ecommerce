<?php
include "../connect.php";
$userId=null;
if(isset($_POST["userId"])){
    $userId=filterRequest("userId");
}
getAllData("orderview","orders_userid=$userId AND order_status=4");
//0 بانتظار الموافقة
//1 جاري التحضير
//2 الطلب جاهز
//3 الطلب قيد التوصيل
//4 ارشيف
?>