<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    if($_SESSION['user']['info']['group'] !== 2){
        write_log($mysqli, 1,'Fehlerhafter Versuch Benutzergruppe anzupassen.', $_SERVER);
        die('false');
    }

    include '../../include/checkAdmin.php';

    $userID = test_input($_POST['userid'], 'integer');
    $newGroup = test_input($_POST['group'], 'integer');

    $query = "UPDATE `users` SET `GroupID` = ? WHERE `users`.`ID` = ?;";

    execprepstmt($mysqli, $query, 'ii', $newGroup, $userID);

    echo('true');

?>
