<?php
include "../../connect.php";
$name=null;
$password=null;
$email=null;
$phone=null;
if(isset($_POST["name"])){
    $name=filterRequest("name");
}
if(isset($_POST["password"])){
    $password=sha1("password");
}
if(isset($_POST["email"])){
    $email=filterRequest("email");
}
if(isset($_POST["phone"])){
    $phone=filterRequest("phone");
}
if($name!=null && $email!=null && $password!=null && $phone!=null){
    $stm=$con->prepare("INSERT INTO `delivery`(`delivery_password`,`delivery_phone`, `delivery_name`, `delivery_email`) VALUES ('$password','$phone','$name','$email')");
$stm->execute();
$count=$stm->rowCount();
if($count>0){
    echo json_encode(array("status"=>"succes"));
    
}else{
    echo json_encode(array("status"=>"fail"));
}
}


?>