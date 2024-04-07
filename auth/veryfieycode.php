<?php 
include "../connect.php";
$code=null;
$email=null;
if(isset($_POST["code"])){
$code=filterRequest("code");
}else{
    $code=null;
}
if(isset($_POST["email"])){
$email=filterRequest("email");
}else{
    $email=null;
}
$stmt=$con->prepare("SELECT * FROM `user` WHERE `user_email`='$email' AND `user_vriefieycode`='$code'");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
$data=array("user_aprove" => "1");
 updateData("user",$data,"user_email='$email'");
 echo json_encode(array("status"=>"succes"));
}else{
    echo json_encode(array("massege"=>"veryfieycode is wrong"));
}

?>