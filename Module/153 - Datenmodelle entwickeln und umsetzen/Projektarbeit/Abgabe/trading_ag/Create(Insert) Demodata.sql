-- -------------- DEMODATA FOR 'trading_ag'

-- ---------- THEMA 'Personen'

-- -- TABELLE 'ortschaft'
INSERT INTO `ortschaft` (`ID`, `Ort`, `Postleitzahl`) VALUES
(1, 'Basel', '4058'),
(2, 'Basel', '4001'),
(3, 'Basel', '4055'),
(4, 'Therwil', '6850'),
(5, 'Therwil', '6855'),
(6, 'Therwil', '6800');

-- -- TABELLE 'kontaktdaten': FIRMEN
INSERT INTO `kontaktdaten` (`ID`, `Strasse`, `Nummer`, `Ortschaft_ID`, `Email`, `Telefonnummer`, `Typ`) VALUES
(1, 'Straussenstrasse', '34a', '1', 'support@guterhersteller.com', '+41 82 232 94 84', 'Firma'),
(2, 'Laberstrasse', '152', '2', 'support@guterlieferant.com', '+41 87 839 03 72', 'Firma'),
(3, 'Birgmattweg', '78c', '3', 'support@leasingfirma.com', '+41 32 912 99 11', 'Firma'),
(4, 'Straussenstrasse', '55b', '4', 'mail@versicherungsabzocke.com', '+41 12 123 12 34', 'Firma'),
(5, 'Schwafelstrasse', '377', '5', 'contact@beschtewerkstatt.com', '+41 33 555 66 77', 'Firma'),
(6, 'Falschestrasse', '404', '6', 'support@guterkunde.com', '+41 11 777 33 23', 'Firma'),
(7, 'Richtigestrasse', '200', '1', 'irgendwie@schlechterkunde.com', '+41 22 143 87 22', 'Firma');

-- -- TABELLE 'firma'
INSERT INTO `firma` (`ID`, `Name`, `Ansprechsperson`, `Webseite`, `Typ`) VALUES
(1, 'Ich mache herstellen diese', 'Peter Lamborgini', 'support.guterhersteller.to', 'Hersteller'),
(2, 'Ich bringe diese', 'Peter Ferrari', NULL, 'Lieferant'),
(3, 'Mach dir Schulden mit Leasing', 'Zamanta Chantal', 'holdirleasing.com', 'Leasing'),
(4, 'Zu teure Haftpflicht ohne Grund', 'Chris P. Bacon', 'gibmirdeingeld.com', 'Versicherung'),
(5, 'Ich flikke diese', 'Axel Schweisser', 'motopotogo.to', 'Werkstatt'),
(6, 'Ich brauche dein Beratung', 'Standart Typpi', NULL, 'Kunde'),
(7, 'Ich habe zu viel Geld', 'Mary Juana', 'googlefacebookamazon.com', 'Kunde');

-- -- TABELLE 'kontaktdaten': MITARBEITER
INSERT INTO `kontaktdaten` (`ID`, `Strasse`, `Nummer`, `Ortschaft_ID`, `Email`, `Telefonnummer`, `Typ`) VALUES
(8, 'Tupac Lane', '11', '1', 'chef.decheffe@gmail.com', '+41 61 112 11 22', 'Mitarbeiter'),
(9, 'Zur Holle', '22', '2', 'chef.desonespaar@gmail.com', '+41 61 113 11 23', 'Mitarbeiter'),
(10, 'Gurkensteig', '33', '3', 'niet.decheffe@gmail.com', '+41 61 114 11 33', 'Mitarbeiter'),
(11, 'Hodenhagen', '44', '4', 'uli.muli@guli.com', '+41 61 115 11 44', 'Mitarbeiter'),
(12, 'Deeper Pfad', '55', '5', 'andreas.merte@bundeskanzler.com', '+41 61 116 11 55', 'Mitarbeiter'),
(13, 'Tittentasterstrasse', '66', '6', 'diese.strasse@gibts.wirklich', '+41 61 117 11 62', 'Mitarbeiter');

