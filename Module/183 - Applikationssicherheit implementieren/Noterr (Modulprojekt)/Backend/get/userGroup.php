<?php

    include '../include/session.php';

    echo json_encode(array(
        'username' => $_SESSION['user']['info']['email'],
        'usergroup' => $_SESSION['user']['info']['group']
    ));

?>
