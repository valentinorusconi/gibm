<?php

    if(mysqli_connect_errno() == 1049){

        $mysqli = mysqli_connect($db_host, $db_username, $db_passwort);

        echo "<br /><br />Keyword:<br />!dbinit!<br/><br/>";
        echo "Database " . $db_database . " not found. Starting creation from scratch Template.";

        $sql = "CREATE DATABASE $db_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;";

        if ($mysqli->query($sql) === TRUE) {

            echo "<p>Database creation successful. Starting Table creation from .sql File...</p>";

            $mysqli = mysqli_connect($db_host, $db_username, $db_passwort, $db_database);
            if (!$mysqli) {
                echo "<p>Couldn't connect to DB.</p>";
            }

            $sql = '';
            $sqlScript = file('../include/database/db_steepr.sql');
            print_r(scandir('../include/database/'));
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

            echo "<p>Table creation successful. Listing new Databases:</p>";

            $entries = array();
            $sql = 'show databases';
            $result = $mysqli->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    array_push($entries,$row['Database']);
                    if($row['Database'] == $db_database){
                        $evaIsHere = true;
                    }
                }
            } else {
                $entries = "No Entries";
            }

            echo "<ul>";
            foreach ($entries as $value) {
                echo "<li>$value</li>";
            }
            echo "</ul>";

            echo "<p>Listing new Tables:</p>";

            $entries = array();
            $sql = 'show tables;';
            $result = $mysqli->query($sql);

            if ($result->num_rows > 0) {

                echo "<h4>Available Tables:</h4>";

                while($row = $result->fetch_assoc()) {
                    array_push($entries,$row['Tables_in_'.$db_database]);
                }

            } else {
                $entries = "No Entries";
            }

            echo "<ul>";
            foreach ($entries as $value) {
                echo "<li>$value</li>";
            }
            echo "</ul>";



        } else {
            echo "Error creating database: " . $mysqli->error;
        }

    } else {
        die('Connect Error (' . mysqli_connect_errno() . ') '. mysqli_connect_error());
    }

?>
