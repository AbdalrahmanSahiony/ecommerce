<?php 
include "../../connect.php";
include "../../send.php";

$password=null;
$email=null;
if(isset($_POST["password"])){
$password=sha1($_POST["password"]);
}else{
    $code=null;
}
if(isset($_POST["email"])){
$email=filterRequest("email");
}else{
    $email=null;
}
$data=array("user_password"=>$password);
updateData("user",$data,"`user_email`='$email'");

?>