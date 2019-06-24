<?php

    include '../../include/database.php';
    include '../../include/testinput.php';
    include '../../include/logging.php';

    $email = test_input($_POST['email'], 'email');
    $pw = test_input($_POST['pw'], 'string');

    $query = 'SELECT Password FROM users WHERE Email = ?';
    $dbpw = execPrepStmt($mysqli, $query, 's', $email);

    if($dbpw->num_rows == 1){
        $dbpw = $dbpw->fetch_assoc();
    } else {
        write_log($mysqli, 3,'Fehlerhafter Loginversuch(1) von "'.$email.'".', $_SERVER);
        die('false');
    }

    if(password_verify($pw, $dbpw['Password'])){

        $query = 'SELECT ID, Email, GroupID FROM users WHERE Email = ? AND Password = ?';
        $userinfo = execPrepStmt($mysqli, $query, 'ss', $email, $dbpw['Password']);

        if($userinfo->num_rows == 1){
            $userinfo = $userinfo->fetch_assoc();
        } else {
            write_log($mysqli, 3,'Fehlerhafter Loginversuch(2) von "'.$email.'".', $_SERVER);
            die('false');
        }

        session_start();

        $_SESSION['user'] = array(
            'last_activity' => time(),
            'info' => array(
                'id' => $userinfo['ID'],
                'email' =>$userinfo['Email'],
                'group' =>$userinfo['GroupID'])
        );

        write_log($mysqli, 4,'Login: '.$email.' hat sich erfolgreich eingeloggt.', $_SERVER);

        echo json_encode(array('username' =>$userinfo['Email'],
        'usergroup' =>$userinfo['GroupID']));


    } else {
        write_log($mysqli, 3,'Fehlerhafter Loginversuch(3) von "'.$email.'".', $_SERVER);
        die('false');
    }

?>
