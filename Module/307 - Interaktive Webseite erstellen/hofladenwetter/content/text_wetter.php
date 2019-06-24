<?php

//units=For temperature in Celsius use units=metric
//5128638 is new york ID

$url2 = "http://api.openweathermap.org/data/2.5/weather?id=2661604&lang=en&units=metric&APPID=4a1ec1e7156a2ff287fb7fc5f4093362";
$url = "http://api.openweathermap.org/data/2.5/weather?q=London,uk&lang=en&units=metric&appid=4a1ec1e7156a2ff287fb7fc5f4093362";

$contents = file_get_contents($url);
$clima=json_decode($contents);

$temp_max=$clima->main->temp_max;
$temp_min=$clima->main->temp_min;
$icon=$clima->weather[0]->icon.".png";
//how get today date time PHP :P
$today = date("F j, Y, g:i a");
$cityname = $clima->name; 

echo $cityname . " - " .$today . "<br>";
echo "Temp Max: " . $temp_max ."&deg;C<br>";
echo "Temp Min: " . $temp_min ."&deg;C<br>";
echo "<img src='http://openweathermap.org/img/w/" . $icon ."'/ >";

?>