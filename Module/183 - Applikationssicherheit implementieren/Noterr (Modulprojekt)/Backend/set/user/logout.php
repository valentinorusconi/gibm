<?php

    include '../../include/logging.php';
    include '../../include/database.php';

    session_start();

    if(isset($_SESSION['user']['info'])){
        write_log($mysqli, 4,'Logout erfolgreich', $_SERVER);
    }

    $_SESSION['user'] = 'undefined';
    session_destroy();

    echo 'true';

?>
