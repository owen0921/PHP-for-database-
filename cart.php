<?php  
session_start();

# If the admin is logged in
if (isset($_SESSION['web_project'])) {
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
    $categories = get_all_categories($conn);

	$sql_cart = "SELECT * FROM cart";
	$all_cart  = $conn->query($sql_cart);

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Book Store</title>

    <!-- bootstrap 5 CDN-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- bootstrap 5 Js bundle CDN-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="user_login_page.php">Online Book Store</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" 
		         id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" 
		             aria-current="page" 
		             href="user_login_page.php">Store</a>
		        </li>
				<li class="nav-item">
		          <a class="nav-link active" 
		             aria-current="page" 
		             href="recommendation_system/index.php">Recommendation</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<form action="search.php"
             method="get" 
             style="width: 100%; max-width: 30rem">

       	<div class="input-group my-5">
		  <input type="text" 
		         class="form-control"
		         name="key" 
		         placeholder="Search Book..." 
		         aria-label="Search Book..." 
		         aria-describedby="basic-addon2">

		  <button class="input-group-text
		                 btn btn-primary" 
		          id="basic-addon2">
		          <img src="img/search.png"
		               width="20">

		  </button>
		</div>
       </form>
		<div class="d-flex pt-3">
			<?php if ($all_cart == 0){ ?>
				<div class="alert alert-warning 
        	            text-center p-5" 
        	     role="alert">
        	     <img src="img/empty.png" 
        	          width="100">
        	     <br>
			    There is no book in the database
		       </div>
			<?php }else{ ?>
			<div class="pdf-list d-flex flex-wrap">
			<?php
				$user_id = $_SESSION['web_project'];
				$sql = "SELECT * FROM books 
				INNER JOIN cart ON books.id=cart.book_id 
				WHERE cart.user_id='{$user_id}'";
						
				$all_product = $conn->query($sql);
				while($row = $all_product->fetch(PDO::FETCH_ASSOC)){?>
				<div class="card m-1">
					<img src="uploads/cover/<?=$row['cover']?>"
					     class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">
							<?=$row['title']?>
						</h5>
						<p class="card-text">
							<i><b>By:
								<?php foreach($authors as $author){ 
									if ($author['id'] == $row['author_id']) {
										echo $author['name'];
										break;
									}
								?>

								<?php } ?>
							<br></b></i>
							<?=$row['description']?>
							<br><i><b>Category:
								<?php foreach($categories as $category){ 
									if ($category['id'] == $row['category_id']) {
										echo $category['name'];
										break;
									}
								?>
								<?php } ?>
							<br></b></i>
						</p>
                       <a href="uploads/files/<?=$row['file']?>"
                          class="btn btn-success">Open</a>

                        <a href="uploads/files/<?=$row['file']?>"
                          class="btn btn-primary"
                          download="<?=$row['title']?>">Download</a>
						<button class="btn btn-warning" data-id = "<?php echo $row['id'];?>">Remove</button>
					</div>
				</div>
				<?php } ?>
			</div>
		<?php } ?>
		<script>
			var remove = document.getElementsByClassName("btn btn-warning");
			for(var i = 0;i<remove.length; i++){
				remove[i].addEventListener("click",function(event){
					var target = event.target;
					var cart_id = target.getAttribute("data-id");
					var xml = new XMLHttpRequest();
					xml.onreadystatechange = function(){
						if(this.readyState == 4 && this.status == 200){
							// target.innerHTML = this.responseText;
							target.style.opacity = .5;
						}
					}
					xml.open("GET","add-cart.php?cart_id="+cart_id,true);
					xml.send();
				})
			}
		</script>
		<div class="category">
			<!-- List of categories -->
			<div class="list-group">
				<?php if ($categories == 0){
					// do nothing
				}else{ ?>
				<a href="#"
				   class="list-group-item list-group-item-action active">Category</a>
				   <?php foreach ($categories as $category ) {?>
				  
				   <a href="category.php?id=<?=$category['id']?>"
				      class="list-group-item list-group-item-action">
				      <?=$category['name']?></a>
				<?php } } ?>
			</div>

			<!-- List of authors -->
			<div class="list-group mt-5">
				<?php if ($authors == 0){
					// do nothing
				}else{ ?>
				<a href="#"
				   class="list-group-item list-group-item-action active">Author</a>
				   <?php foreach ($authors as $author ) {?>
				  
				   <a href="author.php?id=<?=$author['id']?>"
				      class="list-group-item list-group-item-action">
				      <?=$author['name']?></a>
				<?php } } ?>
			</div>
		</div>
		</div>
	</div>
</body>
</html>
<?php }else{
  header("Location: <user_login_register_system>login_index.php");
  exit;
} ?>