-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Apr 2019 um 13:43
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `trading_ag`
--
CREATE DATABASE IF NOT EXISTS `trading_ag` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `trading_ag`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilung`
--

CREATE TABLE `abteilung` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Abteilungsleiter_ID` int(11) NOT NULL,
  `Uebergeordnete_Abteilung_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `abteilung`
--

INSERT INTO `abteilung` (`ID`, `Name`, `Abteilungsleiter_ID`, `Uebergeordnete_Abteilung_ID`) VALUES
(1, 'Abzocken', 8, NULL),
(2, 'Reiche Kunden', 9, 1),
(3, 'Arme Kunden', 9, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arbeitsplatz`
--

CREATE TABLE `arbeitsplatz` (
  `ID` int(11) NOT NULL,
  `Raum_ID` int(11) NOT NULL,
  `Mitarbeiter_ID` int(11) DEFAULT NULL,
  `PC_Komponente_ID` int(11) NOT NULL,
  `Tastatur_Komponente_ID` int(11) NOT NULL,
  `Maus_Komponente_ID` int(11) NOT NULL,
  `Monitor_Komponente_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `arbeitsplatz`
--

INSERT INTO `arbeitsplatz` (`ID`, `Raum_ID`, `Mitarbeiter_ID`, `PC_Komponente_ID`, `Tastatur_Komponente_ID`, `Maus_Komponente_ID`, `Monitor_Komponente_ID`) VALUES
(1, 1, 10, 6, 9, 12, 15),
(2, 1, 8, 7, 10, 13, 16),
(3, 3, 11, 8, 11, 14, 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Beschreibung` mediumtext NOT NULL,
  `Einkaufspreis` float NOT NULL,
  `Verkaufspreis` float NOT NULL,
  `Lagerbestand` int(11) DEFAULT NULL,
  `Hersteller_ID` int(11) NOT NULL,
  `Lieferant_ID` int(11) NOT NULL,
  `Kategorie_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`ID`, `Name`, `Beschreibung`, `Einkaufspreis`, `Verkaufspreis`, `Lagerbestand`, `Hersteller_ID`, `Lieferant_ID`, `Kategorie_ID`) VALUES
(1, 'SuperHaltung', 'Super gute Buchhaltung hier', 5000, 7600, 33, 1, 2, 3),
(2, 'Fidget Spinner', 'You spin me right round right round', 50.5, 90.95, 963, 1, 2, 5),
(3, 'Origami', 'Origami Lehrbuch aus 3 Seiten', 15.45, 29.95, 12, 1, 2, 7),
(4, 'Type P', 'Jemand gibt bei dir in der Adresszeile vom Browser eine URL mit Anfangsbuchstabe P ein.', 69.95, 96.5, 57, 1, 2, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel_hat_zubehoer`
--

CREATE TABLE `artikel_hat_zubehoer` (
  `Artikel_ID` int(11) NOT NULL,
  `Zubehoer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `artikel_hat_zubehoer`
--

INSERT INTO `artikel_hat_zubehoer` (`Artikel_ID`, `Zubehoer_ID`) VALUES
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beanstandung`
--

CREATE TABLE `beanstandung` (
  `ID` int(11) NOT NULL,
  `Beschreibung` mediumtext NOT NULL,
  `Bestellung_ID` int(11) NOT NULL,
  `Bestellung_Artikel_ID` int(11) NOT NULL,
  `Konversation_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `beanstandung`
--

INSERT INTO `beanstandung` (`ID`, `Beschreibung`, `Bestellung_ID`, `Bestellung_Artikel_ID`, `Konversation_ID`) VALUES
(1, 'Dasch mega blöd odr', 2, 3, 1),
(2, 'Wasch da los eyyy', 1, 1, 2),
(3, 'Wurde deswegen gekündigt. Braucht das jetzt nicht mehr.', 3, 4, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beratungsvertrag`
--

CREATE TABLE `beratungsvertrag` (
  `ID` int(11) NOT NULL,
  `Startdatum` date NOT NULL,
  `Enddatum` date NOT NULL,
  `Beschreibung` mediumtext NOT NULL,
  `Vertragsnummer` int(11) NOT NULL,
  `Kunde_ID` int(11) NOT NULL,
  `Folgeauftrag_von_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `beratungsvertrag`
--

INSERT INTO `beratungsvertrag` (`ID`, `Startdatum`, `Enddatum`, `Beschreibung`, `Vertragsnummer`, `Kunde_ID`, `Folgeauftrag_von_ID`) VALUES
(1, '2019-02-01', '2019-02-28', 'Die wollten Hilfe Hilfe', 13, 6, NULL),
(2, '2019-02-01', '2019-02-28', 'Die wolten diese ebenso', 14, 7, NULL),
(3, '2019-03-01', '2019-03-31', 'Die haben diese verlängert odr', 15, 6, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `ID` int(11) NOT NULL,
  `Bestellnummer` int(11) NOT NULL,
  `Bestelldatum` date NOT NULL,
  `Lieferdatum` date DEFAULT NULL,
  `Bearbeiter_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`ID`, `Bestellnummer`, `Bestelldatum`, `Lieferdatum`, `Bearbeiter_ID`) VALUES
(1, 5, '2019-03-10', '2019-03-23', 13),
(2, 6, '2019-03-13', '2019-03-25', 11),
(3, 7, '2019-03-21', NULL, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung_hat_artikel`
--

CREATE TABLE `bestellung_hat_artikel` (
  `Artikel_ID` int(11) NOT NULL,
  `Bestellung_ID` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bestellung_hat_artikel`
--

INSERT INTO `bestellung_hat_artikel` (`Artikel_ID`, `Bestellung_ID`, `Anzahl`) VALUES
(1, 1, 10),
(3, 2, 1),
(3, 3, 5),
(4, 3, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dienstfahrzeug`
--

CREATE TABLE `dienstfahrzeug` (
  `ID` int(11) NOT NULL,
  `Modell` varchar(255) NOT NULL,
  `Kennzeichen` varchar(20) NOT NULL,
  `Hersteller` mediumtext NOT NULL,
  `Versicherungsnummer` int(11) NOT NULL,
  `Leasingnummer` int(11) NOT NULL,
  `Versicherung_ID` int(11) NOT NULL,
  `Leasingfirma_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `dienstfahrzeug`
--

INSERT INTO `dienstfahrzeug` (`ID`, `Modell`, `Kennzeichen`, `Hersteller`, `Versicherungsnummer`, `Leasingnummer`, `Versicherung_ID`, `Leasingfirma_ID`) VALUES
(1, 'Tesla S3', 'AG123456', 'Tesla Motos\r\n(Elon Muskatnus)', 11225588, 68224682, 4, 3),
(2, 'Ford Focus', 'BL123456', 'Ford Automobile', 22332233, 1122820, 4, 3),
(3, 'Punto', 'BS123456', 'Fiat', 4545851, 68224682, 4, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma`
--

CREATE TABLE `firma` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Ansprechsperson` mediumtext NOT NULL,
  `Webseite` varchar(255) DEFAULT NULL,
  `Typ` enum('Hersteller','Lieferant','Kunde','Leasing','Versicherung','Werkstatt') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `firma`
--

INSERT INTO `firma` (`ID`, `Name`, `Ansprechsperson`, `Webseite`, `Typ`) VALUES
(1, 'Ich mache herstellen diese', 'Peter Lamborgini', 'support.guterhersteller.to', 'Hersteller'),
(2, 'Ich bringe diese', 'Peter Ferrari', NULL, 'Lieferant'),
(3, 'Mach dir Schulden mit Leasing', 'Zamanta Chantal', 'holdirleasing.com', 'Leasing'),
(4, 'Zu teure Haftpflicht ohne Grund', 'Chris P. Bacon', 'gibmirdeingeld.com', 'Versicherung'),
(5, 'Ich flikke diese', 'Axel Schweisser', 'motopotogo.to', 'Werkstatt'),
(6, 'Ich brauche dein Beratung', 'Standart Typpi', NULL, 'Kunde'),
(7, 'Ich habe zu viel Geld', 'Mary Juana', 'googlefacebookamazon.com', 'Kunde');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gehalt`
--

CREATE TABLE `gehalt` (
  `Mitarbeiter_ID` int(11) NOT NULL,
  `Betrag` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `gehalt`
--

INSERT INTO `gehalt` (`Mitarbeiter_ID`, `Betrag`) VALUES
(8, 10315.5),
(9, 9560),
(10, 5600),
(11, 5500),
(12, 5230),
(13, 6900);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `generalabo`
--

CREATE TABLE `generalabo` (
  `Ressource_ID` int(11) NOT NULL,
  `Klasse` enum('1. Klasse','2. Klasse') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `generalabo`
--

INSERT INTO `generalabo` (`Ressource_ID`, `Klasse`) VALUES
(1, '1. Klasse'),
(2, '1. Klasse'),
(3, '2. Klasse'),
(4, '2. Klasse');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jahreskarte`
--

CREATE TABLE `jahreskarte` (
  `Ressource_ID` int(11) NOT NULL,
  `Rang` int(11) NOT NULL,
  `Sektor` varchar(10) NOT NULL,
  `Reihe` int(11) NOT NULL,
  `Sitzplatznummer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `jahreskarte`
--

INSERT INTO `jahreskarte` (`Ressource_ID`, `Rang`, `Sektor`, `Reihe`, `Sitzplatznummer`) VALUES
(5, 4, '4b', 18, 33),
(6, 3, '4a', 12, 15),
(7, 4, '2c', 8, 38),
(8, 2, '1m', 5, 22);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Betreuer_ID` int(11) NOT NULL,
  `Oberkategorie_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`ID`, `Name`, `Betreuer_ID`, `Oberkategorie_ID`) VALUES
(1, 'Software', 8, NULL),
(2, 'Hardware', 9, NULL),
(3, 'Buchhaltungsprogramme', 10, 1),
(4, 'PDF Programme', 10, 1),
(5, 'Entspannung', 11, 2),
(6, 'Anspannung', 12, 2),
(7, 'Verspannung', 13, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `komponente_inventar`
--

CREATE TABLE `komponente_inventar` (
  `ID` int(11) NOT NULL,
  `Interne_Bezeichnung` varchar(20) NOT NULL,
  `Komponente_Katalog_ID` int(11) NOT NULL,
  `Seriennummer` int(11) NOT NULL,
  `Kaufdatum` date NOT NULL,
  `Typ` enum('Netzwerk','Drucker','PC','Tastatur','Maus','Monitor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `komponente_inventar`
--

INSERT INTO `komponente_inventar` (`ID`, `Interne_Bezeichnung`, `Komponente_Katalog_ID`, `Seriennummer`, `Kaufdatum`, `Typ`) VALUES
(1, 'DRUCKER_01', 1, 11111111, '2019-03-25', 'Drucker'),
(2, 'DRUCKER_02', 1, 11111112, '2019-03-25', 'Drucker'),
(3, 'DRUCKER_03', 1, 11111113, '2019-03-25', 'Drucker'),
(4, 'ROUTER_01', 2, 21111111, '2019-03-25', 'Netzwerk'),
(5, 'SWITCH_01', 3, 21111112, '2019-03-25', 'Netzwerk'),
(6, 'PC_01', 4, 31111111, '2019-03-25', 'PC'),
(7, 'PC_02', 4, 31111112, '2019-03-25', 'PC'),
(8, 'PC_03', 4, 31111113, '2019-03-25', 'PC'),
(9, 'TASTA_01', 5, 41111111, '2019-03-25', 'Tastatur'),
(10, 'TASTA_02', 5, 41111112, '2019-03-25', 'Tastatur'),
(11, 'TASTA_03', 5, 41111113, '2019-03-25', 'Tastatur'),
(12, 'MAUS_01', 6, 51111111, '2019-03-25', 'Maus'),
(13, 'MAUS_02', 6, 51111112, '2019-03-25', 'Maus'),
(14, 'MAUS_03', 6, 51111113, '2019-03-25', 'Maus'),
(15, 'MONITOR_01', 6, 61111111, '2019-03-25', 'Monitor'),
(16, 'MONITOR_02', 7, 61111112, '2019-03-25', 'Monitor'),
(17, 'MONITOR_03', 7, 61111113, '2019-03-25', 'Monitor'),
(18, 'ROUTER_02', 2, 21111113, '2019-03-26', 'Netzwerk');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `komponente_katalog`
--

CREATE TABLE `komponente_katalog` (
  `ID` int(11) NOT NULL,
  `Modellname` varchar(255) NOT NULL,
  `Details` mediumtext NOT NULL,
  `Hersteller_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `komponente_katalog`
--

INSERT INTO `komponente_katalog` (`ID`, `Modellname`, `Details`, `Hersteller_ID`) VALUES
(1, '0815 Office Printer', 'Der isch richtig langsam und laut', 1),
(2, 'RouterDerZweite', 'Nehme diese Signal und gebe dann weiter', 1),
(3, 'SwitchMyMan', 'Mit Kabelsalat2000 Update vorinstalliert', 1),
(4, 'Einfachster Arbeits-PC', 'Intel Core LoMiInRhue\r\n16 GB Google-Chrome Belastig', 1),
(5, 'Klapapapa Tastatur', 'Tastatur mit extra Platz unter Tasten zur Dreckansammlung', 1),
(6, 'Klicketiklick Maus', 'Wireless. \r\n Akku haltet 20 Minuten und muss dann mit 10cm Kabel geladen werden.', 1),
(7, 'MyMonitor1000+', 'Der kann was was du nicht kannst.', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `komponente_netzwerk`
--

CREATE TABLE `komponente_netzwerk` (
  `ID` int(11) NOT NULL,
  `Typ` enum('Router','Switch') NOT NULL,
  `Raum_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `komponente_netzwerk`
--

INSERT INTO `komponente_netzwerk` (`ID`, `Typ`, `Raum_ID`) VALUES
(4, 'Router', 1),
(5, 'Switch', 4),
(18, 'Router', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontaktdaten`
--

CREATE TABLE `kontaktdaten` (
  `ID` int(11) NOT NULL,
  `Email` varchar(89) NOT NULL,
  `Telefonnummer` varchar(50) NOT NULL,
  `Strasse` varchar(60) NOT NULL,
  `Nummer` varchar(12) NOT NULL,
  `Ortschaft_ID` int(11) NOT NULL,
  `Typ` enum('Mitarbeiter','Firma') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `kontaktdaten`
--

INSERT INTO `kontaktdaten` (`ID`, `Email`, `Telefonnummer`, `Strasse`, `Nummer`, `Ortschaft_ID`, `Typ`) VALUES
(1, 'support@guterhersteller.com', '+41 82 232 94 84', 'Straussenstrasse', '34a', 1, 'Firma'),
(2, 'support@guterlieferant.com', '+41 87 839 03 72', 'Laberstrasse', '152', 2, 'Firma'),
(3, 'support@leasingfirma.com', '+41 32 912 99 11', 'Birgmattweg', '78c', 3, 'Firma'),
(4, 'mail@versicherungsabzocke.com', '+41 12 123 12 34', 'Straussenstrasse', '55b', 4, 'Firma'),
(5, 'contact@beschtewerkstatt.com', '+41 33 555 66 77', 'Schwafelstrasse', '377', 5, 'Firma'),
(6, 'support@guterkunde.com', '+41 11 777 33 23', 'Falschestrasse', '404', 6, 'Firma'),
(7, 'irgendwie@schlechterkunde.com', '+41 22 143 87 22', 'Richtigestrasse', '200', 1, 'Firma'),
(8, 'chef.decheffe@gmail.com', '+41 61 112 11 22', 'Tupac Lane', '11', 1, 'Mitarbeiter'),
(9, 'chef.desonespaar@gmail.com', '+41 61 113 11 23', 'Zur Holle', '22', 2, 'Mitarbeiter'),
(10, 'niet.decheffe@gmail.com', '+41 61 114 11 33', 'Gurkensteig', '33', 3, 'Mitarbeiter'),
(11, 'uli.muli@guli.com', '+41 61 115 11 44', 'Hodenhagen', '44', 4, 'Mitarbeiter'),
(12, 'andreas.merte@bundeskanzler.com', '+41 61 116 11 55', 'Deeper Pfad', '55', 5, 'Mitarbeiter'),
(13, 'diese.strasse@gibts.wirklich', '+41 61 117 11 62', 'Tittentasterstrasse', '66', 6, 'Mitarbeiter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `konversation`
--

CREATE TABLE `konversation` (
  `ID` int(11) NOT NULL,
  `Typ` enum('Ticket','Beanstandung') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `konversation`
--

INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(1, 'Beanstandung'),
(2, 'Beanstandung'),
(3, 'Beanstandung'),
(4, 'Ticket'),
(5, 'Ticket'),
(6, 'Ticket');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `ID` int(11) NOT NULL,
  `Vorname` varchar(255) NOT NULL,
  `Nachname` varchar(255) NOT NULL,
  `Benutzername` varchar(255) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `Arbeitsvertrag` varchar(12) NOT NULL,
  `Vorgesetzter_ID` int(11) DEFAULT NULL,
  `Abteilung_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`ID`, `Vorname`, `Nachname`, `Benutzername`, `Passwort`, `Arbeitsvertrag`, `Vorgesetzter_ID`, `Abteilung_ID`) VALUES
(8, 'Chef', 'DeCheffe', 'chef.decheffe', 'InsertRandomMD5EncryptedPasswordHere1', '11aa22bb33cc', NULL, 3),
(9, 'Chef', 'Desonespaar', 'chef.desonespaar', 'InsertRandomMD5EncryptedPasswordHere2', '22aa22bb33cc', 8, 2),
(10, 'Niet', 'DeCheffe', 'niet.decheffe', 'InsertRandomMD5EncryptedPasswordHere3', '33aa22bb33cc', 8, 3),
(11, 'Uli', 'Muli', 'uli.muli', 'InsertRandomMD5EncryptedPasswordHere4', '44aa22bb33cc', 9, 2),
(12, 'Andreas', 'Merte', 'andreas.merte', 'InsertRandomMD5EncryptedPasswordHere5', '55aa22bb33cc', 9, 3),
(13, 'Kiine', 'Ehnung', 'kiine.ehnung', 'InsertRandomMD5EncryptedPasswordHere6', '66aa22bb33cc', 9, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nachricht`
--

CREATE TABLE `nachricht` (
  `ID` int(11) NOT NULL,
  `Erfasser_ID` int(11) NOT NULL,
  `Konversation_ID` int(11) NOT NULL,
  `Zeitpunkt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Inhalt` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `nachricht`
--

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`, `Zeitpunkt`, `Inhalt`) VALUES
(1, 12, 1, '2019-04-01 11:41:45', 'Das teil läuft nicht. Bitte Hersteller sage mir wieso.'),
(2, 1, 1, '2019-04-01 11:41:45', 'Das isch no nie richtig gange. Nit mis problem.'),
(3, 9, 4, '2019-04-01 11:41:45', 'Der Drucker isch hinüber lan.'),
(4, 11, 4, '2019-04-01 11:41:45', 'Kanns net ersetzen kein Geld umen.'),
(5, 10, 5, '2019-04-01 11:41:45', 'Pls mach repariere diese.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ortschaft`
--

CREATE TABLE `ortschaft` (
  `ID` int(11) NOT NULL,
  `Ort` varchar(75) NOT NULL,
  `Postleitzahl` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ortschaft`
--

INSERT INTO `ortschaft` (`ID`, `Ort`, `Postleitzahl`) VALUES
(1, 'Basel', '4058'),
(2, 'Basel', '4001'),
(3, 'Basel', '4055'),
(4, 'Therwil', '6850'),
(5, 'Therwil', '6855'),
(6, 'Therwil', '6800');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `problem`
--

CREATE TABLE `problem` (
  `ID` int(11) NOT NULL,
  `Status` enum('Offen','In Bearbearbeitung','Geschlossen') NOT NULL,
  `Beschreibung` mediumtext NOT NULL,
  `Erfasser_ID` int(11) NOT NULL,
  `Dienstfahrzeug_ID` int(11) NOT NULL,
  `Bearbeitet_in_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `problem`
--

INSERT INTO `problem` (`ID`, `Status`, `Beschreibung`, `Erfasser_ID`, `Dienstfahrzeug_ID`, `Bearbeitet_in_ID`) VALUES
(1, 'In Bearbearbeitung', 'Kofferraum schon wieder voll Sirup', 11, 3, 1),
(2, 'Geschlossen', 'Kofferraum voll Sirup', 11, 3, 2),
(3, 'Geschlossen', 'Blinker geht nicht', 9, 3, 2),
(4, 'Geschlossen', 'Sieht nichts durch Fenster', 13, 3, 3),
(5, 'Geschlossen', 'Ist verbrannt', 12, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `raum`
--

CREATE TABLE `raum` (
  `ID` int(11) NOT NULL,
  `Drucker_Inventar_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `raum`
--

INSERT INTO `raum` (`ID`, `Drucker_Inventar_ID`) VALUES
(4, NULL),
(3, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reparatur`
--

CREATE TABLE `reparatur` (
  `ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Werkstatt_ID` int(11) NOT NULL,
  `Dienstfahrzeug_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reparatur`
--

INSERT INTO `reparatur` (`ID`, `Datum`, `Werkstatt_ID`, `Dienstfahrzeug_ID`) VALUES
(1, '2019-03-27', 5, 3),
(2, '2019-03-15', 5, 3),
(3, '2019-02-03', 5, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservierung`
--

CREATE TABLE `reservierung` (
  `ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Begruendung` mediumtext NOT NULL,
  `Ressource_ID` int(11) NOT NULL,
  `Mitarbeiter_ID` int(11) NOT NULL,
  `Kunde_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reservierung`
--

INSERT INTO `reservierung` (`ID`, `Datum`, `Begruendung`, `Ressource_ID`, `Mitarbeiter_ID`, `Kunde_ID`) VALUES
(1, '2019-03-26', 'Muss zum Kunden im Tessin, weil er da im Urlaub ist.', 1, 11, 6),
(2, '2019-03-20', 'Gehe mit Kunden an Match damit der hier was kauft.', 5, 8, 7),
(3, '2019-03-28', 'Ich will einfach so hin.', 6, 10, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressource`
--

CREATE TABLE `ressource` (
  `ID` int(11) NOT NULL,
  `Typ` enum('Generalabo','Jahreskarte') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ressource`
--

INSERT INTO `ressource` (`ID`, `Typ`) VALUES
(1, 'Generalabo'),
(2, 'Generalabo'),
(3, 'Generalabo'),
(4, 'Generalabo'),
(5, 'Jahreskarte'),
(6, 'Jahreskarte'),
(7, 'Jahreskarte'),
(8, 'Jahreskarte');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL,
  `Zeitpunkt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Geloest` tinyint(1) DEFAULT NULL,
  `Komponente_Inventar_ID` int(11) NOT NULL,
  `Erfasser_ID` int(11) NOT NULL,
  `Bearbeiter_ID` int(11) NOT NULL,
  `Konversation_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ticket`
--

INSERT INTO `ticket` (`ID`, `Zeitpunkt`, `Geloest`, `Komponente_Inventar_ID`, `Erfasser_ID`, `Bearbeiter_ID`, `Konversation_ID`) VALUES
(1, '2019-04-01 11:41:45', NULL, 1, 9, 11, 4),
(2, '2019-04-01 11:41:45', 1, 7, 10, 11, 5),
(3, '2019-04-01 11:41:45', NULL, 16, 12, 11, 6);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_abteilungsleiter`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_abteilungsleiter` (
`Abteilungsname` varchar(255)
,`Abteilungsleiter` text
,`Anschrift` varchar(73)
,`Ort` varchar(86)
,`Gehalt` float
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_abteilungsmitarbeiter`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_abteilungsmitarbeiter` (
`Abteilung` varchar(255)
,`Abteilungsleiter` varchar(511)
,`Mitarbeiter` bigint(21)
,`Uebergeordnete_Abteilung` varchar(255)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_arbeitsplatz`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_arbeitsplatz` (
`Arbeitsplatz` int(11)
,`PC` text
,`Tastatur` text
,`Maus` text
,`Monitor` text
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_artikel`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_artikel` (
`Artikelname` varchar(255)
,`Kategorie` varchar(255)
,`Lieferant` varchar(255)
,`Zubehoer` bigint(21)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_beanstandungen`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_beanstandungen` (
`Artikel` varchar(255)
,`Beschreibung` mediumtext
,`Hersteller` varchar(255)
,`Telefon` varchar(50)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_fahrzeugstatus`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_fahrzeugstatus` (
`Modell` varchar(255)
,`Kennzeichen` varchar(20)
,`Versicherung` varchar(255)
,`Probleme` bigint(21)
,`Reparaturen` bigint(21)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_itprobleme`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_itprobleme` (
`Interne_Bezeichnung` varchar(20)
,`Geraeteart` enum('Netzwerk','Drucker','PC','Tastatur','Maus','Monitor')
,`Modell` varchar(255)
,`Hersteller` varchar(255)
,`Erfasser` varchar(511)
,`Initiale Nachricht` longtext
,`Raum` varchar(18)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_reservationen`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_reservationen` (
`Ressource` enum('Generalabo','Jahreskarte')
,`Mitarbeiter` varchar(511)
,`Kunde` varchar(255)
,`Datum` date
,`Rang` int(11)
,`Sektor` varchar(10)
,`Reihe` int(11)
,`Sitzplatznummer` int(11)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `view_vortraege`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `view_vortraege` (
`Thema` varchar(255)
,`Datum_Uhrzeit` datetime
,`Hauptreferent` varchar(511)
,`Teilnehmer` decimal(32,0)
,`Nachfolger` varchar(255)
,`Vorgaenger` varchar(255)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vortrag`
--

CREATE TABLE `vortrag` (
  `ID` int(11) NOT NULL,
  `Zeitpunkt` datetime NOT NULL,
  `Thema` varchar(255) NOT NULL,
  `Raum` varchar(255) NOT NULL,
  `Hauptreferent_ID` int(11) NOT NULL,
  `Reihe_Vorgaenger_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vortrag`
--

INSERT INTO `vortrag` (`ID`, `Zeitpunkt`, `Thema`, `Raum`, `Hauptreferent_ID`, `Reihe_Vorgaenger_ID`) VALUES
(1, '2019-03-29 12:00:00', 'Tu was du net lassen kannsch', 'Sitzungszimmer EG03 im Shoppingcenter', 8, NULL),
(2, '2019-04-05 13:30:00', 'Tu was du net lassen sollsch', 'Sitzungszimmer EG33 im neben SC', 8, 1),
(3, '2019-04-13 12:00:00', 'Was Hans niet lernt fallt selbscht hinein', 'Stage 3 Basel', 9, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vortrag_hat_teilnehmer`
--

CREATE TABLE `vortrag_hat_teilnehmer` (
  `Vortrag_ID` int(11) NOT NULL,
  `Kunde_ID` int(11) NOT NULL,
  `Personenanzahl` int(11) NOT NULL,
  `Weitere_Kontaktperson` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vortrag_hat_teilnehmer`
--

INSERT INTO `vortrag_hat_teilnehmer` (`Vortrag_ID`, `Kunde_ID`, `Personenanzahl`, `Weitere_Kontaktperson`) VALUES
(1, 6, 34, 'Samuela Labadaba\r\nGleiche Nummer wie Firma oder:\r\n+41 79 888 99 11'),
(2, 6, 12, 'Gleiche Nummer wie Firma odr jo'),
(2, 7, 45, 'Wollen kein Kontakt mit tu.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vortrag_hat_unterreferenten`
--

CREATE TABLE `vortrag_hat_unterreferenten` (
  `Vortrag_ID` int(11) NOT NULL,
  `Unterreferent_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vortrag_hat_unterreferenten`
--

INSERT INTO `vortrag_hat_unterreferenten` (`Vortrag_ID`, `Unterreferent_ID`) VALUES
(2, 9),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Struktur des Views `view_abteilungsleiter`
--
DROP TABLE IF EXISTS `view_abteilungsleiter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_abteilungsleiter`  AS  select `abt`.`Name` AS `Abteilungsname`,concat(`mit`.`Vorname`,' ',`mit`.`Nachname`,' (',`mit`.`Benutzername`,')') AS `Abteilungsleiter`,concat(`kon`.`Strasse`,' ',`kon`.`Nummer`) AS `Anschrift`,concat(`ort`.`Postleitzahl`,' ',`ort`.`Ort`) AS `Ort`,`geh`.`Betrag` AS `Gehalt` from ((((`abteilung` `abt` join `mitarbeiter` `mit` on((`mit`.`ID` = `abt`.`Abteilungsleiter_ID`))) join `kontaktdaten` `kon` on((`mit`.`ID` = `kon`.`ID`))) join `ortschaft` `ort` on((`kon`.`Ortschaft_ID` = `ort`.`ID`))) join `gehalt` `geh` on((`geh`.`Mitarbeiter_ID` = `mit`.`ID`))) ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_abteilungsmitarbeiter`
--
DROP TABLE IF EXISTS `view_abteilungsmitarbeiter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_abteilungsmitarbeiter`  AS  select `abt`.`Name` AS `Abteilung`,concat(`abtleit`.`Vorname`,' ',`abtleit`.`Nachname`) AS `Abteilungsleiter`,count(`mit`.`ID`) AS `Mitarbeiter`,(select `uabt`.`Name` from `abteilung` `uabt` where (`uabt`.`ID` = `abt`.`Uebergeordnete_Abteilung_ID`)) AS `Uebergeordnete_Abteilung` from ((`abteilung` `abt` join `mitarbeiter` `abtleit` on((`abtleit`.`ID` = `abt`.`Abteilungsleiter_ID`))) left join `mitarbeiter` `mit` on((`mit`.`Abteilung_ID` = `abt`.`ID`))) group by `abt`.`ID` ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_arbeitsplatz`
--
DROP TABLE IF EXISTS `view_arbeitsplatz`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_arbeitsplatz`  AS  select `arb`.`ID` AS `Arbeitsplatz`,concat('Gereateart: ',`invpc`.`Typ`,char(13),'Bezeichnung: ',`invpc`.`Interne_Bezeichnung`,char(13),'Modell: ',`katpc`.`Modellname`,char(13),'Hersteller: ',`firpc`.`Name`,char(13)) AS `PC`,concat('Gereateart: ',`invta`.`Typ`,char(13),'Bezeichnung: ',`invta`.`Interne_Bezeichnung`,char(13),'Modell: ',`katta`.`Modellname`,char(13),'Hersteller: ',`firta`.`Name`,char(13)) AS `Tastatur`,concat('Gereateart: ',`invma`.`Typ`,char(13),'Bezeichnung: ',`invma`.`Interne_Bezeichnung`,char(13),'Modell: ',`katma`.`Modellname`,char(13),'Hersteller: ',`firma`.`Name`,char(13)) AS `Maus`,concat('Gereateart: ',`invmo`.`Typ`,char(13),'Bezeichnung: ',`invmo`.`Interne_Bezeichnung`,char(13),'Modell: ',`katmo`.`Modellname`,char(13),'Hersteller: ',`firmo`.`Name`,char(13)) AS `Monitor` from ((((((((((((`arbeitsplatz` `arb` join `komponente_inventar` `invpc` on((`invpc`.`ID` = `arb`.`PC_Komponente_ID`))) join `komponente_inventar` `invta` on((`invta`.`ID` = `arb`.`Tastatur_Komponente_ID`))) join `komponente_inventar` `invma` on((`invma`.`ID` = `arb`.`Maus_Komponente_ID`))) join `komponente_inventar` `invmo` on((`invmo`.`ID` = `arb`.`Monitor_Komponente_ID`))) join `komponente_katalog` `katpc` on((`invpc`.`Komponente_Katalog_ID` = `katpc`.`ID`))) join `komponente_katalog` `katta` on((`invta`.`Komponente_Katalog_ID` = `katta`.`ID`))) join `komponente_katalog` `katma` on((`invma`.`Komponente_Katalog_ID` = `katma`.`ID`))) join `komponente_katalog` `katmo` on((`invmo`.`Komponente_Katalog_ID` = `katmo`.`ID`))) join `firma` `firpc` on((`katpc`.`Hersteller_ID` = `firpc`.`ID`))) join `firma` `firta` on((`katta`.`Hersteller_ID` = `firta`.`ID`))) join `firma` on((`katma`.`Hersteller_ID` = `firma`.`ID`))) join `firma` `firmo` on((`katmo`.`Hersteller_ID` = `firmo`.`ID`))) ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_artikel`
--
DROP TABLE IF EXISTS `view_artikel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_artikel`  AS  select `art`.`Name` AS `Artikelname`,`kat`.`Name` AS `Kategorie`,`fir`.`Name` AS `Lieferant`,count(`zub`.`Zubehoer_ID`) AS `Zubehoer` from (((`artikel` `art` join `kategorie` `kat` on((`art`.`Kategorie_ID` = `kat`.`ID`))) join `firma` `fir` on((`art`.`Lieferant_ID` = `fir`.`ID`))) left join `artikel_hat_zubehoer` `zub` on((`art`.`ID` = `zub`.`Artikel_ID`))) group by `art`.`Name` ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_beanstandungen`
--
DROP TABLE IF EXISTS `view_beanstandungen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_beanstandungen`  AS  select `art`.`Name` AS `Artikel`,`bea`.`Beschreibung` AS `Beschreibung`,`fir`.`Name` AS `Hersteller`,`kon`.`Telefonnummer` AS `Telefon` from (((`beanstandung` `bea` join `artikel` `art` on((`art`.`ID` = `bea`.`Bestellung_Artikel_ID`))) join `firma` `fir` on((`fir`.`ID` = `art`.`Hersteller_ID`))) left join `kontaktdaten` `kon` on((`fir`.`ID` = `kon`.`ID`))) ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_fahrzeugstatus`
--
DROP TABLE IF EXISTS `view_fahrzeugstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_fahrzeugstatus`  AS  select `fah`.`Modell` AS `Modell`,`fah`.`Kennzeichen` AS `Kennzeichen`,`fir`.`Name` AS `Versicherung`,(select count(`pro`.`ID`) from `problem` `pro` where ((`pro`.`Status` <> 'Geschlossen') and (`pro`.`Dienstfahrzeug_ID` = `fah`.`ID`))) AS `Probleme`,count(`rep`.`ID`) AS `Reparaturen` from ((`dienstfahrzeug` `fah` left join `reparatur` `rep` on((`rep`.`Dienstfahrzeug_ID` = `fah`.`ID`))) join `firma` `fir` on((`fir`.`ID` = `fah`.`Versicherung_ID`))) group by `fah`.`ID` ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_itprobleme`
--
DROP TABLE IF EXISTS `view_itprobleme`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_itprobleme`  AS  select `inv`.`Interne_Bezeichnung` AS `Interne_Bezeichnung`,`inv`.`Typ` AS `Geraeteart`,`kat`.`Modellname` AS `Modell`,`her`.`Name` AS `Hersteller`,concat(`mit`.`Vorname`,' ',`mit`.`Nachname`) AS `Erfasser`,(select `nac`.`Inhalt` from `nachricht` `nac` where (`nac`.`Konversation_ID` = `kon`.`ID`) limit 1) AS `Initiale Nachricht`,ifnull((select `arb`.`Raum_ID` from `arbeitsplatz` `arb` where ((`arb`.`PC_Komponente_ID` = `inv`.`ID`) or (`arb`.`Tastatur_Komponente_ID` = `inv`.`ID`) or (`arb`.`Maus_Komponente_ID` = `inv`.`ID`) or (`arb`.`Monitor_Komponente_ID` = `inv`.`ID`))),ifnull((select `net`.`Raum_ID` from `komponente_netzwerk` `net` where (`net`.`ID` = `inv`.`ID`)),ifnull((select `dru`.`ID` from `raum` `dru` where (`dru`.`Drucker_Inventar_ID` = `inv`.`ID`)),'Kein Raum gefunden'))) AS `Raum` from (((((`ticket` `tic` join `komponente_inventar` `inv` on((`inv`.`ID` = `tic`.`Komponente_Inventar_ID`))) join `komponente_katalog` `kat` on((`inv`.`Komponente_Katalog_ID` = `kat`.`ID`))) join `firma` `her` on((`kat`.`Hersteller_ID` = `her`.`ID`))) join `mitarbeiter` `mit` on((`tic`.`Erfasser_ID` = `mit`.`ID`))) join `konversation` `kon` on((`tic`.`Konversation_ID` = `kon`.`ID`))) where isnull(`tic`.`Geloest`) ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_reservationen`
--
DROP TABLE IF EXISTS `view_reservationen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_reservationen`  AS  select `ress`.`Typ` AS `Ressource`,concat(`mit`.`Vorname`,' ',`mit`.`Nachname`) AS `Mitarbeiter`,`fir`.`Name` AS `Kunde`,`rese`.`Datum` AS `Datum`,`abo`.`Rang` AS `Rang`,`abo`.`Sektor` AS `Sektor`,`abo`.`Reihe` AS `Reihe`,`abo`.`Sitzplatznummer` AS `Sitzplatznummer` from ((((`reservierung` `rese` join `ressource` `ress` on((`rese`.`Ressource_ID` = `ress`.`ID`))) join `mitarbeiter` `mit` on((`rese`.`Mitarbeiter_ID` = `mit`.`ID`))) join `firma` `fir` on((`rese`.`Kunde_ID` = `fir`.`ID`))) join `jahreskarte` `abo` on((`ress`.`ID` = `abo`.`Ressource_ID`))) where ((`ress`.`Typ` = 'Jahreskarte') and (`rese`.`Kunde_ID` is not null)) ;

-- --------------------------------------------------------

--
-- Struktur des Views `view_vortraege`
--
DROP TABLE IF EXISTS `view_vortraege`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_vortraege`  AS  select `vor`.`Thema` AS `Thema`,`vor`.`Zeitpunkt` AS `Datum_Uhrzeit`,concat(`ref`.`Vorname`,' ',`ref`.`Nachname`) AS `Hauptreferent`,sum(`tei`.`Personenanzahl`) AS `Teilnehmer`,(select `vorg`.`Thema` from `vortrag` `vorg` where (`vorg`.`Reihe_Vorgaenger_ID` = `vor`.`ID`)) AS `Nachfolger`,(select `vorn`.`Thema` from `vortrag` `vorn` where (`vorn`.`ID` = `vor`.`Reihe_Vorgaenger_ID`)) AS `Vorgaenger` from ((`vortrag` `vor` join `mitarbeiter` `ref` on((`vor`.`Hauptreferent_ID` = `ref`.`ID`))) left join `vortrag_hat_teilnehmer` `tei` on((`tei`.`Vortrag_ID` = `vor`.`ID`))) group by `vor`.`ID` ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Mitarbeiter_leitet_Abteilung` (`Abteilungsleiter_ID`),
  ADD KEY `Abteilung_untersteht_Abteilung` (`Uebergeordnete_Abteilung_ID`);

--
-- Indizes für die Tabelle `arbeitsplatz`
--
ALTER TABLE `arbeitsplatz`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Arbeitsplatz_is_in_Raum` (`Raum_ID`),
  ADD KEY `Arbeitsplatz_hat_Mitarbeiter` (`Mitarbeiter_ID`),
  ADD KEY `Arbeitsplatz_hat_PC` (`PC_Komponente_ID`),
  ADD KEY `Arbeitsplatz_hat_Tastatur` (`Tastatur_Komponente_ID`),
  ADD KEY `Arbeitsplatz_hat_Maus` (`Maus_Komponente_ID`),
  ADD KEY `Arbeitsplatz_hat_Monitor` (`Monitor_Komponente_ID`);

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Artikel_hat_Hersteller` (`Hersteller_ID`),
  ADD KEY `Artikel_kommt_von_Lieferant` (`Lieferant_ID`),
  ADD KEY `Artikel_hat_Kategorie` (`Kategorie_ID`);

--
-- Indizes für die Tabelle `artikel_hat_zubehoer`
--
ALTER TABLE `artikel_hat_zubehoer`
  ADD PRIMARY KEY (`Artikel_ID`,`Zubehoer_ID`),
  ADD KEY `Zubehoer_ist_von_Artikel` (`Zubehoer_ID`);

--
-- Indizes für die Tabelle `beanstandung`
--
ALTER TABLE `beanstandung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Bestellung_hat_Beanstandung` (`Bestellung_ID`),
  ADD KEY `Artikel_hat_Beanstandung` (`Bestellung_Artikel_ID`),
  ADD KEY `Beanstandung_hat_Konversation` (`Konversation_ID`);

--
-- Indizes für die Tabelle `beratungsvertrag`
--
ALTER TABLE `beratungsvertrag`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE_Vertragsnummer` (`Vertragsnummer`),
  ADD KEY `Vertrag_hat_Kunde` (`Kunde_ID`),
  ADD KEY `Vertrag_kommt_von_Vertrag` (`Folgeauftrag_von_ID`);

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE_Bestellnummer` (`Bestellnummer`),
  ADD KEY `Bestellung_hat_Bearbeiter` (`Bearbeiter_ID`);

--
-- Indizes für die Tabelle `bestellung_hat_artikel`
--
ALTER TABLE `bestellung_hat_artikel`
  ADD PRIMARY KEY (`Artikel_ID`,`Bestellung_ID`),
  ADD KEY `Bestellung_hat_Artikel` (`Bestellung_ID`);

--
-- Indizes für die Tabelle `dienstfahrzeug`
--
ALTER TABLE `dienstfahrzeug`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE_Kennzeichen` (`Kennzeichen`),
  ADD KEY `Fahrzeug_hat_Versicherung` (`Versicherung_ID`),
  ADD KEY `Fahrzeug_hat_Leasing` (`Leasingfirma_ID`);

--
-- Indizes für die Tabelle `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `gehalt`
--
ALTER TABLE `gehalt`
  ADD PRIMARY KEY (`Mitarbeiter_ID`);

--
-- Indizes für die Tabelle `generalabo`
--
ALTER TABLE `generalabo`
  ADD PRIMARY KEY (`Ressource_ID`);

--
-- Indizes für die Tabelle `jahreskarte`
--
ALTER TABLE `jahreskarte`
  ADD PRIMARY KEY (`Ressource_ID`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Kategorie_wird_betreut_von_Mitarbeiter` (`Betreuer_ID`),
  ADD KEY `Kategorie_hat_Oberkategorie` (`Oberkategorie_ID`);

--
-- Indizes für die Tabelle `komponente_inventar`
--
ALTER TABLE `komponente_inventar`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE_Seriennummer` (`Seriennummer`),
  ADD UNIQUE KEY `UNIQUE_Interne_Bezeichnung` (`Interne_Bezeichnung`),
  ADD KEY `Komponente_ist_von_Katalog` (`Komponente_Katalog_ID`);

--
-- Indizes für die Tabelle `komponente_katalog`
--
ALTER TABLE `komponente_katalog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Komponente_hat_Hersteller` (`Hersteller_ID`);

--
-- Indizes für die Tabelle `komponente_netzwerk`
--
ALTER TABLE `komponente_netzwerk`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Netzwerk_Komponente_ist_in_Raum` (`Raum_ID`);

--
-- Indizes für die Tabelle `kontaktdaten`
--
ALTER TABLE `kontaktdaten`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Adresse_hat_Ortschaft` (`Ortschaft_ID`);

--
-- Indizes für die Tabelle `konversation`
--
ALTER TABLE `konversation`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Mitarbeiter_hat_Vorgesetzten` (`Vorgesetzter_ID`),
  ADD KEY `Mitarbeiter_in_Abteilung` (`Abteilung_ID`);

--
-- Indizes für die Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Nachricht_hat_Erfasser` (`Erfasser_ID`),
  ADD KEY `Nachricht_ist_von_Konversation` (`Konversation_ID`);

--
-- Indizes für die Tabelle `ortschaft`
--
ALTER TABLE `ortschaft`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Problem_durch_Mitarbeiter` (`Erfasser_ID`),
  ADD KEY `Problem_an_Fahrzeug` (`Dienstfahrzeug_ID`),
  ADD KEY `Problem_bearbeitet_in_Reparatur` (`Bearbeitet_in_ID`);

--
-- Indizes für die Tabelle `raum`
--
ALTER TABLE `raum`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Raum_hat_Drucker` (`Drucker_Inventar_ID`);

--
-- Indizes für die Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Reparatur_in_Werkstatt` (`Werkstatt_ID`),
  ADD KEY `Reparatur_an_Fahrzeug` (`Dienstfahrzeug_ID`);

--
-- Indizes für die Tabelle `reservierung`
--
ALTER TABLE `reservierung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Reservierung_hat_Ressource` (`Ressource_ID`),
  ADD KEY `Reserviert_von_Mitarbeiter` (`Mitarbeiter_ID`),
  ADD KEY `Reserviert_zwecks_Kunde` (`Kunde_ID`);

--
-- Indizes für die Tabelle `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Ticket_ist_zu_Komponente` (`Komponente_Inventar_ID`),
  ADD KEY `Ticket_kommt_von_Mitarbeiter` (`Erfasser_ID`),
  ADD KEY `Ticket_wird_bearbeitet_von_Mitarbeiter` (`Bearbeiter_ID`),
  ADD KEY `Ticket_hat_Konversation` (`Konversation_ID`);

--
-- Indizes für die Tabelle `vortrag`
--
ALTER TABLE `vortrag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Vortrag_hat_Hauptreferent` (`Hauptreferent_ID`),
  ADD KEY `Vortrag_hat_Vorgaenger` (`Reihe_Vorgaenger_ID`);

--
-- Indizes für die Tabelle `vortrag_hat_teilnehmer`
--
ALTER TABLE `vortrag_hat_teilnehmer`
  ADD PRIMARY KEY (`Vortrag_ID`,`Kunde_ID`),
  ADD KEY `Kunde_ist_Besucher` (`Kunde_ID`);

--
-- Indizes für die Tabelle `vortrag_hat_unterreferenten`
--
ALTER TABLE `vortrag_hat_unterreferenten`
  ADD PRIMARY KEY (`Vortrag_ID`,`Unterreferent_ID`),
  ADD KEY `Unterreferent_ist_von_Vortrag` (`Unterreferent_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `arbeitsplatz`
--
ALTER TABLE `arbeitsplatz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `beanstandung`
--
ALTER TABLE `beanstandung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `beratungsvertrag`
--
ALTER TABLE `beratungsvertrag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `dienstfahrzeug`
--
ALTER TABLE `dienstfahrzeug`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `komponente_inventar`
--
ALTER TABLE `komponente_inventar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `komponente_katalog`
--
ALTER TABLE `komponente_katalog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `kontaktdaten`
--
ALTER TABLE `kontaktdaten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `konversation`
--
ALTER TABLE `konversation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `ortschaft`
--
ALTER TABLE `ortschaft`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `problem`
--
ALTER TABLE `problem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `raum`
--
ALTER TABLE `raum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `ressource`
--
ALTER TABLE `ressource`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `vortrag`
--
ALTER TABLE `vortrag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  ADD CONSTRAINT `Abteilung_untersteht_Abteilung` FOREIGN KEY (`Uebergeordnete_Abteilung_ID`) REFERENCES `abteilung` (`ID`),
  ADD CONSTRAINT `Mitarbeiter_leitet_Abteilung` FOREIGN KEY (`Abteilungsleiter_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `arbeitsplatz`
--
ALTER TABLE `arbeitsplatz`
  ADD CONSTRAINT `Arbeitsplatz_hat_Maus` FOREIGN KEY (`Maus_Komponente_ID`) REFERENCES `komponente_inventar` (`ID`),
  ADD CONSTRAINT `Arbeitsplatz_hat_Mitarbeiter` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Arbeitsplatz_hat_Monitor` FOREIGN KEY (`Monitor_Komponente_ID`) REFERENCES `komponente_inventar` (`ID`),
  ADD CONSTRAINT `Arbeitsplatz_hat_PC` FOREIGN KEY (`PC_Komponente_ID`) REFERENCES `komponente_inventar` (`ID`),
  ADD CONSTRAINT `Arbeitsplatz_hat_Tastatur` FOREIGN KEY (`Tastatur_Komponente_ID`) REFERENCES `komponente_inventar` (`ID`),
  ADD CONSTRAINT `Arbeitsplatz_is_in_Raum` FOREIGN KEY (`Raum_ID`) REFERENCES `raum` (`ID`);

--
-- Constraints der Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `Artikel_hat_Hersteller` FOREIGN KEY (`Hersteller_ID`) REFERENCES `firma` (`ID`),
  ADD CONSTRAINT `Artikel_hat_Kategorie` FOREIGN KEY (`Kategorie_ID`) REFERENCES `kategorie` (`ID`),
  ADD CONSTRAINT `Artikel_kommt_von_Lieferant` FOREIGN KEY (`Lieferant_ID`) REFERENCES `firma` (`ID`);

--
-- Constraints der Tabelle `artikel_hat_zubehoer`
--
ALTER TABLE `artikel_hat_zubehoer`
  ADD CONSTRAINT `Artikel_hat_Zubehoer` FOREIGN KEY (`Artikel_ID`) REFERENCES `artikel` (`ID`),
  ADD CONSTRAINT `Zubehoer_ist_von_Artikel` FOREIGN KEY (`Zubehoer_ID`) REFERENCES `artikel` (`ID`);

--
-- Constraints der Tabelle `beanstandung`
--
ALTER TABLE `beanstandung`
  ADD CONSTRAINT `Artikel_hat_Beanstandung` FOREIGN KEY (`Bestellung_Artikel_ID`) REFERENCES `bestellung_hat_artikel` (`Artikel_ID`),
  ADD CONSTRAINT `Beanstandung_hat_Konversation` FOREIGN KEY (`Konversation_ID`) REFERENCES `konversation` (`ID`),
  ADD CONSTRAINT `Bestellung_hat_Beanstandung` FOREIGN KEY (`Bestellung_ID`) REFERENCES `bestellung_hat_artikel` (`Bestellung_ID`);

--
-- Constraints der Tabelle `beratungsvertrag`
--
ALTER TABLE `beratungsvertrag`
  ADD CONSTRAINT `Vertrag_hat_Kunde` FOREIGN KEY (`Kunde_ID`) REFERENCES `firma` (`ID`),
  ADD CONSTRAINT `Vertrag_kommt_von_Vertrag` FOREIGN KEY (`Folgeauftrag_von_ID`) REFERENCES `beratungsvertrag` (`ID`);

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `Bestellung_hat_Bearbeiter` FOREIGN KEY (`Bearbeiter_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `bestellung_hat_artikel`
--
ALTER TABLE `bestellung_hat_artikel`
  ADD CONSTRAINT `Artikel_ist_in_Bestellung` FOREIGN KEY (`Artikel_ID`) REFERENCES `artikel` (`ID`),
  ADD CONSTRAINT `Bestellung_hat_Artikel` FOREIGN KEY (`Bestellung_ID`) REFERENCES `bestellung` (`ID`);

--
-- Constraints der Tabelle `dienstfahrzeug`
--
ALTER TABLE `dienstfahrzeug`
  ADD CONSTRAINT `Fahrzeug_hat_Leasing` FOREIGN KEY (`Leasingfirma_ID`) REFERENCES `firma` (`ID`),
  ADD CONSTRAINT `Fahrzeug_hat_Versicherung` FOREIGN KEY (`Versicherung_ID`) REFERENCES `firma` (`ID`);

--
-- Constraints der Tabelle `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `Firma_hat_Kontaktdaten` FOREIGN KEY (`ID`) REFERENCES `kontaktdaten` (`ID`);

--
-- Constraints der Tabelle `gehalt`
--
ALTER TABLE `gehalt`
  ADD CONSTRAINT `Gehalt_ist_von_Mitarbeiter` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `generalabo`
--
ALTER TABLE `generalabo`
  ADD CONSTRAINT `Abo_ist_Ressource` FOREIGN KEY (`Ressource_ID`) REFERENCES `ressource` (`ID`);

--
-- Constraints der Tabelle `jahreskarte`
--
ALTER TABLE `jahreskarte`
  ADD CONSTRAINT `Karte_ist_Ressource` FOREIGN KEY (`Ressource_ID`) REFERENCES `ressource` (`ID`);

--
-- Constraints der Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD CONSTRAINT `Kategorie_hat_Oberkategorie` FOREIGN KEY (`Oberkategorie_ID`) REFERENCES `kategorie` (`ID`),
  ADD CONSTRAINT `Kategorie_wird_betreut_von_Mitarbeiter` FOREIGN KEY (`Betreuer_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `komponente_inventar`
--
ALTER TABLE `komponente_inventar`
  ADD CONSTRAINT `Komponente_ist_von_Katalog` FOREIGN KEY (`Komponente_Katalog_ID`) REFERENCES `komponente_katalog` (`ID`);

--
-- Constraints der Tabelle `komponente_katalog`
--
ALTER TABLE `komponente_katalog`
  ADD CONSTRAINT `Komponente_hat_Hersteller` FOREIGN KEY (`Hersteller_ID`) REFERENCES `firma` (`ID`);

--
-- Constraints der Tabelle `komponente_netzwerk`
--
ALTER TABLE `komponente_netzwerk`
  ADD CONSTRAINT `Netzwerk_Komponente_ist_in_Raum` FOREIGN KEY (`Raum_ID`) REFERENCES `raum` (`ID`),
  ADD CONSTRAINT `Netzwerk_hat_Inventar_Komponente` FOREIGN KEY (`ID`) REFERENCES `komponente_inventar` (`ID`);

--
-- Constraints der Tabelle `kontaktdaten`
--
ALTER TABLE `kontaktdaten`
  ADD CONSTRAINT `Adresse_hat_Ortschaft` FOREIGN KEY (`Ortschaft_ID`) REFERENCES `ortschaft` (`ID`);

--
-- Constraints der Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `Mitarbeiter_hat_Kontaktdaten` FOREIGN KEY (`ID`) REFERENCES `kontaktdaten` (`ID`),
  ADD CONSTRAINT `Mitarbeiter_hat_Vorgesetzten` FOREIGN KEY (`Vorgesetzter_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Mitarbeiter_in_Abteilung` FOREIGN KEY (`Abteilung_ID`) REFERENCES `abteilung` (`ID`);

--
-- Constraints der Tabelle `nachricht`
--
ALTER TABLE `nachricht`
  ADD CONSTRAINT `Nachricht_hat_Erfasser` FOREIGN KEY (`Erfasser_ID`) REFERENCES `kontaktdaten` (`ID`),
  ADD CONSTRAINT `Nachricht_ist_von_Konversation` FOREIGN KEY (`Konversation_ID`) REFERENCES `konversation` (`ID`);

--
-- Constraints der Tabelle `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `Problem_an_Fahrzeug` FOREIGN KEY (`Dienstfahrzeug_ID`) REFERENCES `dienstfahrzeug` (`ID`),
  ADD CONSTRAINT `Problem_bearbeitet_in_Reparatur` FOREIGN KEY (`Bearbeitet_in_ID`) REFERENCES `reparatur` (`ID`),
  ADD CONSTRAINT `Problem_durch_Mitarbeiter` FOREIGN KEY (`Erfasser_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `raum`
--
ALTER TABLE `raum`
  ADD CONSTRAINT `Raum_hat_Drucker` FOREIGN KEY (`Drucker_Inventar_ID`) REFERENCES `komponente_inventar` (`ID`);

--
-- Constraints der Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  ADD CONSTRAINT `Reparatur_an_Fahrzeug` FOREIGN KEY (`Dienstfahrzeug_ID`) REFERENCES `dienstfahrzeug` (`ID`),
  ADD CONSTRAINT `Reparatur_in_Werkstatt` FOREIGN KEY (`Werkstatt_ID`) REFERENCES `firma` (`ID`);

--
-- Constraints der Tabelle `reservierung`
--
ALTER TABLE `reservierung`
  ADD CONSTRAINT `Reserviert_von_Mitarbeiter` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Reserviert_zwecks_Kunde` FOREIGN KEY (`Kunde_ID`) REFERENCES `firma` (`ID`),
  ADD CONSTRAINT `Reservierung_hat_Ressource` FOREIGN KEY (`Ressource_ID`) REFERENCES `ressource` (`ID`);

--
-- Constraints der Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `Ticket_hat_Konversation` FOREIGN KEY (`Konversation_ID`) REFERENCES `konversation` (`ID`),
  ADD CONSTRAINT `Ticket_ist_zu_Komponente` FOREIGN KEY (`Komponente_Inventar_ID`) REFERENCES `komponente_inventar` (`ID`),
  ADD CONSTRAINT `Ticket_kommt_von_Mitarbeiter` FOREIGN KEY (`Erfasser_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Ticket_wird_bearbeitet_von_Mitarbeiter` FOREIGN KEY (`Bearbeiter_ID`) REFERENCES `mitarbeiter` (`ID`);

--
-- Constraints der Tabelle `vortrag`
--
ALTER TABLE `vortrag`
  ADD CONSTRAINT `Vortrag_hat_Hauptreferent` FOREIGN KEY (`Hauptreferent_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Vortrag_hat_Vorgaenger` FOREIGN KEY (`Reihe_Vorgaenger_ID`) REFERENCES `vortrag` (`ID`);

--
-- Constraints der Tabelle `vortrag_hat_teilnehmer`
--
ALTER TABLE `vortrag_hat_teilnehmer`
  ADD CONSTRAINT `Kunde_ist_Besucher` FOREIGN KEY (`Kunde_ID`) REFERENCES `firma` (`ID`),
  ADD CONSTRAINT `Vortrag_hat_Besucher` FOREIGN KEY (`Vortrag_ID`) REFERENCES `vortrag` (`ID`);

--
-- Constraints der Tabelle `vortrag_hat_unterreferenten`
--
ALTER TABLE `vortrag_hat_unterreferenten`
  ADD CONSTRAINT `Unterreferent_ist_von_Vortrag` FOREIGN KEY (`Unterreferent_ID`) REFERENCES `mitarbeiter` (`ID`),
  ADD CONSTRAINT `Vortrag_hat_Unterreferenten` FOREIGN KEY (`Vortrag_ID`) REFERENCES `vortrag` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