-- -- TABELLE 'mitarbeiter'
INSERT INTO `mitarbeiter` (`ID`, `Vorname`, `Nachname`, `Benutzername`, `Passwort`, `Arbeitsvertrag`, `Vorgesetzter_ID`) VALUES
(8, 'Chef', 'DeCheffe', 'chef.decheffe', 'InsertRandomMD5EncryptedPasswordHere1','11aa22bb33cc', NULL),
(9, 'Chef', 'Desonespaar', 'chef.desonespaar', 'InsertRandomMD5EncryptedPasswordHere2','22aa22bb33cc', '8'),
(10, 'Niet', 'DeCheffe', 'niet.decheffe', 'InsertRandomMD5EncryptedPasswordHere3','33aa22bb33cc', '8'),
(11, 'Uli', 'Muli', 'uli.muli', 'InsertRandomMD5EncryptedPasswordHere4','44aa22bb33cc', '9'),
(12, 'Andreas', 'Merte', 'andreas.merte', 'InsertRandomMD5EncryptedPasswordHere5','55aa22bb33cc', '9'),
(13, 'Kiine', 'Ehnung', 'kiine.ehnung', 'InsertRandomMD5EncryptedPasswordHere6','66aa22bb33cc', '9');

-- -- TABELLE 'gehalt'
INSERT INTO `gehalt` (`Mitarbeiter_ID`, `Betrag`) VALUES
(8, '10315.45'),
(9, '9560.00'),
(10, '5600.00'),
(11, '5500.00'),
(12, '5230.00'),
(13, '6900.00');





-- ---------- THEMA 'Artikel'

-- -- TABELLE 'kategorie'
INSERT INTO `kategorie` (`ID`, `Name`, `Betreuer_ID`, `Oberkategorie_ID`) VALUES
(1, 'Software', '8', NULL),
(2, 'Hardware', '9', NULL),
(3, 'Buchhaltungsprogramme', '10', '1'),
(4, 'PDF Programme', '10', '1'),
(5, 'Entspannung', '11', '2'),
(6, 'Anspannung', '12', '2'),
(7, 'Verspannung', '13', '2');

-- -- TABELLE 'artikel'
INSERT INTO `artikel` (`ID`, `Name`, `Beschreibung`, `Einkaufspreis`, `Verkaufspreis`, `Lagerbestand`, `Hersteller_ID`, `Lieferant_ID`, `Kategorie_ID`) VALUES
(1, 'SuperHaltung', 'Super gute Buchhaltung hier', '5000', '7600', '33', '1', '2', '3'),
(2, 'Fidget Spinner', 'You spin me right round right round', '50.50', '90.95', '963', '1', '2', '5'),
(3, 'Origami', 'Origami Lehrbuch aus 3 Seiten', '15.45', '29.95', '12', '1', '2', '7'),
(4, 'Type P', 'Jemand gibt bei dir in der Adresszeile vom Browser eine URL mit Anfangsbuchstabe P ein.', '69.95', '96.50', '57', '1', '2', '6');

-- -- TABELLE 'artikel_hat_zubehoer'
INSERT INTO `artikel_hat_zubehoer` (`Artikel_ID`, `Zubehoer_ID`) VALUES
(1, 2),
(1, 3),
(1, 4);




-- ---------- THEMA 'Bestellung'

-- -- TABELLE 'bestellung'
INSERT INTO `bestellung` (`ID`, `Bestellnummer`, `Bestelldatum`, `Lieferdatum`, `Bearbeiter_ID`) VALUES
(1, '000005', '2019-03-10', '2019-03-23', '13'),
(2, '000006', '2019-03-13', '2019-03-25', '11'),
(3, '000007', '2019-03-21', NULL, '9');

-- -- TABELLE 'bestellung_hat_artikel'
INSERT INTO `bestellung_hat_artikel` (`Bestellung_ID`, `Artikel_ID`, `Anzahl`) VALUES
('1', '1', '10'),
('2', '3', '1'),
('3', '4', '5'),
('3', '3', '5');

-- -- TABELLE 'beanstandung' + 'konversation' + 'nachricht' Eintrag 1
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(1, 'Beanstandung');

INSERT INTO `beanstandung` (`ID`, `Beschreibung`, `Bestellung_ID`, `Bestellung_Artikel_ID`, `Konversation_ID`) VALUES
(1, 'Dasch mega blöd odr', '2', '3', '1');

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`, `Inhalt`) VALUES
(1, '12', '1', 'Das teil läuft nicht. Bitte Hersteller sage mir wieso.');

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`,  `Inhalt`) VALUES
(2, '1', '1', 'Das isch no nie richtig gange. Nit mis problem.');

-- -- TABELLE 'beanstandung' + 'konversation' Eintrag 2
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(2, 'Beanstandung');

