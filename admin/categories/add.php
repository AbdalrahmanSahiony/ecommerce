<?php
include "../../connect.php";
$name=null;
$name_ar=null;
$image=null;
if(isset($_POST["name"])){
    $name=filterRequest("name");
}
if(isset($_POST["name_ar"])){
    $name_ar=filterRequest("name_ar");
}
$image=imageUpload("../../upload/categories","files");
$stmt = $con->prepare("INSERT INTO `categories` (`categories_name`, `categories_name_ar`, `categories_image`)
VALUES ('$name','$name_ar','$image')");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
        echo json_encode(array("status" => "succes"));
    } else {

        echo json_encode(array("status" => "fail"));
    }
?>