<?php
//include "../connect.php";
$email = null;
$password = null;
if (isset($_POST["email"])) {
    $email = $_POST["email"];
} else {
    $email = null;
}
if (isset($_POST["password"])) {
    $password = sha1($_POST["password"]);
} else {
    $password = null;
}
// prove if the email or the phon number is exist
if ($email != null || $password != null) {
    $s = $con->prepare("SELECT * FROM `user` WHERE `user_email`='$email' And `user_password`='$password' AND `user_aprove`=1");
    $s->execute();
    $count = $s->rowCount();
    $data=$s->fetch(PDO::FETCH_ASSOC);
    if ($count > 0) {
        echo json_encode(array("status" => "succes","data"=>$data));
    } else {

        echo json_encode(array("status" => "fail"));
    }
}
