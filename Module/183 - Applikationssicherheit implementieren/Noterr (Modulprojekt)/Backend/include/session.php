<?php

    session_start();

    if (!isset($_SESSION['user']['last_activity']) || (time() - $_SESSION['user']['last_activity'] >= 900)) {

        session_destroy();
        die('false');

    } else {

        if($_SESSION['user']['info']['group'] == 1 || $_SESSION['user']['info']['group'] == 2){

            $_SESSION['user']['last_activity'] = time();
            session_regenerate_id();

        } else {
            die('false');
        }
    }

?>
