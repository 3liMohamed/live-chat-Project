<?php

define("HOSTNAME", "localhost");
define("HOST_USER", "root");
define("HOST_PASS", "");
define("DB_NAME", "live_chat");

$conn = mysqli_connect(HOSTNAME, HOST_USER, HOST_PASS,DB_NAME);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

mysqli_set_charset($conn,"utf8mb4");
//date_default_timezone_set('Asia/Kolkata');

function fetch_user_last_activity($user_id, $conn)
{
 $q = "
 SELECT * FROM login_details 
 WHERE user_id = '$user_id' 
 ORDER BY last_activity DESC 
 LIMIT 1
 ";
 $r = mysqli_query($conn,$q);

 if($r){
     if(mysqli_num_rows($r) > 0){
         while ($row = mysqli_fetch_assoc($r)){
// foreach($r as $row){
  return $row['last_activity'];
         }}}
}
function fetch_user_chat_history($from_user_id, $to_user_id, $conn)
{
 $q = "
 SELECT * FROM chat_message 
 WHERE (from_user_id = '".$from_user_id."' 
 AND to_user_id = '".$to_user_id."') 
 OR (from_user_id = '".$to_user_id."' 
 AND to_user_id = '".$from_user_id."') 

 ";
 $r = mysqli_query($conn,$q);
 if($r){
    if(mysqli_num_rows($r) > 0){
 $output = '<ul class="list-unstyled">';
 foreach($r as $row)
 {
    $user_name = '';
  $chat_message = '';
  $dynamic_background = '';
  if($row["from_user_id"] == $from_user_id)
  {
    if($row["status"] == '2')
    {
     $chat_message = '<em>This message has been removed</em>';
     $user_name = '<b class="text-success">You</b>';
    }
    else
    {
     $chat_message = $row['chat_message'];
     $user_name = '<button type="button" class="btn btn-danger btn-xs remove_chat" id="'.$row['chat_message_id'].'">x</button>&nbsp;<b class="text-success">You</b>';
    }
    $dynamic_background = 'background-color:#ffe6e6;';
  }
  else
  {
    if($row["status"] == '2')
    {
     $chat_message = '<em>This message has been removed</em>';
    }
    else
    {
     $chat_message = $row['chat_message'];
    }
    $user_name = '<b class="text-danger">'.get_user_name($row['from_user_id'], $conn).'</b>';
    $dynamic_background = 'background-color:#ffffe6;';
  }
  $output .= '
  <li style="border-bottom:1px dotted #ccc;padding-top:8px; padding-left:8px; padding-right:8px;'.$dynamic_background.'">
   <p>'.$user_name.' - '.$chat_message.' 
    <div align="right">
     - <small><em>'.$row['timestamp'].'</em></small>
    </div>
   </p>
   
  </li>
  ';




  


 } $output .= '</ul>';
}}


 $query = "
 UPDATE chat_message 
 SET status = '0' 
 WHERE from_user_id = '".$to_user_id."' 
 AND to_user_id = '".$from_user_id."' 
 AND status = '1'
 ";
 $r = mysqli_query($conn, $query);
 
if(isset($output))
 return $output;
}

function get_user_name($user_id, $conn)
{
 $q = "SELECT username FROM login WHERE user_id = '$user_id'";
 $r = mysqli_query($conn,$q);

    if($r){
        if(mysqli_num_rows($r) > 0){
            foreach($r as $row)
            {
            return $row['username'];
            }
        }
    } 
}



function count_unseen_message($from_user_id, $to_user_id, $conn)
{
 $q = "
 SELECT * FROM chat_message 
 WHERE from_user_id = '$from_user_id' 
 AND to_user_id = '$to_user_id' 
 AND status = '1'
 ";

 $r = mysqli_query($conn,$q);

 if($r){

 $count = mysqli_num_rows($r);
 $output = '';
 if($count > 0)
 {
  $output = '<span class="label label-success">'.$count.'</span>';
 }
 return $output;
}
}


function fetch_is_type_status($user_id, $conn)
{
 $q = "
 SELECT is_type FROM login_details 
 WHERE user_id = '".$user_id."' 
 ORDER BY last_activity DESC 
 LIMIT 1
 "; 

 $r = mysqli_query($conn,$q);

 if($r){
     if(mysqli_num_rows($r) > 0){
         //while ($row = mysqli_fetch_assoc($r)){
 $output = '';
 foreach($r as $row)
 {
  if($row["is_type"] == 'yes')
  {
   $output = ' - <small><em><span class="text-muted">Typing...</span></em></small>';
  }
 }

 return $output;
}}
}



?>





