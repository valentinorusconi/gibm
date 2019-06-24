<?php

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $f_pictureID = test_input($_POST['pictureID']);
    $f_rating = test_input($_POST['stars']);
    if($f_rating < 1){$f_rating = 1;};
    if($f_rating > 5){$f_rating = 5;};

    //Add Rating to DB
    include("../include/database/connect.php");
    $stmt = $mysqli->prepare("INSERT INTO `tb_rating` (`rating`, `tb_image_id`) VALUES (?, ?)");
    if ( false===$stmt ) {
        die('Submit Error #1');
    }
    $rc = $stmt->bind_param('ii', $f_rating, $f_pictureID);
    if ( false===$rc ) {
        die('Submit Error #2');
    }

    $rc = $stmt->execute();
    if ( false===$rc ) {
        die('Submit Error #3');
    }
    $stmt->close();
    //Add Rating to DB - DONE

?>
