
-- -------------- INITIALISIERUNG 'trading_ag'
CREATE DATABASE IF NOT EXISTS trading_ag DEFAULT CHARACTER SET utf8;
USE trading_ag;


-- ---------- THEMA 'Personen'

-- -- TABELLE 'ortschaft'
CREATE TABLE IF NOT EXISTS ortschaft (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Ort                 VARCHAR(75) NOT NULL,
    Postleitzahl        VARCHAR(10) NOT NULL,

    PRIMARY KEY (ID)
);

-- -- TABELLE 'kontaktdaten'
CREATE TABLE IF NOT EXISTS kontaktdaten (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Email               VARCHAR(89) NOT NULL,
    Telefonnummer       VARCHAR(50) NOT NULL,
    Strasse             VARCHAR(60) NOT NULL,
    Nummer              VARCHAR(12) NOT NULL,
    Ortschaft_ID        INT NOT NULL,
    Typ                 ENUM('Mitarbeiter', 'Firma') NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Adresse_hat_Ortschaft FOREIGN KEY (Ortschaft_ID) REFERENCES Ortschaft(ID)
);

-- -- TABELLE 'firma'
CREATE TABLE IF NOT EXISTS firma (
    ID                  INT NOT NULL,
    Name                VARCHAR(255) NOT NULL,
    Ansprechsperson     MEDIUMTEXT NOT NULL,
    Webseite            VARCHAR(255),
    Typ                 ENUM('Hersteller', 'Lieferant', 'Kunde', 'Leasing', 'Versicherung', 'Werkstatt') NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Firma_hat_Kontaktdaten FOREIGN KEY (ID) REFERENCES kontaktdaten(ID)
);

-- -- TABELLE 'mitarbeiter'
CREATE TABLE IF NOT EXISTS mitarbeiter (
    ID                  INT NOT NULL,
    Vorname             VARCHAR(255) NOT NULL,
    Nachname            VARCHAR(255) NOT NULL,
    Benutzername        VARCHAR(255) NOT NULL,
    Passwort            VARCHAR(255) NOT NULL,
    Arbeitsvertrag      VARCHAR(12) NOT NULL,
    Vorgesetzter_ID     INT,

    PRIMARY KEY (ID),
    CONSTRAINT Mitarbeiter_hat_Kontaktdaten FOREIGN KEY (ID) REFERENCES kontaktdaten(ID),
    CONSTRAINT Mitarbeiter_hat_Vorgesetzten FOREIGN KEY (Vorgesetzter_ID) REFERENCES mitarbeiter(ID)
);

-- -- TABELLE 'gehalt'
CREATE TABLE IF NOT EXISTS gehalt (
    Mitarbeiter_ID      INT NOT NULL,
    Betrag              FLOAT NOT NULL,

    PRIMARY KEY (Mitarbeiter_ID),
    CONSTRAINT Gehalt_ist_von_Mitarbeiter FOREIGN KEY (Mitarbeiter_ID) REFERENCES mitarbeiter(ID)
);

-- ---------- THEMA 'Artikel'

