<?php 
include "../connect.php";
$userId=null;
if(isset($_POST["id"])){
    $userId=filterRequest("id");
}else{
    $userId=null;
}
if($userId!=null){
    getAllData("myFavourite","$userId=favourite_usersid");
}
?>