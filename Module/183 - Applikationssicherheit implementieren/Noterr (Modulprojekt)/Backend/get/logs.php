<?php

    include '../include/session.php';
    include '../include/database.php';
    include '../include/testoutput.php';
    include '../include/logging.php';

    if($_SESSION['user']['info']['group'] !== 2){
        write_log($mysqli, 1,'Fehlerhafter Versuch auf Logs (Adminfunktion) zuzugreifen.', $_SERVER);
        die('false');
    }

    include '../include/checkAdmin.php';

    write_log($mysqli, 4,'Auf Logs (Adminfunktion) zugegriffen.', $_SERVER);

    $logs = array();

    $query = "SELECT * FROM `logs` ORDER BY Creation DESC";
    $result = $mysqli->query($query);
    if (isset($result) && $result->num_rows >= 1) {
        while($row = $result->fetch_assoc()){
            array_push($logs, array(
                'id' => $row['ID'],
                'email' => escaped($row['KeyData']),
                'level' => $row['LogLevel'],
                'date' => $row['Creation'],
                'action' => escaped($row['Action']),
                'ip' => escaped($row['ClientIP']),
                'referer' => escaped($row['Referer'])
            ));
        }
    }

    echo json_encode($logs);

?>
