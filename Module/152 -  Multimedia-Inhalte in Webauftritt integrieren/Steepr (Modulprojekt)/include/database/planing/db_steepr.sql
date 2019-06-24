-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Sep 2018 um 12:55
-- Server-Version: 10.1.34-MariaDB
-- PHP-Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_steepr`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tb_image`
--

CREATE TABLE `tb_image` (
  `id` int(11) NOT NULL,
  `img_title` varchar(45) COLLATE utf8_german2_ci DEFAULT NULL,
  `img_description` varchar(45) COLLATE utf8_german2_ci DEFAULT NULL,
  `img_path_full` varchar(45) COLLATE utf8_german2_ci NOT NULL,
  `img_path_thumbnail` varchar(45) COLLATE utf8_german2_ci NOT NULL,
  `img_path_preview` varchar(45) COLLATE utf8_german2_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tb_rating`
--

CREATE TABLE `tb_rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `tb_image_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tb_tag`
--

CREATE TABLE `tb_tag` (
  `id` int(11) NOT NULL,
  `tag` varchar(45) COLLATE utf8_german2_ci DEFAULT NULL,
  `tb_image_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_image_id` (`tb_image_id`);

--
-- Indizes für die Tabelle `tb_tag`
--
ALTER TABLE `tb_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_image_id` (`tb_image_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tb_rating`
--
ALTER TABLE `tb_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tb_tag`
--
ALTER TABLE `tb_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD CONSTRAINT `tb_rating_ibfk_1` FOREIGN KEY (`tb_image_id`) REFERENCES `tb_image` (`id`);

--
-- Constraints der Tabelle `tb_tag`
--
ALTER TABLE `tb_tag`
  ADD CONSTRAINT `tb_tag_ibfk_1` FOREIGN KEY (`tb_image_id`) REFERENCES `tb_image` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
