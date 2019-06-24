<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    if($_SESSION['user']['info']['group'] !== 2){
        write_log($mysqli, 1,'Fehlerhafter Versuch Benutzer zu löschen.', $_SERVER);
        die('false');
    }

    include '../../include/checkAdmin.php';

    $userID = test_input($_POST['userid'], 'integer');
    $query = "DELETE FROM `users` WHERE `users`.`ID` = ?";

    execprepstmt($mysqli, $query, 'i', $userID);

    echo('true');

?>
