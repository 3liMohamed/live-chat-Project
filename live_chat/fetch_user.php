<?php

//fetch_user.php

include('connectdb.php');

session_start();

$q = "
SELECT * FROM login 
WHERE user_id != '".$_SESSION['user_id']."' 
";

$r = mysqli_query($conn,$q);

    if($r){
        if(mysqli_num_rows($r) > 0){
            while ($row = mysqli_fetch_assoc($r)){
  
            
        

$output = '
<table class="table table-bordered table-striped">
 <tr>
  <td>Username</td>
  <td>Status</td>
  <td>Action</td>
 </tr>
';

foreach($r as $row){
    
    $status = '';
    $current_timestamp = strtotime(date("Y-m-d H:i:s") . '- 10 second');
    $current_timestamp = date('Y-m-d H:i:s', $current_timestamp);
    $user_last_activity = fetch_user_last_activity($row['user_id'], $conn);
    if($user_last_activity > $current_timestamp)
    {
     $status = '<span class="label label-success">Online</span>';
    }
    else
    {
     $status = '<span class="label label-danger">Offline</span>';
    }

 $output .= '
 <tr>
  <td>'.$row['username'].' '.count_unseen_message($row['user_id'] , $_SESSION['user_id'] , $conn).' '.fetch_is_type_status($row['user_id'], $conn).'</td>
  <td>'.$status.'</td>
  <td><button type="button" class="btn btn-info btn-xs start_chat" data-touserid="'.$row['user_id'].'" data-tousername="'.$row['username'].'">Start Chat</button></td>
 </tr>
 ';
}

$output .= '</table>';

echo $output;
}
}else{

}

}
?>


