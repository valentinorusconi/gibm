<?php

    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $password = test_input($_POST['newPass'], 'string');
    $token = test_input($_POST['token'], 'string');
    $email = test_input($_POST['email'], 'email');

    if (strlen($password) < 8) {
        die('false');
    }

    if (!preg_match("#[0-9]+#", $password)) {
        die('false');
    }

    if (!preg_match('/[\'\/~`\!@#\$%\^&\*\(\)_\-\+=\{\}\[\]\|;:"\<\>,\.\?\\\]/', $password)) {
        die('false');
    }

    if (!preg_match("#[a-z]+#", $password) || !preg_match("#[A-Z]+#", $password)) {
        die('false');
    }

    $query = "SELECT ID FROM `users` WHERE Email = ?";
    $query2 = "SELECT Token, Creation FROM `resets` WHERE UserID = ? ORDER BY `Creation` DESC";
    $query3 = "UPDATE `users` SET `Password` = ? WHERE `users`.`ID` = ?";
    $query4 = "DELETE FROM `resets` WHERE `resets`.`UserID` = ?";

    $userID = execprepstmt($mysqli, $query, 's', $email);
    if($userID->num_rows == 1){

        $userID = ($userID->fetch_assoc())['ID'];

        $dbToken = execprepstmt($mysqli, $query2, 'i', $userID);
        if($dbToken->num_rows >= 1){

            $entry = $dbToken->fetch_row();
            $createdAt = strtotime($entry[1]);
            $dbToken = $entry[0];

            if(time()-$createdAt > 36000){ //10H
                execprepstmt($mysqli, $query4, 'i', $userID);
                die('false');
            }

            if(password_verify($token, $dbToken)){

                $pwHashed = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12,]);

                $done = execprepstmt($mysqli, $query3, 'si', $pwHashed, $userID);
                if($done){
                    die('false');
                } else {
                    execprepstmt($mysqli, $query4, 'i', $userID);
                }

                write_log($mysqli, 4,'Erfolgreich Passwort zurückgesetzt (UserID: '.$userID.')', $_SERVER);
                echo 'true';

            } else {
                write_log($mysqli, 1,'Fehlerhafter Versuch Passwort zurückzusetzen (Tokenbestätigung)(UserID: '.$userID.')', $_SERVER);
                die('false');
            }

        } else {
            write_log($mysqli, 1,'Fehlerhafter Versuch Passwort zurückzusetzen (Tokensuche)(UserID: '.$userID.')', $_SERVER);
            die('false');
        }

    } else {
        write_log($mysqli, 1,'Fehlerhafter Versuch Passwort zurückzusetzen (Benutzersuche)', $_SERVER);
        die('false');
    }



?>
