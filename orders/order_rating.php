<?php
include "../connect.php";
$rating=null;
$ratingNote=null;
$orderId=null;
if(isset($_POST["rating"])){
   $rating= filterRequest("rating");
}
if(isset($_POST["ratingNote"])){
    $ratingNote= filterRequest("ratingNote");
 }
 if(isset($_POST["orderId"])){
    $orderId= filterRequest("orderId");
 }
 $data=array("orders_rate"=>$rating,"orders_note"=>$ratingNote);
 updateData("orders",$data,"orders_id='$orderId'")
?>