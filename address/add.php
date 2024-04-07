<?php
include"../connect.php";
$userId=null;
$city=null;
$street=null;
$name=null;
if(isset($_POST["user_id"])){
$userId = filterRequest("user_id");
}
if(isset($_POST["city"])){
$city = filterRequest("city");
}
if(isset($_POST["street"])){
$street = filterRequest("street");
}
if(isset($_POST["name"])){
$name=filterRequest("name");
}
$stmt = $con->prepare("INSERT INTO `address` (`address_userid`, `city`, `street`, `name`)
VALUES ('$userId','$city','$street','$name')");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "succes"));
} else {
    echo json_encode(array("status" => "fail"));
}