-- -- TABELLE 'kategorie'
CREATE TABLE IF NOT EXISTS kategorie (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Name                VARCHAR(255) NOT NULL,
    Betreuer_ID         INT NOT NULL,
    Oberkategorie_ID    INT,

    PRIMARY KEY (ID),
    CONSTRAINT Kategorie_wird_betreut_von_Mitarbeiter FOREIGN KEY (Betreuer_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Kategorie_hat_Oberkategorie FOREIGN KEY (Oberkategorie_ID) REFERENCES kategorie(ID)
);

-- -- TABELLE 'artikel'
CREATE TABLE IF NOT EXISTS artikel (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Name                VARCHAR(255) NOT NULL,
    Beschreibung        MEDIUMTEXT NOT NULL,
    Einkaufspreis       FLOAT NOT NULL,
    Verkaufspreis       FLOAT NOT NULL,
    Lagerbestand        INT,
    Hersteller_ID       INT NOT NULL,
    Lieferant_ID        INT NOT NULL,
    Kategorie_ID        INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Artikel_hat_Hersteller FOREIGN KEY (Hersteller_ID) REFERENCES firma(ID),
    CONSTRAINT Artikel_kommt_von_Lieferant FOREIGN KEY (Lieferant_ID) REFERENCES firma(ID),
    CONSTRAINT Artikel_hat_Kategorie FOREIGN KEY (Kategorie_ID) REFERENCES kategorie(ID)
);

-- -- TABELLE 'artikel_hat_zubehoer'
CREATE TABLE IF NOT EXISTS artikel_hat_zubehoer (
    Artikel_ID          INT NOT NULL,
    Zubehoer_ID         INT NOT NULL,

    PRIMARY KEY (Artikel_ID, Zubehoer_ID),
    CONSTRAINT Artikel_hat_Zubehoer FOREIGN KEY (Artikel_ID) REFERENCES artikel(ID),
    CONSTRAINT Zubehoer_ist_von_Artikel FOREIGN KEY (Zubehoer_ID) REFERENCES artikel(ID)
);

-- ---------- THEMA 'Dialoge / Konversation'

-- -- TABELLE 'konversation'
CREATE TABLE IF NOT EXISTS konversation (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Typ                 ENUM('Ticket', 'Beanstandung') NOT NULL,

    PRIMARY KEY (ID)
);

-- -- TABELLE 'nachricht'
CREATE TABLE IF NOT EXISTS nachricht (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Erfasser_ID         INT NOT NULL,
    Konversation_ID     INT NOT NULL,
    Zeitpunkt           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Inhalt              MEDIUMTEXT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Nachricht_hat_Erfasser FOREIGN KEY (Erfasser_ID) REFERENCES kontaktdaten(ID),
    CONSTRAINT Nachricht_ist_von_Konversation FOREIGN KEY (Konversation_ID) REFERENCES konversation(ID)
);

-- ---------- THEMA 'Bestellungen'

-- -- TABELLE 'bestellung'
CREATE TABLE IF NOT EXISTS bestellung (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Bestellnummer       INT NOT NULL,
    Bestelldatum        DATE NOT NULL,
    Lieferdatum         DATE,
    Bearbeiter_ID       INT NOT NULL,

    UNIQUE INDEX UNIQUE_Bestellnummer (Bestellnummer),

    PRIMARY KEY (ID),
    CONSTRAINT Bestellung_hat_Bearbeiter FOREIGN KEY (Bearbeiter_ID) REFERENCES mitarbeiter(ID)
);

-- -- TABELLE 'bestellung_hat_artikel'
CREATE TABLE IF NOT EXISTS bestellung_hat_artikel (
    Artikel_ID          INT NOT NULL,
    Bestellung_ID       INT NOT NULL,
    Anzahl              INT NOT NULL,
    PRIMARY KEY (Artikel_ID, Bestellung_ID),
    CONSTRAINT Artikel_ist_in_Bestellung FOREIGN KEY (Artikel_ID) REFERENCES artikel(ID),
    CONSTRAINT Bestellung_hat_Artikel FOREIGN KEY (Bestellung_ID) REFERENCES bestellung(ID)
);

-- -- TABELLE 'beanstandung'
CREATE TABLE IF NOT EXISTS beanstandung (
    ID                    INT NOT NULL AUTO_INCREMENT,
    Beschreibung          MEDIUMTEXT NOT NULL,
    Bestellung_ID         INT NOT NULL,
    Bestellung_Artikel_ID INT NOT NULL,
    Konversation_ID       INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Bestellung_hat_Beanstandung FOREIGN KEY (Bestellung_ID) REFERENCES bestellung_hat_artikel(Bestellung_ID),
    CONSTRAINT Artikel_hat_Beanstandung FOREIGN KEY (Bestellung_Artikel_ID) REFERENCES bestellung_hat_artikel(Artikel_ID),
    CONSTRAINT Beanstandung_hat_Konversation FOREIGN KEY (Konversation_ID) REFERENCES konversation(ID)
);

-- ---------- THEMA 'IT-Infrastruktur'

-- -- TABELLE 'komponente_katalog'
CREATE TABLE IF NOT EXISTS komponente_katalog (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Modellname          VARCHAR(255) NOT NULL,
    Details             MEDIUMTEXT NOT NULL,
    Hersteller_ID       INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Komponente_hat_Hersteller FOREIGN KEY (Hersteller_ID) REFERENCES firma(ID)
);

-- -- TABELLE 'komponente_inventar'
CREATE TABLE IF NOT EXISTS komponente_inventar (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Interne_Bezeichnung VARCHAR(20) NOT NULL,
    Komponente_Katalog_ID INT NOT NULL,
    Seriennummer        INT NOT NULL,
    Kaufdatum           DATE NOT NULL,
    Typ                 ENUM('Netzwerk', 'Drucker', 'PC', 'Tastatur', 'Maus', 'Monitor') NOT NULL,

    UNIQUE INDEX UNIQUE_Seriennummer (Seriennummer),
    UNIQUE INDEX UNIQUE_Interne_Bezeichnung (Interne_Bezeichnung),

    PRIMARY KEY (ID),
    CONSTRAINT Komponente_ist_von_Katalog FOREIGN KEY (Komponente_Katalog_ID) REFERENCES komponente_katalog(ID)
);

-- -- TABELLE 'raum'
CREATE TABLE IF NOT EXISTS raum (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Drucker_Inventar_ID INT,

    PRIMARY KEY (ID),
    CONSTRAINT Raum_hat_Drucker FOREIGN KEY (Drucker_Inventar_ID) REFERENCES komponente_inventar(ID)
);

-- -- TABELLE 'arbeitsplatz'
CREATE TABLE IF NOT EXISTS arbeitsplatz (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Raum_ID             INT NOT NULL,
    Mitarbeiter_ID      INT,
    PC_Komponente_ID    INT NOT NULL,
    Tastatur_Komponente_ID INT NOT NULL,
    Maus_Komponente_ID  INT NOT NULL,
    Monitor_Komponente_ID INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Arbeitsplatz_is_in_Raum FOREIGN KEY (Raum_ID) REFERENCES raum(ID),
    CONSTRAINT Arbeitsplatz_hat_Mitarbeiter FOREIGN KEY (Mitarbeiter_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Arbeitsplatz_hat_PC FOREIGN KEY (PC_Komponente_ID) REFERENCES komponente_inventar(ID),
    CONSTRAINT Arbeitsplatz_hat_Tastatur FOREIGN KEY (Tastatur_Komponente_ID) REFERENCES komponente_inventar(ID),
    CONSTRAINT Arbeitsplatz_hat_Maus FOREIGN KEY (Maus_Komponente_ID) REFERENCES komponente_inventar(ID),
    CONSTRAINT Arbeitsplatz_hat_Monitor FOREIGN KEY (Monitor_Komponente_ID) REFERENCES komponente_inventar(ID)
);

-- -- TABELLE 'komponente_netzwerk'
CREATE TABLE IF NOT EXISTS komponente_netzwerk (
    ID                  INT NOT NULL,
    Typ                 ENUM('Router', 'Switch') NOT NULL,
    Raum_ID             INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Netzwerk_hat_Inventar_Komponente FOREIGN KEY (ID) REFERENCES komponente_inventar(ID),
    CONSTRAINT Netzwerk_Komponente_ist_in_Raum FOREIGN KEY (Raum_ID) REFERENCES raum(ID)
);

-- -- TABELLE 'ticket'
CREATE TABLE IF NOT EXISTS ticket (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Zeitpunkt           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Geloest             BOOLEAN,
    Komponente_Inventar_ID INT NOT NULL,
    Erfasser_ID         INT NOT NULL,
    Bearbeiter_ID       INT NOT NULL,
    Konversation_ID     INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Ticket_ist_zu_Komponente FOREIGN KEY (Komponente_Inventar_ID) REFERENCES komponente_inventar(ID),
    CONSTRAINT Ticket_kommt_von_Mitarbeiter FOREIGN KEY (Erfasser_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Ticket_wird_bearbeitet_von_Mitarbeiter FOREIGN KEY (Bearbeiter_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Ticket_hat_Konversation FOREIGN KEY (Konversation_ID) REFERENCES konversation(ID)
);

-- ---------- THEMA 'Vorträge'

-- -- TABELLE 'vortrag'
CREATE TABLE IF NOT EXISTS vortrag (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Zeitpunkt           DATETIME NOT NULL,
    Thema               VARCHAR(255) NOT NULL,
    Raum                VARCHAR(255) NOT NULL,
    Hauptreferent_ID    INT NOT NULL,
    Reihe_Vorgaenger_ID INT,

    PRIMARY KEY (ID),
    CONSTRAINT Vortrag_hat_Hauptreferent FOREIGN KEY (Hauptreferent_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Vortrag_hat_Vorgaenger FOREIGN KEY (Reihe_Vorgaenger_ID) REFERENCES vortrag(ID)
);

-- -- TABELLE 'vortrag_hat_unterreferenten'
CREATE TABLE IF NOT EXISTS vortrag_hat_unterreferenten (
    Vortrag_ID          INT NOT NULL,
    Unterreferent_ID    INT NOT NULL,

    PRIMARY KEY (Vortrag_ID, Unterreferent_ID),
    CONSTRAINT Vortrag_hat_Unterreferenten FOREIGN KEY (Vortrag_ID) REFERENCES vortrag(ID),
    CONSTRAINT Unterreferent_ist_von_Vortrag FOREIGN KEY (Unterreferent_ID) REFERENCES mitarbeiter(ID)
);

-- -- TABELLE 'vortrag_hat_teilnehmer'
CREATE TABLE IF NOT EXISTS vortrag_hat_teilnehmer (
    Vortrag_ID          INT NOT NULL,
    Kunde_ID            INT NOT NULL,
    Personenanzahl      INT NOT NULL,
    Weitere_Kontaktperson MEDIUMTEXT,

    PRIMARY KEY (Vortrag_ID, Kunde_ID),
    CONSTRAINT Vortrag_hat_Besucher FOREIGN KEY (Vortrag_ID) REFERENCES vortrag(ID),
    CONSTRAINT Kunde_ist_Besucher FOREIGN KEY (Kunde_ID) REFERENCES firma(ID)
);

-- ---------- THEMA 'Fahrzeuge'

-- -- TABELLE 'dienstfahrzeug'
CREATE TABLE IF NOT EXISTS dienstfahrzeug (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Modell              VARCHAR(255) NOT NULL,
    Kennzeichen         VARCHAR(20) NOT NULL,
    Hersteller          MEDIUMTEXT NOT NULL,
    Versicherungsnummer INT NOT NULL,
    Leasingnummer       INT NOT NULL,
    Versicherung_ID     INT NOT NULL,
    Leasingfirma_ID     INT NOT NULL,

    UNIQUE INDEX UNIQUE_Kennzeichen (Kennzeichen),

    PRIMARY KEY (ID),
    CONSTRAINT Fahrzeug_hat_Versicherung FOREIGN KEY (Versicherung_ID) REFERENCES firma(ID),
    CONSTRAINT Fahrzeug_hat_Leasing FOREIGN KEY (Leasingfirma_ID) REFERENCES firma(ID)
);

-- -- TABELLE 'reparatur'
CREATE TABLE IF NOT EXISTS reparatur (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Datum               DATE NOT NULL,
    Werkstatt_ID        INT NOT NULL,
    Dienstfahrzeug_ID   INT NOT NULL,

    PRIMARY KEY (ID),
    CONSTRAINT Reparatur_in_Werkstatt FOREIGN KEY (Werkstatt_ID) REFERENCES firma(ID),
    CONSTRAINT Reparatur_an_Fahrzeug FOREIGN KEY (Dienstfahrzeug_ID) REFERENCES dienstfahrzeug(ID)
);

-- -- TABELLE 'problem'
CREATE TABLE IF NOT EXISTS problem (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Status              ENUM('Offen', 'In Bearbearbeitung', 'Geschlossen') NOT NULL,
    Beschreibung        MEDIUMTEXT NOT NULL,
    Erfasser_ID         INT NOT NULL,
    Dienstfahrzeug_ID   INT NOT NULL,
    Bearbeitet_in_ID    INT,

    PRIMARY KEY (ID),
    CONSTRAINT Problem_durch_Mitarbeiter FOREIGN KEY (Erfasser_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Problem_an_Fahrzeug FOREIGN KEY (Dienstfahrzeug_ID) REFERENCES dienstfahrzeug(ID),
    CONSTRAINT Problem_bearbeitet_in_Reparatur FOREIGN KEY (Bearbeitet_in_ID) REFERENCES reparatur(ID)
);





-- ---------- THEMA 'Ressourcen'

-- -- TABELLE 'ressource'
CREATE TABLE IF NOT EXISTS ressource (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Typ                 ENUM('Generalabo', 'Jahreskarte') NOT NULL,

    PRIMARY KEY (ID)
);

-- -- TABELLE 'generalabo'
CREATE TABLE IF NOT EXISTS generalabo (
    Ressource_ID        INT NOT NULL,
    Klasse              ENUM('1. Klasse', '2. Klasse') NOT NULL,

    PRIMARY KEY (Ressource_ID),
    CONSTRAINT Abo_ist_Ressource FOREIGN KEY (Ressource_ID) REFERENCES ressource(ID)
);

-- -- TABELLE 'jahreskarte'
CREATE TABLE IF NOT EXISTS jahreskarte (
    Ressource_ID        INT NOT NULL,
    Rang                INT NOT NULL,
    Sektor              VARCHAR(10) NOT NULL,
    Reihe               INT NOT NULL,
    Sitzplatznummer     INT NOT NULL,

    PRIMARY KEY (Ressource_ID),
    CONSTRAINT Karte_ist_Ressource FOREIGN KEY (Ressource_ID) REFERENCES ressource(ID)
);

-- -- TABELLE 'reservierung'
CREATE TABLE IF NOT EXISTS reservierung (
    ID                  INT NOT NULL,
    Datum               DATE NOT NULL,
    Begruendung         MEDIUMTEXT NOT NULL,
    Ressource_ID        INT NOT NULL,
    Mitarbeiter_ID      INT NOT NULL,
    Kunde_ID            INT,

    PRIMARY KEY (ID),
    CONSTRAINT Reservierung_hat_Ressource FOREIGN KEY (Ressource_ID) REFERENCES ressource(ID),
    CONSTRAINT Reserviert_von_Mitarbeiter FOREIGN KEY (Mitarbeiter_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Reserviert_zwecks_Kunde FOREIGN KEY (Kunde_ID) REFERENCES firma(ID)
);




-- ---------- THEMA 'Übrige'

-- -- TABELLE 'beratungsvertrag'
CREATE TABLE IF NOT EXISTS beratungsvertrag (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Startdatum          DATE NOT NULL,
    Enddatum            DATE NOT NULL,
    Beschreibung        MEDIUMTEXT NOT NULL,
    Vertragsnummer      INT NOT NULL,
    Kunde_ID            INT NOT NULL,
    Folgeauftrag_von_ID INT,

    UNIQUE INDEX UNIQUE_Vertragsnummer (Vertragsnummer),

    PRIMARY KEY (ID),
    CONSTRAINT Vertrag_hat_Kunde FOREIGN KEY (Kunde_ID) REFERENCES firma(ID),
    CONSTRAINT Vertrag_kommt_von_Vertrag FOREIGN KEY (Folgeauftrag_von_ID) REFERENCES beratungsvertrag(ID)
);

-- -- TABELLE 'abteilung'
CREATE TABLE IF NOT EXISTS abteilung (
    ID                  INT NOT NULL AUTO_INCREMENT,
    Name                VARCHAR(255) NOT NULL,
    Abteilungsleiter_ID INT NOT NULL,
    Uebergeordnete_Abteilung_ID INT,

    PRIMARY KEY (ID),
    CONSTRAINT Mitarbeiter_leitet_Abteilung FOREIGN KEY (Abteilungsleiter_ID) REFERENCES mitarbeiter(ID),
    CONSTRAINT Abteilung_untersteht_Abteilung FOREIGN KEY (Uebergeordnete_Abteilung_ID) REFERENCES abteilung(ID)
);

-- -- TABELLE 'mitarbeiter' ANPASSEN
ALTER TABLE mitarbeiter ADD Abteilung_ID INT;
ALTER TABLE mitarbeiter ADD CONSTRAINT Mitarbeiter_in_Abteilung FOREIGN KEY (Abteilung_ID) REFERENCES abteilung(ID);
