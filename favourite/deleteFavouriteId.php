<?php 
include "../connect.php";
$id=null;
if(isset($_POST["id"])){
    $id=filterRequest("id");
}
if($id!=null){
    deleteData("favourite","$id=favourite_id");
}
?>