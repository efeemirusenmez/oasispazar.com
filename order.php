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
    if (isset($_POST['submit-btn'])) {
        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $number = mysqli_real_escape_string($conn, $_POST['number']);
        $message = mysqli_real_escape_string($conn, $_POST['message']);

        $select_message = mysqli_query($conn, "SELECT * FROM `message` WHERE name= '$name' AND email='$email' AND $number = '$number' AND message= '$message'") or die('query failed');
        if (mysqli_num_rows($select_message)>0) {
            echo 'message already send';
        }else{
            mysqli_query($conn, "INSERT INTO `message`(`user_id`,`name`,`email`,`number`,`message`) VALUES('$user_id','$name','$email','$number','$message')") or die('query failed');
        }
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
    <title>oasispazar.com - Sipraiş sayfası</title>
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="banner">
        <div class="detail">
            <h1>Siparişler</h1>
            <p>Siparişlerinizi görebilirsiniz.</p>
            <a href="index.php">anasayfa</a><span>/ Siparişler</span>
        </div>
    </div>
    <div class="line"></div>
    <div class="order-section">
        <div class="box-container">
            <?php 
                $select_orders=mysqli_query($conn, "SELECT * FROM `orders` WHERE user_id='$user_id'") or die('query failed');
                if (mysqli_num_rows($select_orders)>0) {
                    while($fetch_orders = mysqli_fetch_assoc($select_orders)){


            ?>
            <div class="box">
                <p>üzerine yerleştirilir: <span><?php echo $fetch_orders['placed_on']; ?></span></p>
                <p>isim: <span><?php echo $fetch_orders['name']; ?></span></p>
                <p>numara: <span><?php echo $fetch_orders['number']; ?></span></p>
                <p>email: <span><?php echo $fetch_orders['email']; ?></span></p>
                <p>address: <span><?php echo $fetch_orders['address']; ?></span></p>
                <p>ödeme yöntemi: <span><?php echo $fetch_orders['method']; ?></span></p>
                <p>Siparişleriniz: <span><?php echo $fetch_orders['total_products']; ?></span></p>
                <p>toplam fiyat: <span><?php echo $fetch_orders['total_price']; ?></span></p>
                <p>ödeme durumu: <span><?php echo $fetch_orders['payment_status']; ?></span></p>
            </div>
            <?php
                    }
                }else{
                        echo '
                            <div class="empty">
                                <p>Henüz Sipariş Verilmedi!</p>
                            </div>
                        ';
                }
            ?>
        </div>
    </div>
    <?php include 'footer.php'; ?>
    <script type="text/javascript" src="script.js"></script>
</body>

</html>