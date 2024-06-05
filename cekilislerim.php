<?php
session_start(); // Oturumu başlat

// Veritabanı bağlantısı
include 'connection.php';

// Oturumdaki kullanıcı ID'sini alın
$user_id = $_SESSION['user_id'];

// Kullanıcının katıldığı çekilişlerde kime hediye alacağını bulmak için sorgu
$query = mysqli_query($conn, "
    SELECT re.raffle_id, u.user_id AS gift_user_id, u.name AS gift_name, u.email AS gift_email, u.adress AS gift_address, u.upper_body_size, u.lower_body_size, u.shoe_size
    FROM raffle_entries re
    JOIN userinfo u ON re.gift_user_id = u.user_id
    WHERE re.user_id = '$user_id'
");
?>

<?php include 'cekilishead.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Çekilişlerim</title>
</head>
<body>
    <h2>Çekilişlerim</h2>

    <?php if (mysqli_num_rows($query) > 0): ?>
        <table border="1">
            <tr>
                <th>Çekiliş ID</th>
                <th>Hediye Alacağınız Kişi</th>
                <th>Kullanıcı ID</th>
                <th>Mail Adresi</th>
                <th>Adres</th>
                <th>Üst Beden Ölçüsü</th>
                <th>Alt Beden Ölçüsü</th>
                <th>Ayakkabı Numarası</th>
            </tr>
            <?php while ($row = mysqli_fetch_assoc($query)): ?>
                <tr>
                    <td><?php echo $row['raffle_id']; ?></td>
                    <td><?php echo $row['gift_name']; ?></td>
                    <td><?php echo $row['gift_user_id']; ?></td>
                    <td><?php echo $row['gift_email']; ?></td>
                    <td><?php echo $row['gift_address']; ?></td>
                    <td><?php echo $row['upper_body_size']; ?></td>
                    <td><?php echo $row['lower_body_size']; ?></td>
                    <td><?php echo $row['shoe_size']; ?></td>
                </tr>
            <?php endwhile; ?>
        </table>
    <?php else: ?>
        <p>Henüz katıldığınız çekiliş yok.</p>
    <?php endif; ?>
</body>
</html>
