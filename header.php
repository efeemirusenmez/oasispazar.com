<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--box icon link-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<title>Document</title>

</head>
<body>
	<header class="header">
		<div class="flex">
			<a href="admin_pannel.php" class="logo"><img src="img/logo.png" width="140" height="128"></a>
			<h4></h4>
			<nav class="navbar">
				<a href="index.php">Ana Sayfa</a>
				<a href="shop.php">Tüm Ürünler</a>
				<a href="order.php">Siparişler</a>
        <a href="cekilis.php">Çekiliş Oluştur</a>
        <a href="cekilislerim.php">Çekilişlerim</a>
				<a href="contact.php">İletişim</a>
			</nav>
			<div class="icons">
				<i class="bi bi-person" id="user-btn"></i>
				<?php 
					$select_wishlist = mysqli_query($conn, "SELECT * FROM `wishlist` WHERE user_id='$user_id'") or die ('query failed');
					$wishlist_num_rows = mysqli_num_rows($select_wishlist);
				?>
				<a href="wishlist.php"><i class="bi bi-heart"></i><sup><?php echo $wishlist_num_rows; ?></sup></a>
				<?php 
					$select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id='$user_id'") or die ('query failed');
					$cart_num_rows = mysqli_num_rows($select_cart);
				?>
				<a href="cart.php"><i class="bi bi-cart"></i><sup><?php echo $cart_num_rows; ?></sup></a>
				<i class="bi bi-list" id="menu-btn"></i>
			</div>
			<div class="user-box">
    <p>username : <span><?php echo $_SESSION['user_name']; ?></span></p>
    <p>Email : <span><?php echo $_SESSION['user_email']; ?></span></p>

    <?php 
    // Kullanıcının daha önce bilgi girdiğini kontrol et
    include 'connection.php';
    $user_id = $_SESSION['user_id'];
    $query = mysqli_query($conn, "SELECT * FROM userinfo WHERE user_id = '$user_id'");
    if(mysqli_num_rows($query) > 0) {
        // Kullanıcı daha önce bilgi girdiği için bilgileri göster
        $row = mysqli_fetch_assoc($query);
        ?>
        <p>Üst Beden : <span><?php echo $row['upper_body_size']; ?></span></p>
        <p>Alt Beden : <span><?php echo $row['lower_body_size']; ?></span></p>
        <p>Ayak Bedeni : <span><?php echo $row['shoe_size']; ?></span></p>
        <p>Adres : <span><?php echo $row['adress']; ?></span></p>
        <p>İd : <span><?php echo $row['id']; ?></span></p>
    <?php } else { ?>
        <!-- Kullanıcı daha önce bilgi girmediği için bilgi girmesi için bir bağlantı göster -->
        <p><a href="user.php">Bilgilerinizi girin</a></p>
    <?php } ?>



    <form method="post">
        <button type="submit" name="logout" class="logout-btn">log out</button>
    </form>
</div>

	</header>
	
</body>
</html>

<script>
  (function (w, d, s, o, f, js, fjs) {
    w["botsonic_widget"] = o;
    w[o] =
      w[o] ||
      function () {
        (w[o].q = w[o].q || []).push(arguments);
      };
    (js = d.createElement(s)), (fjs = d.getElementsByTagName(s)[0]);
    js.id = o;
    js.src = f;
    js.async = 1;
    fjs.parentNode.insertBefore(js, fjs);
  })(window, document, "script", "Botsonic", "https://widget.writesonic.com/CDN/botsonic.min.js");
  Botsonic("init", {
    serviceBaseUrl: "https://api-azure.botsonic.ai",
    token: "5deb67ec-134f-4b39-92dc-3524d02530ae",
  });
</script>