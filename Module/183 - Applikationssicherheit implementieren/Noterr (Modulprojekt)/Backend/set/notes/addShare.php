<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $noteID = test_input($_POST['id'], 'integer');
    $shareUser = test_input($_POST['email'], 'email');

    $query = "SELECT tbus.ID FROM `editors` AS tbed
            INNER JOIN users AS tbus ON tbus.ID = tbed.UserID
            WHERE tbed.UserID = ? AND tbed.NoteID = ?";

    $query3 = "SELECT ID FROM `users` WHERE Email = ?";

    $query2 = "INSERT INTO `editors` (`UserID`, `NoteID`) VALUES (?, ?);";

    $isowner = execprepstmt($mysqli, $query, 'ii', $_SESSION['user']['info']['id'], $noteID);
    if($isowner->num_rows == 1){

        $userID = execprepstmt($mysqli, $query3, 's', $shareUser);
        if($userID->num_rows !== 1){
            write_log($mysqli, 3,'Fehlerhafter Versuch Freigabe zu erstellen (Notiz: '.$noteID.', Benutzer: '.$shareUser.')', $_SERVER);
            die('false');
        }

        $userID = ($userID->fetch_assoc())['ID'];
        execprepstmt($mysqli, $query2, 'ii', $userID, $noteID);

        write_log($mysqli, 4,'Freigabe erstellt (Notiz: '.$noteID.', Benutzer: '.$shareUser.')', $_SERVER);
        echo 'true';

    } else {
        write_log($mysqli, 3,'Fehlerhafter Versuch Freigabe zu erstellen (Notiz: '.$noteID.', Benutzer: '.$shareUser.')', $_SERVER);
        die('false');
    }

?>
