Bitte loggen Sie sich ein:<br><br>

<form method="POST" action="#">	
	User Name: <br><br>
	<input type="text" name="user" required/><br><br>
	Passwort:<br><br>
	<input type="password" name="password" required/><br><br>
	<input type="submit" value="Login" name="sent"><br>
	
</form>
<br/>

<?php

	if(isset($_POST['sent'])){
		if ($_POST["user"] == "admin" && $_POST["password"] == "admin"){
			header('Location: http://localhost/M307/hofladen/admin_edit.php');
		} else {
			echo "<p color='red'>Benutzername und/oder Passwort inkorrekt.</p>";
		}
	}

?>
