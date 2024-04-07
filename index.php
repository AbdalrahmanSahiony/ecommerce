<?php 
include "connect.php";
include"functions.php";
$username=null;
$email=null;
$password=null;
$phone=null;
if (isset($_POST["user_name"])){
    $username =$_POST["user_name"];
}else{
    $username=null;
}
if( isset($_POST["user_email"])){
    $email=$_POST["user_email"];
}else{
    $email=null;
}
 if( isset($_POST["user_password"])) {
   $password=$_POST["user_password"];
}else{
    $password=null;
}
if( isset($_POST["user_phone"])) {
    $phone=$_POST["user_phone"];
 }else{
     $phone=null;
 }
if($username!=null && $email!=null && $password!=null){
    $stm=$con->prepare("INSERT INTO `user`(`user_password`,`user_phone`, `user_name`, `user_email`) VALUES ('$password','$phone','$username','$email')");
$stm->execute();
$count=$stm->rowCount();
if($count>0){
    echo json_encode(array("status"=>"succes"));
    
}else{
    echo json_encode(array("status"=>"fail"));
}

}




       
           

?>