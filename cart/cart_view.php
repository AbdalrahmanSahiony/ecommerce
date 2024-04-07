<?php
include "../connect.php";
$userId=null;
$itemId=null;
if(isset($_POST["user_id"])){
    $userId=filterRequest("user_id");
}
if(isset($_POST["favourite_itemsid"])){
    $itemId=filterRequest("favourite_itemsid");
}
getAllData("cart","'$userId'=cart_userid AND cart_itemsid='$itemId' AND cart_order=0",null,true);
?>