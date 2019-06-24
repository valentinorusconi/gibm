<?php

    include '../include/session.php';
    include '../include/database.php';
    include '../include/testoutput.php';
    include '../include/logging.php';

    if($_SESSION['user']['info']['group'] !== 2){
        write_log($mysqli, 1,'Fehlerhafter Versuch auf Benutzerliste zuzugreifen.', $_SERVER);
        die('false');
    }

    include '../include/checkAdmin.php';

    write_log($mysqli, 4,'Auf Benutzerliste (Adminfunktion) zugegriffen.', $_SERVER);

    $query = 'SELECT tbus.ID, tbus.Email, tbgr.Name FROM `users` AS tbus
                INNER JOIN groups AS tbgr ON tbus.GroupID = tbgr.ID';

    $users = array();

    $result = $mysqli->query($query);
    if (isset($result) && $result->num_rows >= 1) {
        while($row = $result->fetch_assoc()){
            array_push($users, array(
                'id' => $row['ID'],
                'email' => escaped($row['Email']),
                'group' => $row['Name'])
            );
        }
    }

    echo json_encode($users);

?>
