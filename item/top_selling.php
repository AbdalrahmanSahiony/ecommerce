<?php
include "../connect.php";
getAllData("items_top_selling ORDER BY count_item DESC");
?>