INSERT INTO `beanstandung` (`ID`, `Beschreibung`, `Bestellung_ID`, `Bestellung_Artikel_ID`, `Konversation_ID`) VALUES
(2, 'Wasch da los eyyy', '1', '1', '2');

-- -- TABELLE 'beanstandung' + 'konversation' Eintrag 3
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(3, 'Beanstandung');

INSERT INTO `beanstandung` (`ID`, `Beschreibung`, `Bestellung_ID`, `Bestellung_Artikel_ID`, `Konversation_ID`) VALUES
(3, 'Wurde deswegen gekündigt. Braucht das jetzt nicht mehr.', '3', '4', '3');




-- ---------- THEMA 'IT-Infrastruktur'

-- -- TABELLE 'komponente_katalog'
INSERT INTO `komponente_katalog` (`ID`, `Modellname`, `Details`, `Hersteller_ID`) VALUES
(1, '0815 Office Printer', 'Der isch richtig langsam und laut', '1'),

(2, 'RouterDerZweite', 'Nehme diese Signal und gebe dann weiter', '1'),
(3, 'SwitchMyMan', 'Mit Kabelsalat2000 Update vorinstalliert', '1'),

(4, 'Einfachster Arbeits-PC', 'Intel Core LoMiInRhue\r\n16 GB Google-Chrome Belastig', '1'),
(5, 'Klapapapa Tastatur', 'Tastatur mit extra Platz unter Tasten zur Dreckansammlung', '1'),
(6, 'Klicketiklick Maus', 'Wireless. \r\n Akku haltet 20 Minuten und muss dann mit 10cm Kabel geladen werden.', '1'),
(7, 'MyMonitor1000+', 'Der kann was was du nicht kannst.', '1');

-- -- TABELLE 'komponente_inventar'
INSERT INTO `komponente_inventar` (`ID`, `Typ`, `Seriennummer`, `Kaufdatum`, `Interne_Bezeichnung`, `Komponente_Katalog_ID`) VALUES
(1, 'Drucker', '11111111', '2019-03-25', 'DRUCKER_01', '1'),
(2, 'Drucker', '11111112', '2019-03-25', 'DRUCKER_02', '1'),
(3, 'Drucker', '11111113', '2019-03-25', 'DRUCKER_03', '1'),

(4, 'Netzwerk', '21111111', '2019-03-25', 'ROUTER_01', '2'),
(5, 'Netzwerk', '21111112', '2019-03-25', 'SWITCH_01', '3'),
(18, 'Netzwerk', '21111113', '2019-03-26', 'ROUTER_02', '2'),

(6, 'PC', '31111111', '2019-03-25', 'PC_01', '4'),
(7, 'PC', '31111112', '2019-03-25', 'PC_02', '4'),
(8, 'PC', '31111113', '2019-03-25', 'PC_03', '4'),

(9, 'Tastatur', '41111111', '2019-03-25', 'TASTA_01', '5'),
(10, 'Tastatur', '41111112', '2019-03-25', 'TASTA_02', '5'),
(11, 'Tastatur', '41111113', '2019-03-25', 'TASTA_03', '5'),

(12, 'Maus', '51111111', '2019-03-25', 'MAUS_01', '6'),
(13, 'Maus', '51111112', '2019-03-25', 'MAUS_02', '6'),
(14, 'Maus', '51111113', '2019-03-25', 'MAUS_03', '6'),

(15, 'Monitor', '61111111', '2019-03-25', 'MONITOR_01', '6'),
(16, 'Monitor', '61111112', '2019-03-25', 'MONITOR_02', '7'),
(17, 'Monitor', '61111113', '2019-03-25', 'MONITOR_03', '7');

-- -- TABELLE 'raum'
INSERT INTO `raum` (`ID`, `Drucker_Inventar_ID`) VALUES
('1', '2'), ('2', '3'), ('3', '1'), ('4', NULL);

-- -- TABELLE 'arbeitsplatz'
INSERT INTO `arbeitsplatz` (`ID`, `Raum_ID`, `Mitarbeiter_ID`, `PC_Komponente_ID`, `Tastatur_Komponente_ID`, `Maus_Komponente_ID`, `Monitor_Komponente_ID`) VALUES
(1, '1', '10', '6', '9', '12', '15'),
(2, '1', '8', '7', '10', '13', '16'),
(3, '3', '11', '8', '11', '14', '17');

