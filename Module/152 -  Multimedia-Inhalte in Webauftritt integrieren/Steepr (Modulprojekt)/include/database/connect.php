<?php

    if(getenv('APP_DB_USER')){
        $db_database = getenv('APP_DB_NAME');
        $db_host = getenv('APP_DB_HOST');
        $db_username = getenv('APP_DB_USER');
        $db_passwort = getenv('APP_DB_PASS');
    } else {
        include('properties.php');
    }

    $mysqli = mysqli_connect($db_host, $db_username, $db_passwort, $db_database);

    if (!$mysqli) {

        echo "ERROR#004";

        include('setupDB.php');

	}

?>
