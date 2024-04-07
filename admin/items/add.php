<?php
include "../../connect.php";
$name = null;
$name_ar = null;
$image = null;
$desc = null;
$desc_ar = null;
$price = null;
$disCount = null;
$item_categories = null;
$date = null;
$active = null;
if (isset($_POST["name"])) {
    $name = filterRequest("name");
}
if (isset($_POST["name_ar"])) {
    $name_ar = filterRequest("name_ar");
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
if (isset($_POST["item_categories"])) {
    $item_categories = filterRequest("item_categories");
}
$image = imageUpload("../../upload/items", "files");
$stmt = $con->prepare("INSERT INTO `items` (`items_name`, `items_name_ar`, `items_image`,
items_descreption,items_descreption_ar,items_price,items_discount,
items_categories)
VALUES ('$name','$name_ar','$image','$desc','$desc_ar','$price',$discount,
'$item_categories')");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "succes"));
} else {

    echo json_encode(array("status" => "fail"));
}
