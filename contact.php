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
    <title>oasispazar.com - iletişim</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="line"></div>
    <!-----------------------about us------------------------>

    <div class="line4"></div>
    <div class="form-container">
        <h1 class="title">Mesajınızı Giriniz</h1>
        <form method="post">
            <div class="input-field">
                <label>Adınız</label><br>
                <input type="text" name="name">
            </div>
            <div class="input-field">
                <label>Soyadınız</label><br>
                <input type="text" name="email">
            </div>
            <div class="input-field">
                <label>Numaranız</label><br>
                <input type="number" name="number">
            </div>
            <div class="input-field">
                <label>Mesajınız</label><br>
                <textarea name="message"></textarea>
            </div>
            <button type="submit" name="submit-btn">Mesaj Gönder</button>
        </form>
    </div>
    <div class="line"></div>
    <div class="line2"></div>
    <div class="address">
        <h1 class="title">İletişim Bilgilerimiz</h1>
        <div class="row">
            <div class="box">
                <i class="bi bi-map-fill"></i>
                <div>
                    <h4>Adress</h4>
                    <p>Magazijnstraat 3 3550 <br>Heusden-Zolder Belçika</p>
                </div>
            </div>
            <div class="box">
                <i class="bi bi-telephone-fill"></i>
                <div>
                    <h4>Telefon numarası</h4>
                    <p>0-532-400-93-33</p>
                </div>
            </div>
            <div class="box">
                <i class="bi bi-envelope-fill"></i>
                <div>
                    <h4>email</h4>
                    <p>info@oasispazar.com</p>
                </div>
            </div>
        </div>
    </div>
    <div class="line3"></div>
    <?php include 'footer.php'; ?>
    <script type="text/javascript" src="script.js"></script>
</body>

</html>