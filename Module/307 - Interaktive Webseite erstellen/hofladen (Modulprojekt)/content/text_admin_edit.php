<?php
	$headers = array("ID", "Titel", "Beschreibung", "Kategorie", "Preis", "Bild", "");	
		
	$str = file_get_contents("artikel.json");
	$json = json_decode($str, TRUE);
	$data = $json["produkte"];
	
	echo "Produkte: " .count($data);
	
	echo "<table>";
	
	foreach($headers as $header){
		echo "<th>".$header."</th>";
	}
	
	?>
	
	<tr>
		<td>
			<?php echo (count($data)+1); ?>
		</td>
		<td>
			<input type="text" name="titel" required/>
		</td>
		<td>
			<input type="text" name="beschreibung" required/>
		</td>
		<td>
			<select style="max-width: 100px;" required>
				<option value="rind">Rind</option>
				<option value="kaninchen">Kaninchen</option>
				<option value="pflanzlich">Pflanzlich</option>
			</select>
		</td>
		<td>
			<input type="number" style="max-width: 60px;" name="preis" required/>
		</td>
		<td>
			<input name="userfile" style="max-width: 135px;" type="file" />
		</td>
		<td>
			<a style="color: black; text-decoration: none;" href="#"><img width="30px;" src="images/add.png"/></a>
		</td>
	</tr>
	
	<?php
	
	if (is_array($data) || is_object($data))
	{
		foreach($data as $item){
				
			echo "<tr>";
			echo "<td> ". $item["id"]."</td>";
			echo "<td> ". $item["titel"]."</td>";
			echo "<td> ". $item["beschreibung"]."</td>";
			echo "<td> ". $item["kategorie"]."</td>";
			echo "<td> ". $item["preis"]."</td>";
			echo "<td><img style='width: 139px;' src='" . $item["bild"]. "'/> </td>";
			echo "<td><a href='#'><img width='20px;' align='center' src='images/trash.png'/></a><a href='#'><br/><br/><img width='20px;' align='center' src='images/edit.png'/></a></td>";
			
				}
		}
	
	echo "</table>";

?>