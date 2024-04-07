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
if($userId!=null && $itemId!=null){
    $stmt=$con->prepare("SELECT * FROM cart WHERE $userId=cart_userid AND $itemId=cart_itemsid AND cart_order=0");
    $stmt->execute();
    $c=$stmt->rowCount();
    $data=$stmt->fetch(PDO::FETCH_ASSOC);
    if($c>0){
        $cart_count=$data["cart_item_count"];
        if($cart_count>1){
             $cart_count_array=array("cart_item_count"=>$cart_count-1);
          updateData("cart",$cart_count_array,"cart_userid ='$userId' AND cart_itemsid='$itemId'",false);
          getAllData("cart","$userId=cart_userid AND $itemId=cart_itemsid");
         
         } 
         if($cart_count==1){
             deleteData("cart","cart_id = (SELECT cart_id FROM `cart` WHERE'$userId'=cart_userid AND cart_itemsid='$itemId')",null,false);
           getAllData("cart","$userId=cart_userid AND $itemId=cart_itemsid");
         }
    }else{
        json_encode(array("status"=>"failer"));
    }
}
?>