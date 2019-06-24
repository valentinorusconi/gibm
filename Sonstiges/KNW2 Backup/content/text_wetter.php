<?php

    $lastupdate = file_get_contents("lastupdate.txt");
    $time = time();
    
    if($lastupdate+3600 <= $time){
        header("Location: generate.php");
    }

?>

<form method="post">
	<select name ="selectDay">
		<option value="0" <?php if(isset($_POST["selectDay"]) && $_POST["selectDay"] == 0){print "selected= 'selected'"; } ?> >Heute</option>
		<option value="8" <?php if(isset($_POST["selectDay"]) && $_POST["selectDay"] == 8){print "selected= 'selected'"; } ?> >Morgen</option>
		<option value="16" <?php if(isset($_POST["selectDay"]) && $_POST["selectDay"] == 16){print "selected= 'selected'"; } ?> >In 2 Tagen</option>
		<option value="24" <?php if(isset($_POST["selectDay"]) && $_POST["selectDay"] == 24){print "selected= 'selected'"; } ?> >In 3 Tagen</option>
		<option value="32" <?php if(isset($_POST["selectDay"]) && $_POST["selectDay"] == 32){print "selected= 'selected'"; } ?> >In 4 Tagen</option>			
	</select>
	<select name ="selectMap">
		<option value="mapWeather" <?php if(isset($_POST["selectMap"]) && $_POST["selectMap"] == "mapWeather"){print "selected = 'selected'";}?>>Wetter</option>
		<option value="mapWind" <?php if(isset($_POST["selectMap"]) && $_POST["selectMap"] == "mapWind"){print "selected = 'selected'";}?>>Wind</option>
		<option value="mapTemp" <?php if(isset($_POST["selectMap"]) && $_POST["selectMap"] == "mapTemp"){print "selected = 'selected'";}?>>Temperatur</option>
		<option value="mapHumid" <?php if(isset($_POST["selectMap"]) && $_POST["selectMap"] == "mapHumid"){print "selected = 'selected'";}?>>Feuchtigkeit</option>
	</select>
	<br></br>
	<input type="submit" value="Aktualisieren">
</form>

<?php
	session_start();
	
	// include_once("generate.php");
    
	
	if (isset($_POST["selectDay"]) && isset($_POST["selectMap"])){
		$day = $_POST["selectDay"];	
		$map = $_POST["selectMap"];
		$map = $map.$day;
	
		$image = $_SESSION[$map];
		echo '<img src="data:images/png;base64,'.base64_encode($image).'" />';
		echo "<br>";
	}
?>