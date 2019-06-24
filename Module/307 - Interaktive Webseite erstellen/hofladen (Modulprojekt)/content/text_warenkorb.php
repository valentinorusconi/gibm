<?php

    $headers = array("Artikel", "Menge", "Preis/Stück", "Summe");
    
    $str = file_get_contents("artikel.json");
	$json = json_decode($str, TRUE);
	$data = $json["produkte"];
    
    $waren = $_SESSION["warenkorb"];
    
    if (empty($waren)) {
        echo "<p>Ihr Warenkorb ist leer.</p>";
    } else {
        $sum = 0;
        echo "<table style='width: 100%;'>";
        echo "<form action='warenkorb.php?change()' method='_POST'/>";
        foreach($headers as $header){
            echo "<th>".$header."</th>";
        }
        foreach($waren as $ware){
            foreach($data as $item){
                if($item["id"] == $ware["id"]){
                    echo "<tr>";
                    echo "<td>".$item["titel"]. "</td>";
                    echo "<td><input type='number' style='width: 50px;' name='newAmount' value='".$ware["amount"]. "'/></td>";
                    echo "<td>".$item["preis"]. " CHF <br/>(". ($item["preis"]*0.9234) ." Euro)<br/>(". ($item["preis"]*114.44) ." ISK)</td>";
                    echo "<td>".($item["preis"]*$ware["amount"]). " CHF <br/>(". (($item["preis"]*$ware["amount"])*0.9234) ." Euro)<br/>(". (($item["preis"]*$ware["amount"])*114.44) ." ISK)</td>";
                    echo "</tr>";
                    $sum = $sum + ($item["preis"]*$ware["amount"]);
                }
            }
        }
        echo "<td colspan='3'>Summe aller Artikel: </td><td style='text-align: right;' > ".$sum.
        " CHF<br/> (". ($sum*0.9234) . " Euro)<br/> (". ($sum*114.44) ." ISK)<br/><input type='submit' value='Aktualisieren'/></td>";
        echo "</form></table>";
    }

    
    
?>