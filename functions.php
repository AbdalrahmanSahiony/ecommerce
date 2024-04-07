<?php 
include "connect.php";
define("MB", 1048576);
function filterRequest($requestname)
{
  return  htmlspecialchars(strip_tags($_POST[$requestname]));
}
function imageUpload($dir,$imageRequest)
{
  $imagename=null;
  $imagetmp=null;
  $imagesize=null;
   $msgError=null;
   if(isset($_FILES[$imageRequest])){

   
  if(isset($_FILES[$imageRequest]['name'])){
    $imagename  = rand(10,10000) . $_FILES[$imageRequest]['name'];
  }else{
    $imagename=null;
  }
  if(isset($_FILES[$imageRequest]['tmp_name'])){
    $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
  }else{
    $imagetmp=null;
  }
  if(isset($_FILES[$imageRequest]['size'])){
    $imagesize  = $_FILES[$imageRequest]['size'];
  }else{
    $imagesize=null;
  }
  $allowExt   = array("jpg", "png", "gif", "mp3", "pdf","svg");
  $strToArray = explode(".", $imagename);
  $ext        = end($strToArray);
  $ext        = strtolower($ext);

  if (!empty($imagename) && !in_array($ext, $allowExt)) {
    $msgError[] = "EXT";
  }
  if ($imagesize > 2 * MB) {
    $msgError[] = "size";
  }
  if (empty($msgError)) {
   move_uploaded_file($imagetmp, $dir . "/" . $imagename);
   return $imagename;
  }
  else {
   return "fail";
  }
echo($imagename);
}else{
  return "empty";
}
}
//delete file
function deleteFile($dir,$imagename){
  if(file_exists($dir."/" . $imagename)){
    unlink($dir."/" . $imagename);
  }
}

  function checkAuthenticate(){
      if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
  
          if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345"){
              header('WWW-Authenticate: Basic realm="My Realm"');
              header('HTTP/1.0 401 Unauthorized');
              echo 'Page Not Found';
              exit;
          }
      } else {
          exit;
      }
  }
  function updateData($table,$data,$where,$json=true){
    global $con;
    $cols=array();
    $vals=array();
    foreach($data as $key => $val){
      $vals[]="$val";
      $cols[]="`$key` = ?";
    }
    $sql="UPDATE $table SET" . implode(',',$cols). "WHERE '$where' ";
    $stmt=$con->prepare($sql);
    $stmt->execute($vals);
    $count=$stmt->rowCount();
    
    if($json){
    if($count>0){
      echo json_encode(array("status"=>"succes"));
    }else{
      echo json_encode(array("status"=>"upload fail"));
    }
    }
  }
  function getAllData($table,$where=null,$val=null,$json=true){
    global $con;
    $data=array();
    if($where==null){
      $stmt=$con->prepare("SELECT * FROM $table");
    }else if($where!=null){
      $stmt=$con->prepare("SELECT * FROM $table WHERE $where");
    }
   $stmt->execute($val);
   $data=array();
    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $count=$stmt->rowCount();
    if($json){
      if($count>0){
        echo json_encode(array("status"=> "succes","data"=>$data));
      }else{
        echo json_encode(array("status"=> "fail"));
      }
    }else{
      if($count>0){
      return $data;
    }else{
      return json_encode(array("status"=> "fail"));
    }
    }
  }
  function getData($table,$where=null,$val=null,$json=false){
    global $con;
    $data=array();
    if($where==null){
      $stmt=$con->prepare("SELECT * FROM $table");
    }else if($where!=null){
      $stmt=$con->prepare("SELECT * FROM $table WHERE $where");
    }
   $stmt->execute($val);
    $data=$stmt->fetch(PDO::FETCH_ASSOC);
    $count=$stmt->rowCount();
    if($json){
      if($count>0){
        echo json_encode(array("status"=> "succes","data"=>$data));
      }else{
        echo json_encode(array("status"=> "fail"));
      }
    }else{
      if($count>0){
      return $data;
    }else{
      return json_encode(array("status"=> "fail"));
    }
    }
    
  }
  function deleteData($table,$where=null,$val=null,$json=true){
    global $con;
    $data=array();
    if($where==null){
      $stmt=$con->prepare("DELETE FROM $table");
    }else if($where!=null){
      $stmt=$con->prepare("DELETE FROM $table WHERE $where");
    }
   $stmt->execute($val);
    $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $count=$stmt->rowCount();
    if($json){
      if($count>0){
        echo json_encode(array("status"=> "succes","data"=>$data));
      }else{
        echo json_encode(array("status"=> "fail"));
      }
    }else{
      if($count>0){
      return $data;
    }else{
      return json_encode(array("status"=> "fail"));
    }
    }
  }
  function insertOrUpdateData($table, $data, $where) {
    global $con;
    // Validate data
    if (!is_array($data)) {
        throw new InvalidArgumentException('Data must be an array.');
    }

    // Prepare statement
    $placeholders = implode(',', array_fill(0, count($data), '?'));
    $stmt = $con->prepare("INSERT INTO $table (" . implode(',', array_keys($data)) . ") VALUES ($placeholders)
ON DUPLICATE KEY UPDATE $where");

    // Bind values
    $stmt->execute(array_values($data));

    // Return number of rows affected
    return $stmt->rowCount();
}
function getOnlyAllData($table,$where=null,$val=null,$json=false){
  global $con;
  $data=array();
  if($where==null){
    $stmt=$con->prepare("SELECT * FROM $table");
  }else if($where!=null){
    $stmt=$con->prepare("SELECT * FROM $table WHERE $where");
  }
 $stmt->execute($val);
  $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
  $count=$stmt->rowCount();
  if($json){
    if($count>0){
      echo json_encode(array("data"=>$data));
    }
  }else{
    if($count>0){
    return $data;
  }
  }
  
}
function sendGCM($title, $message, $topic, $pageid=null, $pagename=null)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
      //server key from firebase
        'Authorization: key=' . "AAAALKaVX_A:APA91bG0LFr4zN9YFFRoUzrsf5bMlTLel-KVw4iHlvzRXLoJ3ruI2ROYY2VvDOIOiOZ0MllQ3322-K1qYiVXy51HWyy3q0kR7C0jXNX6ir4RRo6yt-qo5UsQKuZ21p0mJXLGe3tAhtzd",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}
function saveNotify($title,$body,$userId){
  global $con;
  $stmt=$con->prepare("INSERT INTO `notify`(`notify_title`, `notify_body`, `notify_userid`) VALUES ('$title','$body','$userId')");
  $stmt->execute();
  $count=$stmt->rowCount();
  return $count;
}
function insertData($table,$data,$where=null,$json=true){
  global $con;
  $cols=array();
  $vals=array();
  foreach($data as $key => $val){
    $vals[]="$val";
    $cols[]="`$key` = ?";
  }
  $sql="INSERT INTO $table SET" . implode(',',$cols). "WHERE '$where' ";
  $stmt=$con->prepare($sql);
  $stmt->execute($vals);
  $count=$stmt->rowCount();
  
  if($json){
  if($count>0){
    echo json_encode(array("status"=>"succes"));
  }else{
    echo json_encode(array("status"=>"upload fail"));
  }
  }
}
?>
