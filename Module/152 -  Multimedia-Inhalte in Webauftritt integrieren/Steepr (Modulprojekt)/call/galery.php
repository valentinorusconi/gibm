<?php

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $f_key = test_input($_POST['key']);
    $f_sorting = test_input($_POST['sorting']);
    $f_currentSector = test_input($_POST['currentSector']);

    if(!$f_currentSector){$f_currentSector = "1";};
    if(!$f_sorting){$f_sorting = "recent";};

    $selectStart = ($f_currentSector-1) * 12;
    $selectAmount = 12;

    //Form the search Query
    $query = "SELECT tbim.id, tbim.img_path_thumbnail, tbim.img_path_preview FROM `tb_image` AS tbim";

    if($f_sorting == "rated"){
        $query.= "
        LEFT JOIN tb_rating AS tbra ON tbra.tb_image_id = tbim.id";
    }

    if($f_key){

        $query .= "
        LEFT JOIN tb_tag AS tbtag ON tbim.id = tbtag.tb_image_id
        WHERE";

        $f_key = str_replace([", ",",","  "], " ", $f_key);
        $f_key = explode(" ", $f_key);
        $first = true;

        foreach($f_key as $item) {
            if($item){
                if(!$first){
                    $query .= " OR tbtag.tag LIKE '%".$item."%'";
                } else {
                    $query .= " tbtag.tag LIKE '%".$item."%'";
                    $first = false;
                }
            }
        }

    }

    if($f_sorting == "rated"){
        $query .= "
    GROUP BY tbim.id
    ORDER BY AVG(tbra.rating) DESC";

    } else if($f_sorting == "viewed"){
        $query .= "
    GROUP BY tbim.id
    ORDER BY tbim.views DESC";
    } else {
        $query .= "
    GROUP BY tbim.id
    ORDER BY tbim.created DESC ";
    }

    $query .= "
    LIMIT ".$selectStart.", ".$selectAmount.";";
    //Form the search Query - DONE

    //Get the Data
    $filesString = array();
    include('../include/database/connect.php');
    $result = $mysqli->query($query);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($filesString, array($row['id'], $row['img_path_thumbnail'], $row['img_path_preview']));
        }
    } else {
        echo -1;
        die();
    }

    echo json_encode($filesString);
    die();

?>