-- -- TABELLE 'komponente_netzwerk'
INSERT INTO `komponente_netzwerk` (`ID`, `Typ`, `Raum_ID`) VALUES
('4', 'Router', '1'),
('5', 'Switch', '4'),
('18', 'Router', '3');

-- -- TABELLE 'ticket' + 'konversation' + 'nachricht' Eintrag 1
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(4, 'Ticket');

INSERT INTO `ticket` (`ID`, `Geloest`, `Komponente_Inventar_ID`, `Erfasser_ID`, `Bearbeiter_ID`, `Konversation_ID`) VALUES
(1, NULL, '1', '9', '11', '4');

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`, `Inhalt`) VALUES
(3, '9', '4', 'Der Drucker isch hinüber lan.');

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`,  `Inhalt`) VALUES
(4, '11', '4', 'Kanns net ersetzen kein Geld umen.');

-- -- TABELLE 'ticket' + 'konversation' + 'nachricht' Eintrag 2
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(5, 'Ticket');

INSERT INTO `ticket` (`ID`, `Geloest`, `Komponente_Inventar_ID`, `Erfasser_ID`, `Bearbeiter_ID`, `Konversation_ID`) VALUES
(2, '1', '7', '10', '11', '5');

INSERT INTO `nachricht` (`ID`, `Erfasser_ID`, `Konversation_ID`, `Inhalt`) VALUES
(5, '10', '5', 'Pls mach repariere diese.');

-- -- TABELLE 'ticket' + 'konversation' Eintrag 3
INSERT INTO `konversation` (`ID`, `Typ`) VALUES
(6, 'Ticket');

INSERT INTO `ticket` (`ID`, `Geloest`, `Komponente_Inventar_ID`, `Erfasser_ID`, `Bearbeiter_ID`, `Konversation_ID`) VALUES
(3, NULL, '16', '12', '11', '6');




-- ---------- THEMA 'Vorträge'

-- -- TABELLE 'vortrag'
INSERT INTO `vortrag` (`ID`, `Zeitpunkt`, `Thema`, `Raum`, `Hauptreferent_ID`, `Reihe_Vorgaenger_ID`) VALUES
('1', '2019-03-29 12:00:00', 'Tu was du net lassen kannsch', 'Sitzungszimmer EG03 im Shoppingcenter', '8', NULL),
('2', '2019-04-05 13:30:00', 'Tu was du net lassen sollsch', 'Sitzungszimmer EG33 im neben SC', '8', '1'),
('3', '2019-04-13 12:00:00', 'Was Hans niet lernt fallt selbscht hinein', 'Stage 3 Basel', '9', NULL);

-- -- TABELLE 'vortrag_hat_unterreferenten'
INSERT INTO `vortrag_hat_unterreferenten` (`Vortrag_ID`, `Unterreferent_ID`) VALUES
('2', '12'), ('2', '11'), ('2', '9');

-- -- TABELLE 'vortrag_hat_teilnehmer'
INSERT INTO `vortrag_hat_teilnehmer` (`Vortrag_ID`, `Kunde_ID`, `Personenanzahl`, `Weitere_Kontaktperson`) VALUES
('1', '6', '34', 'Samuela Labadaba\r\nGleiche Nummer wie Firma oder:\r\n+41 79 888 99 11'),
('2', '6', '12', 'Gleiche Nummer wie Firma odr jo'),
('2', '7', '45', 'Wollen kein Kontakt mit tu.');

-- ---------- THEMA 'Fahrzeuge'

-- -- TABELLE 'dienstfahrzeug'
INSERT INTO `dienstfahrzeug` (`ID`, `Modell`, `Kennzeichen`, `Hersteller`, `Versicherungsnummer`, `Leasingnummer`, `Versicherung_ID`, `Leasingfirma_ID`) VALUES
('1', 'Tesla S3', 'AG123456', 'Tesla Motos\r\n(Elon Muskatnus)', '11225588', '68224682', '4', '3'),
('2', 'Ford Focus', 'BL123456', 'Ford Automobile', '22332233', '1122820', '4', '3'),
('3', 'Punto', 'BS123456', 'Fiat', '4545851', '68224682', '4', '3');

-- -- TABELLE 'reparatur'
INSERT INTO `reparatur` (`ID`, `Datum`, `Werkstatt_ID`, `Dienstfahrzeug_ID`) VALUES
('1', '2019-03-27', '5', '3'),
('2', '2019-03-15', '5', '3'),
('3', '2019-02-03', '5', '3');

