<?php
include "../../../connect.php";
include "../../../send.php";
$email = null;
if (isset($_POST["email"])) {
    $email = $_POST["email"];
} else {
    $email = null;
}
$code= rand(10000,99999);
$body="your code is". $code;
$data=array("delivery_vriefieycode"=>$code);
// prove if the email or the phon number is exist
if ($email != null) {
    $s = $con->prepare("SELECT * FROM `delivery` WHERE `delivery_email`='$email'");
    $s->execute();
    $count = $s->rowCount();
    if ($count > 0) {
        sendEmail($email,"veryfiey",$body,"veryfiey");
        updateData("delivery",$data,"`delivery_email`='$email'",false);
        echo json_encode(array("status" => "succes"));
    } else {

        echo json_encode(array("status" => "fail"));
    }
}
