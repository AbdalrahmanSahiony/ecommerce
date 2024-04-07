<?php 
include "../connect.php";
$userId=null;
$itemId=null;
if(isset($_POST["user_id"])){
    $userId=filterRequest("user_id");
}
if(isset($_POST["favourite_itemsid"])){
    $itemId=filterRequest("favourite_itemsid");
}
if($userId!=null && $itemId!=null){
$data=array("favourite_itemsid"=>$itemId,"favourite_usersid"=>$userId);
$stmt=$con->prepare("INSERT INTO favourite (favourite_itemsid, favourite_usersid)
VALUES ('$itemId','$userId')");
$stm->execute();
$count=$stm->rowCount();
if($count>0){
    echo json_encode(array("status"=>"succes"));
    
}else{
    echo json_encode(array("status"=>"fail"));
}
}

?>