<!DOCTYPE html>
<html lang="en">
<head>
<title>oasispazar.com - celiş</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

/* Sticky navbar - toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed). The sticky value is not supported in IE or Edge 15 and earlier versions. However, for these versions the navbar will inherit default position */
.navbar {
  overflow: hidden;
  background-color: #333;
  position: sticky;
  position: -webkit-sticky;
  top: 0;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}


/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Active/current link */
.navbar a.active {
  background-color: #666;
  color: white;
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
}
</style>
</head>
<body>
    
			<a href="" class="logo"><img src="img/logo.png" width="140" height="128"></a>
<div class="navbar">
  <a href="index.php" class="active">Ana sayfa</a>
  <a href="cekilislerim.php">Çekilis sonucuna burdan ulaşabilirsiniz</a>
  <a href="cekilis.php">Çekiliş Oluştur</a>
  <a href="shop.php">Tüm ürünler</a>
</div>

</body>
</html>
