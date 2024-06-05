<?php
session_start(); // Oturumu başlat

// Veritabanı bağlantısı
include 'connection.php';

// Çekiliş ID'sini oturuma kaydetme
if (isset($_POST['set_raffle_id'])) {
    $_SESSION['raffle_id'] = $_POST['raffle_id'];
}

// Eğer başka bir kullanıcının ID'si gönderilmişse
if (isset($_GET['other_user_id'])) {
    // Başka bir kullanıcının ID'sini alın
    $other_user_id = $_GET['other_user_id'];

    // Seçilen kullanıcının bilgilerini veritabanından alın
    $query = mysqli_query($conn, "SELECT * FROM userinfo WHERE user_id = '$other_user_id'");
    if (mysqli_num_rows($query) > 0) {
        // Kullanıcının bilgilerini göster
        $row = mysqli_fetch_assoc($query);
    } else {
        $error_message = "Kullanıcının bilgileri bulunamadı.";
    }
}

// Eğer ekle butonuna tıklanmışsa
if (isset($_POST['add_to_raffle'])) {
    // Çekiliş ID'sini ve seçilen kullanıcı ID'sini alın
    $raffle_id = $_SESSION['raffle_id'];
    $selected_user_id = $_POST['selected_user_id'];

    // Çekiliş ID'si ve kullanıcı ID'sini veritabanına ekleyin
    $insert_query = mysqli_query($conn, "INSERT INTO raffle_entries (raffle_id, user_id) VALUES ('$raffle_id', '$selected_user_id')");
    if ($insert_query) {
        $success_message = "Kullanıcı çekilişe eklendi.";
    } else {
        $error_message = "Kullanıcı çekilişe eklenirken bir hata oluştu.";
    }
}

// Eğer çekilişi bitir butonuna tıklanmışsa
if (isset($_POST['end_raffle'])) {
    $raffle_id = $_SESSION['raffle_id'];

    // Çekilişteki tüm kullanıcıları alın
    $query = mysqli_query($conn, "SELECT user_id FROM raffle_entries WHERE raffle_id = '$raffle_id'");
    $users = [];
    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $users[] = $row['user_id'];
        }

        // Kullanıcıları rastgele karıştırın
        shuffle($users);

        // Hediye alacak kişileri belirleyin
        $gift_assignments = [];
        $count = count($users);
        for ($i = 0; $i < $count; $i++) {
            $gift_assignments[$users[$i]] = $users[($i + 1) % $count];
        }

        // Eşleşmeleri veritabanına kaydedin
        foreach ($gift_assignments as $user_id => $gift_user_id) {
            $update_query = mysqli_query($conn, "UPDATE raffle_entries SET gift_user_id = '$gift_user_id' WHERE raffle_id = '$raffle_id' AND user_id = '$user_id'");
        }

        unset($_SESSION['raffle_id']); // Çekiliş ID'sini oturumdan kaldır
        $end_message = "Çekiliş sona erdi ve hediye atamaları yapıldı.";
    } else {
        $end_message = "Çekilişte kullanıcı bulunamadı.";
    }
}
?>
    <?php include 'cekilishead.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diğer Kullanıcı Bilgileri</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #FCC927;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}





.container {
  padding: 16px;
}


</style>
<body>
    <h2>Diğer Kullanıcı Bilgileri</h2>
    
<?php include 'infobox.php'; ?>
    
    <?php if (!isset($_SESSION['raffle_id'])): ?>
        <form action="" method="POST">
            <label for="raffle_id">Çekiliş ID'si Oluştur:</label>
            <input type="text" id="raffle_id" name="raffle_id" required>
            <button type="submit" name="set_raffle_id">Oluştur</button>
        </form>
    <?php endif; ?>

    <form action="" method="GET">
        <label for="other_user_id">Başka Bir Kullanıcı ID'si:</label>
        <input type="text" id="other_user_id" name="other_user_id" required>
        <button type="submit">Çekilişte Olacak Kullanıcı Bilgileri Getir</button>
    </form>
    <div class="container">
    <?php if (isset($row)): ?>
        <p>Kullanıcı adı: <span><?php echo $row['name']; ?></span></p>
        <p>Mail Adresi: <span><?php echo $row['email']; ?></span></p>
        <p>Adres: <span><?php echo $row['adress']; ?></span></p>
        </div>
        <!-- Ekle butonu ekleniyor -->
        <form action="" method="POST">
            <input type="hidden" name="selected_user_id" value="<?php echo $other_user_id; ?>">
            <button type="submit" name="add_to_raffle">Ekle</button>
        </form>
    <?php elseif (isset($error_message)): ?>
        <p><?php echo $error_message; ?></p>
    <?php endif; ?>

    <?php if (isset($success_message)): ?>
        <p><?php echo $success_message; ?></p>
    <?php endif; ?>

    <?php if (isset($_SESSION['raffle_id'])): ?>
        <form action="" method="POST">
            <a href="cekilislerim.php"><button type="submit" name="end_raffle">Çekilişi Bitir</button></a>
        </form>
    <?php endif; ?>

    <?php if (isset($end_message)): ?>
        <p><?php echo $end_message; ?></p>
    <?php endif; ?>

</body>
</html>
