<?php
include "../connect.php";
$categoryId = null;
$userId = null;
if (isset($_POST["id"])) {
    $categoryId = filterRequest("id");
}
if (isset($_POST["user_id"])) {
    $userId = filterRequest("user_id");
}
$data1=getAllData("items1view",null,null,false);
$price=$data1["items_price"]-($data1["items_price"]*($data1["items_discount"]/100));
$priceArray=array("items_price_discount"=>$price);
updateData("items1view",$priceArray,"categories_id=$categoryId");
$stmt = $con->prepare("SELECT items1view.*,1 as favourite ,items_price-(items_price*(items_discount/100)) as item_price_discount FROM items1view 
INNER JOIN favourite ON favourite.favourite_itemsid = items1view.items_id WHERE favourite.favourite_usersid=$userId AND categories_id=$categoryId
 UNION ALL SELECT *,0 as favourite ,items_price-(items_price*(items_discount/100)) as item_price_discount FROM items1view
 WHERE items_id NOT IN(SELECT items1view.items_id FROM items1view INNER JOIN favourite ON favourite.favourite_itemsid = items1view.items_id 
 AND favourite.favourite_usersid=$userId)AND categories_id=$categoryId");
$stmt->execute();
$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();
if($count>0){
    echo json_encode(array("status"=> "succer","data"=>$data));
  }else{
    echo json_encode(array("status"=> "failer"));
  }
  