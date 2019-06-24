<?php

    include('../database.php');

    $users = array(
        array('email' => 'mail@eliareutlinger.ch', 'passwort' => 'testpassword', 'groupID' => 2),
        array('email' => 'testing@localhost.com', 'passwort' => 'testpass', 'groupID' => 1),
        array('email' => 'random1@user.com', 'passwort' => 'testpass2', 'groupID' => 1),
        array('email' => 'random2@user.com', 'passwort' => 'testpass3', 'groupID' => 1),
        array('email' => 'random3@user.com', 'passwort' => 'testpass4', 'groupID' => 1),
    );

    $options = [
        'cost' => 12,
    ];

    $query = ("INSERT INTO `users` (`Email`, `Password`, `GroupID`) VALUES (?, ?, ?);");
    for($i = 0; $i<count($users);$i++){
        $tmpPW = password_hash($users[$i]['passwort'], PASSWORD_BCRYPT, $options);
        execPrepStmt($mysqli, $query, 'ssi', $users[$i]['email'], $tmpPW, $users[$i]['groupID']);
    }

    echo '<p>Testusers have been created.</p>';

?>
