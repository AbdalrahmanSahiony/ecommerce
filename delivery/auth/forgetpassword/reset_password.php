<?php
include "../../../connect.php";
$email=null;
$password=null;
$code=null;
if(isset($_POST["email"])){
    $email=filterRequest("email");
}
if(isset($_POST["password"])){
    $password=filterRequest("password");
}
if(isset($_POST["code"])){
    $code=filterRequest("code");
}

    $dara=array("delivery_password"=>$password);
    updateData("delivery",$dara," `delivery_email`='$email' AND `delivery_vriefieycode`='$code'");
 
?>