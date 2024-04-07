<?php
include "connect.php";
$data=array();
$allCategories=getAllData("categories",null,null,false);
$data['status']="succes";
$data['categories']=$allCategories; 
$allItems=getAllData("items1view","items_discount!=0",null,false);
$data['top_selling']=getAllData("items_top_selling ORDER BY count_item DESC",null,null,false);
$data['setting']=getData("setting",null,null,false);
$data['items']=$allItems; 
echo json_encode($data);
?>