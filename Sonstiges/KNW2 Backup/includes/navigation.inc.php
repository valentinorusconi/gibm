<nav>
	<ul class="sf-menu" id="nav">
	  <li<?php if(basename($_SERVER['SCRIPT_NAME']) == "index.php") print(' class="selected"'); ?>><a href="index.php">Home</a></li>
	  <li<?php if(basename($_SERVER['SCRIPT_NAME']) == "produkte.php") print(' class="selected"'); ?>><a href="produkte.php">Unsere Produkte</a>
	  	<ul>
	  		<li<?php if(basename($_SERVER['SCRIPT_NAME']) == "produkte_fleisch.php") print(' class="selected"'); ?>><a href="produkte_fleisch.php">Fleischliche Produkte</a>
	  			<ul>
	  				<li<?php if(basename($_SERVER['SCRIPT_NAME']) == "produkte_fleisch_rind.php") print(' class="selected"'); ?>><a href="produkte_fleisch_rind.php">Rind</a></li>
	  				<li<?php if(basename($_SERVER['SCRIPT_NAME']) == "produkte_fleisch_kaninchen.php") print(' class="selected"'); ?>><a href="produkte_fleisch_kaninchen.php">Kaninchen</a></li>
	  			</ul>
	  		</li>
	  		<li<?php if(basename($_SERVER['SCRIPT_NAME']) == "produkte_pfanzlich.php") print(' class="selected"'); ?>><a href="produkte_pfanzlich.php">Pflanzliche Produkte</a></li>
	  	</ul>
	  </li>
	  <li<?php if(basename($_SERVER['SCRIPT_NAME']) == "oeffnungszeiten.php") print(' class="selected"'); ?>><a href="oeffnungszeiten.php">Öffnungszeiten</a></li>
	  <li<?php if(basename($_SERVER['SCRIPT_NAME']) == "kontakt.php") print(' class="selected"'); ?>><a href="kontakt.php">Kontakt</a></li>
			  <li<?php if(basename($_SERVER['SCRIPT_NAME']) == "wetter.php") print(' class="selected"'); ?>><a href="wetter.php">Wetter</a>
	  	<ul>
	  		<li<?php if(basename($_SERVER['SCRIPT_NAME']) == "wetterort.php") print(' class="selected"'); ?>><a href="wetterort.php">Örtliches Wetter</a>
	</ul>
</nav>