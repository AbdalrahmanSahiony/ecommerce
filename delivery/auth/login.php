<?php
include "../../connect.php";
$password=null;
$email=null;
if(isset($_POST["password"])){
    $password=sha1("password");
}
if(isset($_POST["email"])){
    $email=filterRequest("email");
}
if($email!=null && $password!=null){
getData("delivery","delivery_email='$email' AND delivery_password='$password'");
}
?>