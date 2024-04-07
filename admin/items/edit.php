<?php
include "../../connect.php";
$name=null;
$name_ar=null;
$id=null;
$imgOld=null;
$desc = null;
$desc_ar = null;
$price = null;
$active=null;
$disCount = null;
$item_categories = null;
$date = null;
$active = null;
if(isset($_POST["id"])){
    $id=filterRequest("id");
}
if(isset($_POST["name"])){
    $name=filterRequest("name");
}
if(isset($_POST["name_ar"])){
    $name_ar=filterRequest("name_ar");
}
if(isset($_POST["img_old"])){
    $imgOld=filterRequest("img_old");
}
if (isset($_POST["desc"])) {
    $desc = filterRequest("desc");
}
if (isset($_POST["desc_ar"])) {
    $desc_ar = filterRequest("desc_ar");
}
if (isset($_POST["price"])) {
    $price = filterRequest("price");
}
if (isset($_POST["discount"])) {
    $discount = filterRequest("discount");
}
if (isset($_POST["active"])) {
    $active = filterRequest("active");
}

$image=imageUpload("../../upload/items","files");
if($image=="empty"){
    $data=array(
    "items_name"=>$name,
    "items_name_ar"=>$name_ar,
    "items_descreption"=>$desc,
    "items_descreption_ar"=>$desc_ar,
    "items_price"=>$price,
    "items_discount"=>10,
    "items_active"=>$active,
);
}else{
        deleteFile("../../upload/items",$imgOld);
        $data=array("items_name"=>$name,
    "items_name_ar"=>$name_ar,
    "items_descreption"=>$desc,
    "items_descreption_ar"=>$desc_ar,
    "items_price"=>$price,
    "items_discount"=>$discount,
    "items_image"=>$image,
    "items_active"=>$active,
);
}
updateData("items",$data,"items_id ='$id'");
?>