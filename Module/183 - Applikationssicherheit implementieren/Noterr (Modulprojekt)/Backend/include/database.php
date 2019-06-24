<?php

    $createTestUsers = true;

    if(getenv('APP_DB_USER')){
        $_db_database = getenv('APP_DB_NAME');
        $_db_host = getenv('APP_DB_HOST');
        $_db_username = getenv('APP_DB_USER');
        $_db_passwort = getenv('APP_DB_PASS');
    } else {
        $_db_database = "Noterr";
        $_db_host = "localhost";
        $_db_username = "root";
        $_db_passwort = "";
    }

    $mysqli = mysqli_connect($_db_host, $_db_username, $_db_passwort, $_db_database);
    if(!function_exists('execPrepStmt')){

        function execPrepStmt($mysqli, $query, $formatString, ...$params){
            $stmt = $mysqli->prepare($query);
            if ( false===$stmt ) {
                http_response_code(500);
                echo('false'); //Prepare Failed
            }
            $rc = $stmt->bind_param($formatString, ...$params);
            if ( false===$rc ) {
                http_response_code(500);
                echo('false'); //Bind Failed
            }
            $rc = $stmt->execute();
            if ( false===$rc ) {
                http_response_code(500);
                echo('false'); //Execute Failed
            }
            return $stmt->get_result();
        }

    }

    if (!$mysqli) {

        echo "ERROR#004"; //Connect Failed

        //DB Not found
        if(mysqli_connect_errno() == 1049){

            $mysqli = mysqli_connect($_db_host, $_db_username, $_db_passwort);
            echo "Database " . $_db_database . " not found. Starting creation from scratch Template.";
            $sql = "CREATE DATABASE IF NOT EXISTS ".$_db_database." DEFAULT CHARACTER SET utf8 COLLATE utf8_german2_ci;";

            if ($mysqli->query($sql) === TRUE) {
                echo "<p>Database creation successful. Starting Table creation from .sql File...</p>";
            } else {
                echo "Error creating database: " . $mysqli->error;
            }

        }

        $mysqli = mysqli_connect($_db_host, $_db_username, $_db_passwort, $_db_database);

        if (!$mysqli) {
            echo "<p>Couldn't connect to DB.</p>";
        }

        $sql = '';

        $sqlScript = file('../../include/dbinit/init.sql');
        foreach ($sqlScript as $line)	{
            $startWith = substr(trim($line), 0 ,2);
            $endWith = substr(trim($line), -1 ,1);
            if (empty($line) || $startWith == '--' || $startWith == '/*' || $startWith == '//') {
                continue;
            }
            $sql = $sql . $line;
            if ($endWith == ';') {
                mysqli_query($mysqli,$sql) or die('<p>Problem in executing the SQL query:<br/><br/> <b>' . $sql. '</b></p>');
                $sql= '';
            }
        }

        echo '<p>SQL file imported successfully...</p>';

        if($createTestUsers){
            include('../../include/dbinit/users.php');
        }


    }

?>
