<?php 
include "connect.php";
include "send.php";
$email=null;
if( isset($_POST["email"])){
    $email=$_POST["email"];
}
$code= rand(10000,99999);
$body="your code is". $code;
sendEmail($email,"veryfiey",$body,"veryfiey");
$data=array("user_vriefieycode"=>$code);
updateData("user",$data,"user_email=$email");
?>