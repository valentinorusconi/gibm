<?php

    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    function sendResetMail($mysqli, $to, $token){
        $subject = "Passwort zurücksetzen";
        $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
        $token = $actual_link. '/Frontend/#/resetPassword?tok=' . $token;

        $message = "
            <html>
            <head>
            <title>Passwort zurücksetzen</title>
            </head>
            <body>
            <p>Um dein Passwort zu ändern, klicke auf folgenden Link: </p>
            <p>".$token."</p>
            <p>Falls du diese Anfrage nicht ausgelöst hast, melde dies einem Admin.</p>
            </body>
            </html>
        ";

        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";


        $headers .= 'From: <webmaster@noterr.com>' . "\r\n";
        mail($to,$subject,$message,$headers);
        write_log($mysqli, 4,'Passwort-Vergessen-Mail versendet (An: '.$to.')', $_SERVER);

    }

    $email = test_input($_POST['email'],'email');
    $query = "SELECT ID FROM `users` WHERE Email = ?";
    $query2 = "INSERT INTO `resets` (`Token`, `UserID`) VALUES (?, ?)";
    $userID = execprepstmt($mysqli, $query, 's', $email);

    if($userID->num_rows == 1){

        $userID = ($userID->fetch_assoc())['ID'];

        $tokenLenght = 32;
        $randomString = bin2hex(random_bytes($tokenLenght));

        $token = $randomString;
        print($token);

        $options = [
            'cost' => 12,
        ];

        $tokenHashed = password_hash($token, PASSWORD_BCRYPT, $options);
        execprepstmt($mysqli, $query2, 'si', $tokenHashed, $userID);
        write_log($mysqli, 4,'Passwort-Vergessen-Funktion erfolgreich genutzt (Mail: '.$email.')', $_SERVER);
        sendResetMail($mysqli, $email, $token);


    } else {
        write_log($mysqli, 1,'Fehlerhafter Versuch Passwort-Reset-Request (Mail: '.$email.')', $_SERVER);
    }


    echo 'true';

?>
