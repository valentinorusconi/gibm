<?php

    function escaped($value){
        $value = filter_var($value, FILTER_SANITIZE_STRING);
        $value = htmlspecialchars($value, ENT_COMPAT, 'UTF-8');
        return $value;
    }

?>
