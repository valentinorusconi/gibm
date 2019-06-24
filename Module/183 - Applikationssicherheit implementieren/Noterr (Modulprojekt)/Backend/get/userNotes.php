<?php

    include '../include/session.php';
    include '../include/database.php';
    include '../include/testoutput.php';

    $query = "SELECT tbno.ID, tbno.Title FROM `editors` AS tbed
                INNER JOIN notes AS tbno ON tbed.NoteID = tbno.ID
                WHERE tbed.UserID = ?";

    $userNotes = execprepstmt($mysqli, $query, 'i', $_SESSION['user']['info']['id']);
    $notes = array();

    if ($userNotes->num_rows >= 1) {
		while($row = $userNotes->fetch_assoc()){
            array_push($notes, array('id' => escaped($row['ID']), 'title' => $row['Title']));
        }
	}

    echo json_encode($notes);

?>
