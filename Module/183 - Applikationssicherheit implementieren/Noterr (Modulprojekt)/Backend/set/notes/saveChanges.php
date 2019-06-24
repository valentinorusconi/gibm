<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $noteID = test_input($_POST['id'], 'integer');
    $changes = test_input($_POST['content'], 'string');
    $newDate = test_input($_POST['date'], 'string');

    $formatDate = date("Y-m-d H:i:s", strtotime($newDate));

    $query = "SELECT ID FROM `editors` WHERE UserID = ? AND NoteID = ?";
    $query2 = "UPDATE `notes` SET `Content` = ?, `Deadline` = ? WHERE `notes`.`ID` = ?";

    $isowner = execprepstmt($mysqli, $query, 'ii', $_SESSION['user']['info']['id'], $noteID);
    if($isowner->num_rows == 1){

        execprepstmt($mysqli, $query2, 'ssi', $changes, $formatDate, $noteID);
        write_log($mysqli, 4,'Notiz bearbeitet (ID: '.$noteID.')', $_SERVER);

    } else {
        write_log($mysqli, 1,'Fehlerhafter Versuch Notiz zu bearbeiten (ID: '.$noteID.')', $_SERVER);
    }

    echo 'true';

?>
