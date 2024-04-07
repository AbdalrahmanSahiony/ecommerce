<?php
include"../connect.php";
$id=null;
$city=null;
$street=null;
$name=null;
if(isset($_POST["city"])){
    $city = filterRequest("city");
}
if(isset($_POST["id"])){
    $id = filterRequest("id");
}
if(isset($_POST["street"])){
    $street = filterRequest("street");
}
if(isset($_POST["name"])){
    $name = filterRequest("name");
}
$data=array("city"=>$city,
"street"=>$street,
"name"=>$name
);
updateData("address",$data,"address_id='$id'");
?>
