<?php
include"../connect.php";
$userId = null;
if (isset($_POST["id"])) {
    $userId = filterRequest("id");
}

getAllData("address","address_userid='$userId'");
