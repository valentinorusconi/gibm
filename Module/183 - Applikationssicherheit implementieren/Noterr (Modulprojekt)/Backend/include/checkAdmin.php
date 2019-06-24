<?php

    $checkGroup = "SELECT GroupID FROM `users` WHERE ID = ?";
    $isAdmin = execprepstmt($mysqli, $checkGroup, 'i', $_SESSION['user']['info']['id']);
    $isAdmin = ($isAdmin->fetch_assoc())['GroupID'];
    if($isAdmin !== 2){
        write_log($mysqli, 1,'Fehlerhafter Versuch auf Adminfunktion zuzugreifen.', $_SERVER);
        die('false');
    }

?>
