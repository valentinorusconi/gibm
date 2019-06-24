<?php
		
	$str = file_get_contents("artikel.json");
	$json = json_decode($str, TRUE);
	$data = $json["produkte"];
	
	if (is_array($data) || is_object($data))
	{
		foreach($data as $item){
			if($item["kategorie"] == "rind"){
				echo ("	
					<div class='shopartikel'>
						<img style='width: 200px;' src='" . $item["bild"]. "' class='shoppic'/>
						<h2>". $item["titel"]."</h2>
						<p>". $item["beschreibung"]."</p>
						<p> CHF ". $item["preis"].".-</p>
					</div>
				");
			}
		}
	}
	

?>