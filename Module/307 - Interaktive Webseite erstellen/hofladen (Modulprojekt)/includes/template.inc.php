<!DOCTYPE HTML>
<?php

	session_start();
	
	$_SESSION['warenkorb'] = array(
																 array("id" => 2, "amount" => 30),
																 array("id" => 3, "amount" => 20),
																 array("id" => 4, "amount" => 10),	 
																 );
	
?>
<html>

<head>
  <title>Müller's Hofladen - <?php print($page_kurztitel); ?></title>
  <meta http-equiv="content-type" content="text/html; charset=utf8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.php">m&uuml;ller&apos;s<span class="logo_colour">_hofladen</span></a></h1>
          <h2>Natürliche Produkte, direkt ab Hof!</h2>
        </div>
      </div>
      <?php include("includes/navigation.inc.php"); ?>
    </header>
    <div id="site_content">
      <div class="gallery">
        <ul class="images">
          <li class="show"><img width="950" height="300" src="images/1.jpg" alt="photo_one" /></li>
          <li><img width="950" height="300" src="images/2.jpg" alt="seascape" /></li>
          <li><img width="950" height="300" src="images/3.jpg" alt="seascape" /></li>
        </ul>
      </div>
      <?php if($page_news){ ?>
	      <div id="sidebar_container">
	        <div class="sidebar">
	          <?php include("includes/news.inc.php"); ?>
	        </div>
	      </div>
      <?php } ?>
      <div class="content">
        <h1><?php print($page_titel); ?></h1>
        <?php 
			include("content/".$page_content);
        ?>
      </div>
    </div>
    <footer>
      <p>Müller's Hofladen | Bauernhofstrasse 10 | 1234 Bauernhausen | <a href="admin.php">Admin</a></p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>
