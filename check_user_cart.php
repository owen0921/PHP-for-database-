<?php  
session_start();

# If the admin is logged in
if (isset($_SESSION['user_id']) &&
    isset($_SESSION['user_email'])) {

	# Database Connection File
	include "db_conn.php";

	# Book helper function
	include "php/func-book.php";
    $books = get_all_books($conn);

    # author helper function
	include "php/func-author.php";
    $authors = get_all_author($conn);

    # Category helper function
	include "php/func-category.php";
    $categories = get_all_categories($conn);?>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ADMIN</title>

    <!-- bootstrap 5 CDN-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- bootstrap 5 Js bundle CDN-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body>


<?php

$sql = "SELECT * FROM cart 
        JOIN login_user ON cart.user_id = login_user.acc 
        JOIN books ON cart.book_id = books.id";
$query_run = $conn->query($sql);
?>

<div class="container">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="admin.php">Admin</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" 
		         id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" 
		             aria-current="page" 
		             href="admin_login_page.php">Store</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" 
		             href="add-book.php">Add Book</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" 
		             href="add-category.php">Add Category</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" 
		             href="add-author.php">Add Author</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" 
		             href="logout.php">Logout</a>
		        </li>
				<li class="nav-item">
		          <a class="nav-link" 
		             href="check_user_cart.php">Check User Cart</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
    <h4>User Cart Information</h4>
    
    <table class="table table-bordered shadow">
        <thead>
            <tr>
                <th>User Name</th>
                <th>In Cart</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($query_run) {
                $prevName = '';
                foreach ($query_run as $row) {
                    $name = $row['name'];
                    $title = $row['title'];
                    
                    if ($name != $prevName) {
                        echo '<tr>';
                        echo '<td>' . $name . '</td>';
                        echo '<td>' . $title . '</td>';
                        echo '</tr>';
                    } else {
                        echo '<tr>';
                        echo '<td></td>';
                        echo '<td>' . $title . '</td>';
                        echo '</tr>';
                    }
                    
                    $prevName = $name; 
                }
            } else {
                echo '<tr>';
                echo '<td colspan="2">資料庫查詢失敗：' . $conn->error . '</td>';
                echo '</tr>';
            }
            ?>
        </tbody>
    </table>
</div>

<?php
}
?>


</body>
</html>