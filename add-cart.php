<?php  
session_start();

# If the user is logged in
if (isset($_SESSION['web_project'])) {

	# Database Connection File
	include "db_conn.php";

    if(isset($_GET['id'])){
        $book_id = $_GET["id"];
        $user_id = $_SESSION['web_project']; //紀錄user的acc
        $sql = "SELECT * FROM cart WHERE book_id = $book_id AND user_id = '$user_id'";
        $result = $conn->query($sql);
        $total_cart = "SELECT * FROM cart";
        $total_cart_result = $conn->query($total_cart);
        $cart_num = $total_cart_result->rowCount();
        


        if($result->rowCount() > 0){
            $in_cart = "already in Watch Later";
            echo json_encode(["num_cart"=>$cart_num,"in_cart"=>$in_cart]);
        }else{
            $insert = "INSERT INTO `cart`(`user_id`,`book_id`) VALUES('$user_id', '$book_id')";

            if($conn->query($insert) == true){
                $in_cart = "added into Later";
                echo json_encode(["num_cart"=>$cart_num,"in_cart"=>$in_cart]);
            }else{
                echo"<script>alert(It doesn't insert)</script>";
            } 
        }
    }
    if(isset($_GET['cart_id'])){
        $book_id = $_GET["cart_id"];
        $sql = "DELETE FROM cart WHERE book_id = $book_id";
        if($conn->query($sql) === TRUE){
            echo"Removed from cart";
        }
    }

}



?>
