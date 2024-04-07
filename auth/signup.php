<?php 
//include "../connect.php";
include "../send.php";
$username=null;
$email=null;
$password=null;
$userphone=null;
if (isset($_POST["name"])){
    $username =$_POST["name"];
}else{
    $username=null;
}
if( isset($_POST["email"])){
    $email=$_POST["email"];
}else{
    $email=null;
}
 if( isset($_POST["password"])) {
   $password=sha1($_POST["password"]);
}else{
    $password=null;
}
 if( isset($_POST["phone"])) {
   $userphone=$_POST["phone"];
}else{
    $userphone=null;
}
$code= rand(10000,99999);
$body="your code is". $code;
// prove if the email or the phon number is exist
if($email!=null || $userphone!=null){
    $stm=$con->prepare("DELETE FROM `user` WHERE user_aprove=0");
    $stm->execute();
    $s=$con->prepare("SELECT * FROM `user` WHERE `user_email`='$email' OR `user_phone`='$userphone'");
    $s->execute();
    $count=$s->rowCount();
    if($count>0){
        
        echo json_encode(array("massage"=>"email or phone"));
        
    }
    else{
        //if the phone number and the email not exist create new account
        if($username!=null && $email!=null && $password!=null && $userphone!=null){
            sendEmail($email,"veryfiey",$body,"veryfiey");
            $stm=$con->prepare("INSERT INTO `user`(`user_password`,`user_phone`, `user_name`, `user_email`,`user_vriefieycode`) VALUES ('$password','$userphone','$username','$email','$code')");
        $stm->execute();
        $count=$stm->rowCount();
        if($count>0){
            echo json_encode(array("status"=>"succes"));
            
        }else{
            echo json_encode(array("status"=>"fail"));
        }
    }
    }
}




       
           

?>