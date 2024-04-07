<?php
include "../connect.php";
$cartId=null;
if(isset($_POST["id"])){
    $cartId=filterRequest("id");
}
getAllData("myCart","cart_userid='$cartId' AND cart_order=0");

?>