<?php

    include '../include/session.php';
    include '../include/database.php';
    include '../include/testinput.php';
    include '../include/testoutput.php';

    $noteID = test_input($_POST['id'], 'integer');
    $query1 = "SELECT ID, Title, Creation, Deadline, Content FROM `notes` WHERE ID = ?";
    $query2 = "SELECT ID FROM `editors` WHERE UserID = ? AND NoteID = ?";
    $query3 = "SELECT tbus.Email FROM `editors` AS tbed
                INNER JOIN users AS tbus ON tbed.UserID = tbus.ID
                WHERE tbed.NoteID = ?";

    $hasAccess = execprepstmt($mysqli, $query2, 'ii', $_SESSION['user']['info']['id'], $noteID);

    if ($hasAccess->num_rows == 1) {

        $note = execprepstmt($mysqli, $query1, 'i', $noteID);
        if ($note->num_rows == 1) {
            $note = $note->fetch_assoc();

            $shareList = array();
            $shares = execprepstmt($mysqli, $query3, 'i', $noteID);
            while($row = $shares->fetch_assoc()){
                array_push($shareList, array('email' => escaped($row['Email'])));
            }

            $return = array(
                'id' => $note['ID'],
                'title' => $note['Title'],
                'content' => $note['Content'],
                'date' => $note['Creation'],
                'deadline' => $note['Deadline'],
                'shares' => $shareList
            );

            echo json_encode($return);

    	}

	}

?>
