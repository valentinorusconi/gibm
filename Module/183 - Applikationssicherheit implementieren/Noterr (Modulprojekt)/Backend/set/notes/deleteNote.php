<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $noteID = test_input($_POST['id'], 'integer');

    $query = "SELECT ID FROM `editors` WHERE UserID = ? AND NoteID = ?";
    $query2 = "DELETE FROM `editors` WHERE `editors`.`NoteID` = ?";
    $query3 = "DELETE FROM `notes` WHERE `notes`.`ID` = ?";

    $isowner = execprepstmt($mysqli, $query, 'ii', $_SESSION['user']['info']['id'], $noteID);
    if($isowner->num_rows == 1){

        execprepstmt($mysqli, $query2, 'i', $noteID);
        execprepstmt($mysqli, $query3, 'i', $noteID);

        write_log($mysqli, 4,'Notiz gelöscht (ID: '.$noteID.')', $_SERVER);

    } else {
        write_log($mysqli, 3,'Fehlerhafter Versuch Notiz zu löschen (ID: '.$noteID.')', $_SERVER);
        die('false');
    }


    echo 'true';

?>
