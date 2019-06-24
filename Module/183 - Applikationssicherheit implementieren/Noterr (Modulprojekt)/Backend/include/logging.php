<?php

function write_log($mysqli, $level, $action, $userinfo){

    if(isset($_SESSION['user']['info']['email'])){
        $user = $_SESSION['user']['info']['email'];
    } else {
        $user = "Nicht eingeloggt bzw. Info nicht vorhanden.";
    }

    $referer = addslashes($userinfo['HTTP_REFERER']);

    if (!empty($userinfo['HTTP_CLIENT_IP'])){
        $ip=$userinfo['HTTP_CLIENT_IP'];
    } else if(!empty($userinfo['HTTP_X_FORWARDED_FOR'])){
        $ip=$userinfo['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip=$userinfo['REMOTE_ADDR'];
    }

    $clientIP = $ip;
    $action = addslashes($action);

    $query = "INSERT INTO `logs` (`KeyData`, `LogLevel`, `Action`, `Referer`, `ClientIP`) VALUES (?, ?, ?, ?, ?)";
    execprepstmt($mysqli, $query, 'sisss', $user, $level, $action, $referer, $clientIP);

}

?>
