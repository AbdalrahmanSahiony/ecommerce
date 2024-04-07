<?php
include"../connect.php";
if(isset($_POST["id"])){
    $id=filterRequest("id");
}

deleteData("address","address_id='$id'");
?>
