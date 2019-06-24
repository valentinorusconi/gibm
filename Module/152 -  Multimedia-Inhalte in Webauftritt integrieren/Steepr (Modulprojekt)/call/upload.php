<?php

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    //Get Post params and set defaults
    $f_title = test_input($_POST['f_title']);
    $f_tags = test_input($_POST['f_tags']);
    $f_description = test_input($_POST['f_description']);
    $error = "";

    if(empty($f_title)){
        $f_title = "Untitled Image";
    }

    if(empty($f_description)){
        $f_description = "- No Description";
    }

    //Get Post params and set defaults - DONE

    //Initialise DB Connection
    include("../include/database/connect.php");
    $stmt = $mysqli->prepare("INSERT INTO `tb_image` (`img_title`, `img_description`, `img_path_full`, `img_path_thumbnail`, `img_path_preview`, `views`) VALUES (?, ?, ?, ?, ?, 1)");
    if ( false===$stmt ) {
        header("Location: ../include/upload.html?error=2");
        die();
    }
    //Initialise DB Connection - DONE

    //Upload Files and convert diffrent Versions
    if($_FILES['f_upload']['type'] == 'image/png'){
        $source = imagecreatefrompng($_FILES['f_upload']['tmp_name']);
    } else if($_FILES['f_upload']['type'] == 'image/jpeg') {
        $source = imagecreatefromjpeg($_FILES['f_upload']['tmp_name']);
    } else {
        header("Location: ../include/upload.html?error=1&max_file=".ini_get("upload_max_filesize")."&max_post=".ini_get("post_max_size"));
        die();
    }

    list($width, $height) = getimagesize($_FILES['f_upload']['tmp_name']);

    $thumbnailWidth = 300;
    $thumbnailHeight = $height*($thumbnailWidth/$width);
    $thumbnailQuality = 40;

    $previewWidth = 800;
    $previewHeight = $height*($previewWidth/$width);
    $previewQuality = 80;

    $thumbnail = imagecreatetruecolor($thumbnailWidth, $thumbnailHeight);
    $preview = imagecreatetruecolor($previewWidth, $previewHeight);

    imagecopyresampled($thumbnail, $source, 0, 0, 0, 0, $thumbnailWidth, $thumbnailHeight, $width, $height);
    imagecopyresampled($preview, $source, 0, 0, 0, 0, $previewWidth, $previewHeight, $width, $height);

    $uploaddir = '../include/img/useruploads/';
    $thumbnailName = "steepr-".time()."-".rand(10000,99999)."-thubnail.jpg";
    $previewName = "steepr-".time()."-".rand(10000,99999)."-preview.jpg";
    $fullName = "steepr-".time()."-".rand(10000,99999)."-full.jpg";

    imagejpeg($thumbnail, $uploaddir ."/".$thumbnailName, $thumbnailQuality);
    imagejpeg($preview, $uploaddir ."/".$previewName, $previewQuality);
    move_uploaded_file($_FILES["f_upload"]["tmp_name"], $uploaddir."/".$fullName);
    //Upload Files and convert diffrent Versions - DONE

    //Safe paths and infos to DB
    $rc = $stmt->bind_param('sssss', $f_title, $f_description, $fullName, $thumbnailName, $previewName);
    if ( false===$rc ) {
        header("Location: ../include/upload.html?error=3");
        die();
    }

    $rc = $stmt->execute();
    if ( false===$rc ) {
        header("Location: ../include/upload.html?error=4");
        die();
    }
    $stmt->close();
    //Safe paths and infos to DB - DONE

    //Safe Tags to DB
    $stmt = $mysqli->prepare("INSERT INTO `tb_tag` (`tag`, `tb_image_id`) VALUES (?, ?)");
    if ( false===$stmt ) {
        header("Location: ../include/upload.html?error=5");
        error_log('prepare() failed: ' . htmlspecialchars($mysqli->error));
        die();
    }

    //Get last Insert (ID of image)
    $imgInsertIDresult = mysqli_query($mysqli, "SELECT id FROM `tb_image` ORDER BY `tb_image`.`id` DESC LIMIT 1");
    $imgInsertID = (mysqli_fetch_assoc($imgInsertIDresult))['id'];
    $tag_array = explode(',',$f_tags);

    for($i = 0; $i<count($tag_array); $i++){
        if($i < 20){
            print_r($tag_array[$i]);
            $rc = $stmt->bind_param('si', $tag_array[$i], $imgInsertID);
            if ( false===$rc ) {
                header("Location: ../include/upload.html?error=6");
                die();
            }

            $rc = $stmt->execute();
            if ( false===$rc ) {
                header("Location: ../include/upload.html?error=7");
                die();
            }
        }
    }
    $stmt->close();
    //Safe Tags to DB - DONE

    header("Location: ../index.html?success=1");

?>
