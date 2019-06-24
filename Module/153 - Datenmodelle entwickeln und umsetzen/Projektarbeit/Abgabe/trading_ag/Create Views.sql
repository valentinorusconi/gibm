
-- -- VIEW 'view_abteilungsleiter'
CREATE VIEW view_abteilungsleiter AS
    SELECT
        abt.Name AS 'Abteilungsname',
        CONCAT(mit.Vorname," ",mit.Nachname, " (",mit.Benutzername,")") AS 'Abteilungsleiter',
        CONCAT(kon.Strasse," ", kon.Nummer) AS 'Anschrift',
        CONCAT(ort.Postleitzahl," ", ort.Ort) AS 'Ort',
        geh.Betrag AS 'Gehalt'
    FROM abteilung AS abt
    INNER JOIN mitarbeiter AS mit ON mit.ID = abt.Abteilungsleiter_ID
    INNER JOIN kontaktdaten AS kon ON mit.ID = kon.ID
    INNER JOIN ortschaft AS ort ON kon.Ortschaft_ID = ort.ID
    INNER JOIN gehalt AS geh ON geh.Mitarbeiter_ID = mit.ID;


-- -- VIEW 'view_itprobleme'
CREATE VIEW view_itprobleme AS

    SELECT
        inv.Interne_Bezeichnung AS 'Interne_Bezeichnung',
        inv.Typ AS 'Geraeteart',
        kat.Modellname AS 'Modell',
        her.Name AS 'Hersteller',
        CONCAT(mit.Vorname," ", mit.Nachname) AS 'Erfasser',
        (
            SELECT nac.Inhalt from nachricht AS nac
            WHERE nac.Konversation_ID = kon.ID LIMIT 1
        ) AS 'Initiale Nachricht',

        IFNULL(
            (
                SELECT arb.Raum_ID from arbeitsplatz AS arb
                WHERE arb.PC_Komponente_ID = inv.ID OR
                arb.Tastatur_Komponente_ID = inv.ID OR
                arb.Maus_Komponente_ID = inv.ID OR
                arb.Monitor_Komponente_ID = inv.ID
            ), IFNULL(
                (
                    SELECT net.Raum_ID from komponente_netzwerk AS net
                    WHERE net.ID = inv.ID
                ), IFNULL(
                    (
                        SELECT dru.ID from raum AS dru
                        WHERE dru.Drucker_Inventar_ID = inv.ID
                    ), 'Kein Raum gefunden'
                )
            )
        ) AS 'Raum'

    FROM ticket AS tic
    INNER JOIN komponente_inventar AS inv ON inv.ID = tic.Komponente_Inventar_ID
    INNER JOIN komponente_katalog AS kat ON inv.Komponente_Katalog_ID = kat.ID
    INNER JOIN firma AS her ON kat.Hersteller_ID = her.ID
    INNER JOIN mitarbeiter AS mit ON tic.Erfasser_ID = mit.ID
    INNER JOIN konversation AS kon ON tic.Konversation_ID = kon.ID

    WHERE tic.Geloest IS NULL;



-- -- VIEW 'view_arbeitsplatz'
CREATE VIEW view_arbeitsplatz AS

    SELECT
        arb.ID AS 'Arbeitsplatz',

        CONCAT(
            'Gereateart: ', invpc.Typ, CHAR(13),
            'Bezeichnung: ', invpc.Interne_Bezeichnung, CHAR(13),
            'Modell: ', katpc.Modellname, CHAR(13),
            'Hersteller: ', firpc.Name, CHAR(13)
        ) AS 'PC',

        CONCAT(
            'Gereateart: ', invta.Typ, CHAR(13),
            'Bezeichnung: ', invta.Interne_Bezeichnung, CHAR(13),
            'Modell: ', katta.Modellname, CHAR(13),
            'Hersteller: ', firta.Name, CHAR(13)
        ) AS 'Tastatur',

        CONCAT(
            'Gereateart: ', invma.Typ, CHAR(13),
            'Bezeichnung: ', invma.Interne_Bezeichnung, CHAR(13),
            'Modell: ', katma.Modellname, CHAR(13),
            'Hersteller: ', firma.Name, CHAR(13)
        ) AS 'Maus',

        CONCAT(
            'Gereateart: ', invmo.Typ, CHAR(13),
            'Bezeichnung: ', invmo.Interne_Bezeichnung, CHAR(13),
            'Modell: ', katmo.Modellname, CHAR(13),
            'Hersteller: ', firmo.Name, CHAR(13)
        ) AS 'Monitor'

    FROM arbeitsplatz AS arb

    INNER JOIN komponente_inventar AS invpc ON invpc.ID = arb.PC_Komponente_ID
    INNER JOIN komponente_inventar AS invta ON invta.ID = arb.Tastatur_Komponente_ID
    INNER JOIN komponente_inventar AS invma ON invma.ID = arb.Maus_Komponente_ID
    INNER JOIN komponente_inventar AS invmo ON invmo.ID = arb.Monitor_Komponente_ID
    INNER JOIN komponente_katalog AS katpc ON invpc.Komponente_Katalog_ID = katpc.ID
    INNER JOIN komponente_katalog AS katta ON invta.Komponente_Katalog_ID = katta.ID
    INNER JOIN komponente_katalog AS katma ON invma.Komponente_Katalog_ID = katma.ID
    INNER JOIN komponente_katalog AS katmo ON invmo.Komponente_Katalog_ID = katmo.ID
    INNER JOIN firma AS firpc ON katpc.Hersteller_ID = firpc.ID
    INNER JOIN firma AS firta ON katta.Hersteller_ID = firta.ID
    INNER JOIN firma AS firma ON katma.Hersteller_ID = firma.ID
    INNER JOIN firma AS firmo ON katmo.Hersteller_ID = firmo.ID;


