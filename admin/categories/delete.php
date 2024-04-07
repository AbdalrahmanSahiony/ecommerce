<?php
include "../../connect.php";
$id=null;
$img=null;
if(isset($_POST["id"])){
    $id=filterRequest("id");
}
if(isset($_POST["img"])){
    $img=filterRequest("img");
}
deleteFile("../../upload/categories",$img);
deleteData("categories","categories_id = '$id'");
?>