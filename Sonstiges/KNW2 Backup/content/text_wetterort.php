<p>Suchen Sie nach dem Wetter in einer bestimmten Ortschaft. Geben SIe den Namen der Ortschaft hier ein:</p>
<form action="wetterort.php" method="post">
    <input type="text" name="ort"/>
    <input type="submit" value="Anzeigen"/>
</form><br/><br/>
<?php

    if (isset($_POST["ort"])) {
        $ort = $_POST["ort"];
        
        $url = "http://api.openweathermap.org/data/2.5/weather?q=$ort&lang=en&units=metric&appid=4a1ec1e7156a2ff287fb7fc5f4093362";
        
        $contents = @file_get_contents($url);

        if($http_response_header[0] !== "HTTP/1.1 500 Internal Server Error") {
   
            
            $clima=json_decode($contents);
            
            $temp_max=$clima->main->temp_max;
            $temp_min=$clima->main->temp_min;
            $country=$clima->sys->country;
            $temp=$clima->main->temp;
            $icon=$clima->weather[0]->icon.".png";
            $windspeed=($clima->wind->speed)*3.6;
            $feuchte=$clima->main->humidity;
            $druck=$clima->main->pressure;
            
            
            $filename = 'images/wind_klein.png';
            if(isset($clima->wind->deg)){
                $rotang = $clima->wind->deg;
            } else {
                $rotang = 0;
            }
            $source = imagecreatefrompng($filename) or die('Error opening file '.$filename);
            imagealphablending($source, false);
            imagesavealpha($source, true);
        
            $rotation = imagerotate($source, $rotang, imageColorAllocateAlpha($source, 0, 0, 0, 127));
            imagealphablending($rotation, false);
            imagesavealpha($rotation, true);
            ob_start();
            imagepng($rotation);
            $image = ob_get_contents();
            ob_end_clean();
            
            
            
            //how get today date time PHP :P
            $today = date("F j, Y, g:i a");
            $cityname = $clima->name; 
            
            echo ("
                  
                  <table>
                    <tr>
                        <th colspan='2'>".$country." - ".$cityname." - ".$today."</th>
                    </tr>
                    <tr>
                        <td>Wetter </td>
                        <td><img src='http://openweathermap.org/img/w/" . $icon ."'/ ></td>
                    </tr>
                    <tr>
                        <td>Temperatur aktuelll</td>
                        <td>".$temp." °C</td>
                    </tr>
                    <tr>
                        <td>Max. Temperatur </td>
                        <td>".$temp_max." °C</td>
                    </tr>
                    <tr>
                        <td>Min. Temperatur </td>
                        <td>".$temp_min." °C</td>
                    </tr>
                    <tr>
                        <td>Luftfeuchtigkeit</td>
                        <td>".$feuchte." %</td>
                    </tr>
                    <tr>
                        <td>Luftdruck</td>
                        <td>".$druck." hPa</td>
                    </tr>
                    <tr>
                        <td>Wind</td>
                        <td>".$windspeed." Km/h <br/> <img src='data:images/png;base64,".base64_encode($image)."' /></td>
                    </tr>
                </table>
                  
                  ");
        } else {
            echo("Ihre Eingabe konnte nicht gefunden werden. Bitte überprüfen Sie sie auf Schreibfehler");
        }
        
        
    }

        
        
?>
