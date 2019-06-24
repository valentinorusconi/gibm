<?php

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $f_pictureID = test_input($_POST['pictureID']);

    include('../include/database/connect.php');
    $query = "SELECT tbimg.img_title, tbimg.img_description, tbimg.img_path_full,
                tbimg.img_path_preview, tbimg.created, tbimg.views,
                AVG(tbrat.rating) AS rating FROM `tb_image` AS tbimg
                LEFT OUTER JOIN tb_rating AS tbrat ON tbrat.tb_image_id = tbimg.id
                WHERE tbimg.id = ".$f_pictureID." GROUP BY tbimg.id";
    $query2 = "UPDATE `tb_image` SET `views` = `views`+1 WHERE `tb_image`.`id` = ".$f_pictureID;
    $query3 = "SELECT tag FROM `tb_tag` WHERE tb_image_id = ".$f_pictureID;
    $mysqli->query($query2);

    $response = [];

    $result = $mysqli->query($query);
    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        array_push($response, $row);
    } else {
        echo -1;
        die();
    }

    $result = $mysqli->query($query3);
    if ($result->num_rows >= 1) {
        $tags = [];
        while($row = $result->fetch_assoc()) {
            array_push($tags, $row['tag']);
        }
        array_push($response, $tags);
    }

    echo json_encode($response);

?>
