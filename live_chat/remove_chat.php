<?

include('connectdb.php');

if(isset($_POST["chat_message_id"]))
{
	$q = "
	UPDATE chat_message 
	SET status = '2' 
	WHERE chat_message_id = '".$_POST["chat_message_id"]."'
    ";
    // $q = "
    // DELETE FROM `chat_message` WHERE
    //  chat_message_id = '".$_POST["chat_message_id"]."'
    // ";
    

    $r = mysqli_query($conn, $q);
if($r){ 
   // echo fetch_user_chat_history($_SESSION['user_id'], $_POST['to_user_id'], $conn);
   //echo "asd";
}
}

?>