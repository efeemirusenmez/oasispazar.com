<?php 
	include 'connection.php';
	session_start();

	if (isset($_POST['submit-btn'])) {
		

		$filter_email = filter_var($_POST['email'], FILTER_SANITIZE_STRING);
		$email = mysqli_real_escape_string($conn, $filter_email);

		$filter_password = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
		$password = mysqli_real_escape_string($conn, $filter_password);

		$select_user = mysqli_query($conn, "SELECT * FROM `users` WHERE email = '$email' and password = '$password'") or die('query failed');

		if (mysqli_num_rows($select_user)>0) {
			$row = mysqli_fetch_assoc($select_user);
			if ($row['user_type']== 'admin') {
				$_SESSION['admin_name'] = $row['name'];
				$_SESSION['admin_email'] = $row['email'];
				$_SESSION['admin_id'] = $row['id'];
				header('location:admin_pannel.php');
			}else if($row['user_type']== 'user'){
				$_SESSION['user_name'] = $row['name'];
				$_SESSION['user_email'] = $row['email'];
				$_SESSION['user_id'] = $row['id'];
				header('location:index.php');
			}else{
				$message[] = 'incorrect email or password';
			}
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--box icon link-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<title>oasispazar.com - Giriş Sayfası</title>
</head>
<body>
	
	
	<section class="form-container">
		<?php 
			if (isset($message)) {
				foreach ($message as $message) {
					echo '
						<div class="message">
							<span>'.$message.'</span>
							<i class="bi bi-x-circle" onclick="this.parentElement.remove()"></i>
						</div>

					';
				}
			}
		?>
		<form method="post">
			<h1>Giriş Yap</h1>
			<div class="input-field">
				<label>Mailiniz</label><br>
				<input type="email" name="email" placeholder="e mailinizi giriniz" required>
			</div>
			<div class="input-field">
				<label>Şifreniz</label><br>
				<input type="password" name="password" placeholder="şifrenizi yazınız" required>
			</div>
			<input type="submit" name="submit-btn" value="login now" class="btn">
			<p>bir hesabınız yok mu? <a href="register.php">Kayıt Ol</a></p>
		</form>
	</section>
</body>
</html>