-- -- TABELLE 'problem'
INSERT INTO `problem` (`ID`, `Status`, `Beschreibung`, `Erfasser_ID`, `Dienstfahrzeug_ID`, `Bearbeitet_in_ID`) VALUES
('1', 'In Bearbearbeitung', 'Kofferraum schon wieder voll Sirup', '11', '3', '1'),
('2', 'Geschlossen', 'Kofferraum voll Sirup', '11', '3', '2'),
('3', 'Geschlossen', 'Blinker geht nicht', '9', '3', '2'),
('4', 'Geschlossen', 'Sieht nichts durch Fenster', '13', '3', '3'),
('5', 'Geschlossen', 'Ist verbrannt', '12', '3', '3');




-- ---------- THEMA 'Ressourcen'

-- -- TABELLE 'ressource'
INSERT INTO `ressource` (`ID`, `Typ`) VALUES
('1', 'Generalabo'), ('2', 'Generalabo'), ('3', 'Generalabo'), ('4', 'Generalabo'),
('5', 'Jahreskarte'), ('6', 'Jahreskarte'), ('7', 'Jahreskarte'), ('8', 'Jahreskarte');

-- -- TABELLE 'generalabo'
INSERT INTO `generalabo` (`Ressource_ID`, `Klasse`) VALUES
('1', '1. Klasse'),('2', '1. Klasse'),('3', '2. Klasse'),('4', '2. Klasse');

-- -- TABELLE 'jahreskarte'
INSERT INTO `jahreskarte` (`Ressource_ID`, `Rang`, `Sektor`, `Reihe`, `Sitzplatznummer`) VALUES
('5', '4', '4b', '18', '33'),
('6', '3', '4a', '12', '15'),
('7', '4', '2c', '8', '38'),
('8', '2', '1m', '5', '22');

-- -- TABELLE 'reservierung'
INSERT INTO `reservierung` (`ID`, `Datum`, `Begruendung`, `Ressource_ID`, `Mitarbeiter_ID`, `Kunde_ID`) VALUES
('1', '2019-03-26', 'Muss zum Kunden im Tessin, weil er da im Urlaub ist.', '1', '11', '6'),
('2', '2019-03-20', 'Gehe mit Kunden an Match damit der hier was kauft.', '5', '8', '7'),
('3', '2019-03-28', 'Ich will einfach so hin.', '6', '10', NULL);




-- ---------- THEMA 'Übrige'

-- -- TABELLE 'beratungsvertrag'
INSERT INTO `beratungsvertrag` (`ID`, `Startdatum`, `Enddatum`, `Beschreibung`, `Vertragsnummer`, `Kunde_ID`, `Folgeauftrag_von_ID`) VALUES
('1', '2019-02-01', '2019-02-28', 'Die wollten Hilfe Hilfe', '13', '6', NULL),
('2', '2019-02-01', '2019-02-28', 'Die wolten diese ebenso', '14', '7', NULL),
('3', '2019-03-01', '2019-03-31', 'Die haben diese verlängert odr', '15', '6', '1');

-- -- TABELLE 'abteilung'
INSERT INTO `abteilung` (`ID`, `Name`, `Abteilungsleiter_ID`, `Uebergeordnete_Abteilung_ID`) VALUES
('1', 'Abzocken', '8', NULL),
('2', 'Reiche Kunden', '9', '1'),
('3', 'Arme Kunden', '9', '1');

-- -- TABELLE 'mitarbeiter' ANPASSEN
UPDATE `mitarbeiter` SET `Abteilung_ID` = '3' WHERE `mitarbeiter`.`ID` = 8;
UPDATE `mitarbeiter` SET `Abteilung_ID` = '2' WHERE `mitarbeiter`.`ID` = 9;
UPDATE `mitarbeiter` SET `Abteilung_ID` = '3' WHERE `mitarbeiter`.`ID` = 10;
UPDATE `mitarbeiter` SET `Abteilung_ID` = '2' WHERE `mitarbeiter`.`ID` = 11;
UPDATE `mitarbeiter` SET `Abteilung_ID` = '3' WHERE `mitarbeiter`.`ID` = 12;
UPDATE `mitarbeiter` SET `Abteilung_ID` = '1' WHERE `mitarbeiter`.`ID` = 13;
