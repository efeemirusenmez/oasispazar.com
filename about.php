<?php 
    include 'connection.php';
    session_start();
    $user_id = $_SESSION['user_id'];
    if (!isset($user_id)) {
        header('location:login.php');
    }
    if(isset($_POST['logout'])){
        session_destroy();
        header("location: login.php");
    }
    
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!------------------------bootstrap icon link------------------------------->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="main.css">
    <title>oasis.com - Hakkında</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="banner">
        <div class="detail">
            <h1>Hakkında</h1>
            <a href="index.php">ana sayfa</a><span>/ Hakkında</span>
        </div>
    </div>
    <div class="about-us">
        <div class="row">
            <div class="box">
                <div class="title">
                <span>ONLINE MAĞAZAMIZ HAKKINDA</span>
                     <h1>Merhaba, 25 yıllık tecrübemle</h1>
                 </div>
                 <p>25 yılı aşkın süredir E-ticaret, şirketlerin finansal ve marka hedeflerine ulaşmalarına yardımcı oluyor.

                     Tanımlamak için alçakta asılı meyveler üzerinde çay demlemenin keyfini çıkarmanın mükemmel yolu. Duis autem vel eum iriure
                     hendrerit'te dolor
                     vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. Benim için,
                     en önemli kısmı
                     Fotoğrafçılıkta gelişiyorum.</p>
            </div>
            <div class="img-box">
                <img src="img/about3.jpg">
            </div>
        </div>
    </div>
    <div class="features">
        <div class="title">
        <h1>Tam Müşteri Fikirleri</h1>
             <span>en iyi özellikler</span>
        </div>
        <div class="row">
            <div class="box">
                <img src="img/icon2.png"><h4>24 X 7</h4>
                 <p>7/27 Çevrimiçi Destek</p>
            </div>
            <div class="box">
                <img src="img/icon1.png"><h4>Para İade Garantisi</h4>
                 <p>%100 Güvenli Ödeme</p>
            </div>
            <div class="box">
                <img src="img/icon0.png"><h4>Özel Hediye Kartı</h4>
                 <p>Mükemmel Hediyeyi Verin</p>
            </div>
            <div class="box">
                <img src="img/icon.png"><h4>Dünya Çapında Gönderim</h4>
                 <p>99 Doların Üzeri Siparişlerde</p>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>
    <script type="text/javascript" src="script.js"></script>
</body>

</html>