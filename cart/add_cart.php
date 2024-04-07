<?php
include "../connect.php";
$userId = null;
$itemId = null;
if (isset($_POST["user_id"])) {
    $userId = filterRequest("user_id");
}
if (isset($_POST["favourite_itemsid"])) {
    $itemId = filterRequest("favourite_itemsid");
}
if ($userId != null && $itemId != null) {
    $stmt = $con->prepare("SELECT * FROM cart WHERE $userId=cart_userid AND $itemId=cart_itemsid AND cart_order=0");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($count > 0) {
        $data = getData("cart", "$userId=cart_userid AND $itemId=cart_itemsid", false);
         $cartCount=array("cart_item_count"=>$data["cart_item_count"]+1);
        updateData("cart", $cartCount, "$userId=cart_userid AND $itemId=cart_itemsid",false);
       getAllData("cart","$userId=cart_userid AND $itemId=cart_itemsid",null,true);
    } else {
        $stmt = $con->prepare("INSERT INTO cart (cart_itemsid, cart_userid)
VALUES ('$itemId','$userId')");
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($count > 0) {
            $data =  getAllData("cart","$userId=cart_userid AND $itemId=cart_itemsid",null,false);
            echo json_encode(array("status" => "succes","data"=>$data));
        } else {
            echo json_encode(array("status" => "fail"));
        }
    }
}
