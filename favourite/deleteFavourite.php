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
    deleteData("favourite","favourite_usersid = $userId AND favourite_itemsid=$itemId ");
}
?>