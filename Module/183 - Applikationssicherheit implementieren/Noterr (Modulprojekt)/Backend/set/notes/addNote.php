<?php

    include '../../include/session.php';
    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $noteTitle = test_input($_POST['title'], 'string');
    $query = "INSERT INTO `notes` (`Title`) VALUES (?)";
    $query2 = "SELECT MAX(id) FROM notes WHERE Title = ?";
    $query3 = "INSERT INTO `editors` (`UserID`, `NoteID`) VALUES (?, ?)";

    if(strlen($noteTitle) <= 0){
        die('false');
    }

    execprepstmt($mysqli, $query, 's', $noteTitle);
    $newID = execprepstmt($mysqli, $query2, 's', $noteTitle);
    $newID = ($newID->fetch_assoc())['MAX(id)'];

    execprepstmt($mysqli, $query3, 'ii', $_SESSION['user']['info']['id'], $newID);

    write_log($mysqli, 4,'Notiz erstellt (ID: '.$newID.')', $_SERVER);

    echo 'true';

?>
