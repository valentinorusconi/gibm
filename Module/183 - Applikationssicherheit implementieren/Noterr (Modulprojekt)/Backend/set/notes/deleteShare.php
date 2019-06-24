<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $noteID = test_input($_POST['id'], 'integer');
    $deleteShare = test_input($_POST['email'], 'email');

    $query = "SELECT tbus.ID FROM `editors` AS tbed
            INNER JOIN users AS tbus ON tbus.ID = tbed.UserID
            WHERE tbed.UserID = ? AND tbed.NoteID = ?";

    $query3 = "SELECT ID FROM `users` WHERE Email = ?";

    $query2 = "DELETE FROM `editors` WHERE `editors`.`NoteID` = ? AND `editors`.`UserID` = ?";

    $isowner = execprepstmt($mysqli, $query, 'ii', $_SESSION['user']['info']['id'], $noteID);
    if($isowner->num_rows == 1){

        $userID = execprepstmt($mysqli, $query3, 's', $deleteShare);
        $userID = ($userID->fetch_assoc())['ID'];

        execprepstmt($mysqli, $query2, 'ii', $noteID, $userID);

        write_log($mysqli, 4,'Freigabe gelöscht (Notiz: '.$noteID.', Benutzer: '.$deleteShare.')', $_SERVER);
        echo 'true';

    } else {

        write_log($mysqli, 3,'Fehlerhafter Versuch Freigabe zu löschen (Notiz: '.$noteID.', Benutzer: '.$deleteShare.')', $_SERVER);
        die('false');

    }

?>
