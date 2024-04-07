<?php
include "../../connect.php";
$name=null;
$name_ar=null;
$id=null;
$imgOld=null;
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

$image=imageUpload("../../upload/categories","files");
if($image=="empty"){
    $data=array("categories_name"=>$name,"categories_name_ar"=>$name_ar);
    updateData("categories",$data,"categories_id = '$id' ");
}else{
        deleteFile("../../upload/categories",$imgOld);
        $data=array("categories_name"=>$name,"categories_name_ar"=>$name_ar,"categories_image"=>$image);
        updateData("categories",$data,"categories_id = '$id' ");
}

?>