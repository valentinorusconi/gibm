<?php
	session_start();
	
	$updateTime = time();
	$file = fopen("lastupdate.txt", "w") or die("Unable to open file!");
	fwrite($file, $updateTime);
	fclose($file);
	
	header("Location: wetter.php");
	
	$cityData = array(			array("name" => "Basel", "x" => 220, "y" => 40),
								array("name" => "Bern", "x" => 200, "y" => 170),
								array("name" => "Chur", "x" => 510, "y" => 186),
								array("name" => "Zuerich", "x" => 358, "y" => 80),
								array("name" => "Luzern", "x" => 323, "y" => 147),
								array("name" => "Bellinzona", "x" => 431, "y" => 326),
								array("name" => "Sion", "x" => 190, "y" => 321),
								array("name" => "SanktGallen", "x" => 477, "y" => 66),
								array("name" => "Genf", "x" => 8, "y" => 326)
			);	
	
	$APPID = "182bb4c6d1c05bf770e1822a47ac8712";	
	
	$i = 0;
	
	while ($i < 39){	
		
		$imgWeatherMap = imagecreatefrompng('images/map_weather.png');
		$imgWindMap = imagecreatefrompng('images/map_wind.png');
		$imgTempMap = imagecreatefrompng('images/map_temp.png');
		$imgHumidMap = imagecreatefrompng('images/map_humid.png');
		
		foreach($cityData as $city){
			// get data for each city
			$url = "http://api.openweathermap.org/data/2.5/forecast/city?q=".$city["name"]."&lang=en&units=metric&id=524901&APPID=".$APPID;
			$contents = file_get_contents($url);
			$clima=json_decode($contents, TRUE);
			
			//get weather icon for each city	
				
			$weatherIcon = imagecreatefrompng("http://openweathermap.org/img/w/".$clima["list"][$i]["weather"]["0"]["icon"].".png" );
			imagealphablending($imgWeatherMap, true);
			imagesavealpha($imgWeatherMap, true);
			imagecopy($imgWeatherMap, $weatherIcon, $city["x"], $city["y"], 0, 0, 50, 50);
			
			//get humidity for each city
			
			$humidity = $clima["list"][$i]["main"]["humidity"]."%";
			$blue = imagecolorallocate($imgHumidMap, 0, 0, 255);
			$font = "fonts/arialbd.ttf";
			imagefttext($imgHumidMap, 12, 0, ($city["x"]), ($city["y"]+20), $blue, $font, $humidity);
			
			// get temperature for each city			
			
			$maxTemp = $clima["list"][$i]["main"]["temp_max"];
			$minTemp = $clima["list"][$i]["main"]["temp_min"];
			$maxTemp = round($maxTemp, 1)."°C";
			$minTemp = round($minTemp, 1)."°C";
			$red = imagecolorallocate($imgTempMap, 255, 0, 0);
			$orange = imagecolorallocate($imgTempMap, 255, 165, 0);
			if ($maxTemp > 10){
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+20), $orange, $font, $maxTemp);				
			} else if($maxTemp > 30){
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+20), $red, $font, $maxTemp);
			} else {
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+20), $blue, $font, $maxTemp);
			}
			if ($minTemp > 10){
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+35), $orange, $font, $minTemp);				
			} else if($minTemp > 30){
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+35), $red, $font, $minTemp);
			} else {
				imagefttext($imgTempMap, 12, 0, ($city["x"]), ($city["y"]+35), $blue, $font, $minTemp);
			}
			
			// get wind for each city
			
			$windDeg = $clima["list"][$i]["wind"]["deg"];
			$windSpeed = $clima["list"][$i]["wind"]["speed"];
			$windSpeed = round(($windSpeed*3.6), 1)." km/h";
			$windIcon = imagecreatefrompng("images/wind_klein.png");
			imagealphablending($windIcon, false);
        	imagesavealpha($windIcon, true);
        	$white = imagecolorallocate($imgWindMap, 255, 255, 255);
        	
        	$rotatedWindIcon = imagerotate($windIcon, $windDeg, imageColorAllocateAlpha($windIcon, 0, 0, 0, 127));
        	imagealphablending($rotatedWindIcon, false);
        	imagesavealpha($rotatedWindIcon, true);
        	imagefttext($imgWindMap, 12, 0, ($city["x"]), ($city["y"]), $white, $font, $windSpeed);
        	imagecopy($imgWindMap, $rotatedWindIcon, $city["x"], $city["y"], 0, 0, 66, 66);

							
		}   		
		
		ob_start();
		imagepng($imgWeatherMap);
		$mapWeather = ob_get_contents();
		ob_end_clean();
		
		ob_start();
		imagepng($imgHumidMap);
		$mapHumid = ob_get_contents();
		ob_end_clean();
		
		ob_start();
		imagepng($imgTempMap);
		$mapTemp = ob_get_contents();
		ob_end_clean();
		
		ob_start();
		imagepng($imgWindMap);
		$mapWind = ob_get_contents();
		ob_end_clean();
		
		$_SESSION["mapWeather".$i] = $mapWeather;
		$_SESSION["mapHumid".$i] = $mapHumid;
		$_SESSION["mapTemp".$i] = $mapTemp;
		$_SESSION["mapWind".$i] = $mapWind;
		
		$i += 8;		
	}		
	
?>