-- -- VIEW 'view_artikel'
CREATE VIEW view_artikel AS
    SELECT
        art.Name AS 'Artikelname',
        kat.Name AS 'Kategorie',
        fir.Name AS 'Lieferant',
        COUNT(zub.Zubehoer_ID) AS 'Zubehoer'
    FROM artikel AS art

    INNER JOIN kategorie AS kat ON art.Kategorie_ID = kat.ID
    INNER JOIN firma AS fir ON art.Lieferant_ID = fir.ID
    LEFT JOIN artikel_hat_zubehoer AS zub ON art.ID = zub.Artikel_ID
    GROUP BY art.Name;

-- -- VIEW 'view_vortraege'
CREATE VIEW view_vortraege AS

    SELECT

        vor.Thema AS 'Thema',
        vor.Zeitpunkt AS 'Datum_Uhrzeit',
        CONCAT(ref.Vorname, ' ', ref.Nachname) AS 'Hauptreferent',
        SUM(tei.Personenanzahl) AS 'Teilnehmer',

        (
            SELECT vorg.Thema FROM vortrag AS vorg WHERE vorg.Reihe_Vorgaenger_ID = vor.ID
        ) AS 'Nachfolger',

        (
            SELECT vorn.Thema FROM vortrag AS vorn WHERE vorn.ID = vor.Reihe_Vorgaenger_ID
        ) AS 'Vorgaenger'

    FROM vortrag AS vor

    INNER JOIN mitarbeiter AS ref ON vor.Hauptreferent_ID = ref.ID
    LEFT JOIN vortrag_hat_teilnehmer AS tei ON tei.Vortrag_ID = vor.ID
    GROUP BY vor.ID;

-- -- VIEW 'view_reservationen'
CREATE VIEW view_reservationen AS
    SELECT

        ress.Typ AS 'Ressource',
        CONCAT(mit.Vorname, ' ', mit.Nachname) AS 'Mitarbeiter',
        fir.Name AS 'Kunde',
        rese.Datum AS 'Datum',
        abo.Rang AS 'Rang',
        abo.Sektor AS 'Sektor',
        abo.Reihe AS 'Reihe',
        abo.Sitzplatznummer AS 'Sitzplatznummer'

    FROM reservierung AS rese

    INNER JOIN ressource AS ress ON rese.Ressource_ID = ress.ID
    INNER JOIN mitarbeiter AS mit ON rese.Mitarbeiter_ID = mit.ID
    INNER JOIN firma AS fir ON rese.Kunde_ID = fir.ID
    INNER JOIN jahreskarte AS abo ON ress.ID = abo.Ressource_ID

    WHERE ress.Typ = 'Jahreskarte' AND
    rese.Kunde_ID IS NOT NULL;

-- -- VIEW 'view_fahrzeugstatus'
CREATE VIEW view_fahrzeugstatus AS
    SELECT

        fah.Modell AS 'Modell',
        fah.Kennzeichen AS 'Kennzeichen',
        fir.name AS 'Versicherung',
        (
            SELECT COUNT(pro.ID) from problem AS pro
            WHERE pro.Status != 'Geschlossen' AND
            pro.Dienstfahrzeug_ID = fah.ID
        ) AS 'Probleme',
        COUNT(rep.ID) AS 'Reparaturen'

    FROM dienstfahrzeug AS fah
    LEFT JOIN reparatur as rep ON rep.Dienstfahrzeug_ID = fah.ID
    INNER JOIN firma as fir ON fir.ID = fah.Versicherung_ID
    GROUP BY fah.ID;

-- -- VIEW 'view_beanstandungen'
CREATE VIEW view_beanstandungen AS
    SELECT

        art.Name AS 'Artikel',
        bea.Beschreibung AS 'Beschreibung',
        fir.Name AS 'Hersteller',
        kon.Telefonnummer AS 'Telefon'

    FROM beanstandung AS bea
    INNER JOIN artikel AS art ON art.ID = bea.Bestellung_Artikel_ID
    INNER JOIN firma AS fir ON fir.ID = art.Hersteller_ID
    LEFT JOIN kontaktdaten AS kon ON fir.ID = kon.ID;

-- -- VIEW 'view_abteilungsmitarbeiter'
CREATE VIEW view_abteilungsmitarbeiter AS
    SELECT

        abt.Name AS 'Abteilung',
        CONCAT(abtleit.Vorname, ' ', abtleit.Nachname) AS 'Abteilungsleiter',
        COUNT(mit.ID) AS 'Mitarbeiter',
        (
            SELECT uabt.Name FROM abteilung AS uabt WHERE uabt.ID = abt.Uebergeordnete_Abteilung_ID
        ) AS 'Uebergeordnete_Abteilung'

    FROM abteilung AS abt
    INNER JOIN mitarbeiter AS abtleit ON abtleit.ID = abt.Abteilungsleiter_ID
    LEFT JOIN mitarbeiter AS mit ON mit.Abteilung_ID = abt.ID
    GROUP BY abt.ID;
