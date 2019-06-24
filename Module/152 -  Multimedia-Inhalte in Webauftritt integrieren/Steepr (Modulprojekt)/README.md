
# Steepr
Elia Reutlinger & Valentino Rusconi

### Inhaltsverzeichnis

1. Allgemeine Informationen
2. Inhalt des Projektes
3. Umsetzung der Anforderung
4. Erstellung von Multimedia-Inhalten (C1 & C2)
5. Upload-Funktionen/Formular (C2 & B3 & C3)
6. Responsiveness (C3 & B4)
7. Startseite & Suchfunktion (C4)
8. Coding Standards & Validierung (Umsetzung A&B)
9. Testing (Umsetzung C)

## 1. Allgemeine Informationen

### Anwendung Lokal nutzen/installieren
Voraussetungen: 
- Apache Server (PHP7+)
- MySQL Server
(Alles enthalten in neuster XAMPP Version)

Installation:
1. Alle Dateien auf ins Root-Verzeichnis des Servers laden.
2. Datenbank-Parameter anpassen: `include/database/properties.php` -> Datenbank nicht manuell erstellen!
3. Anwendung im Browser aufrufen und bis zu 30 Sekunden warten (Die Datenbank setzt sich automatisch auf).
4. Seite neu laden.

--> Falls die Initialisierung der Datenbank fehlschlägt: Manuell erstellen und `include/database/db_steepr.sql` importieren.

### Online-Demo
Auf [steepr.eliareutlinger.ch](https://steepr.eliareutlinger.ch/) befindet sich eine online-Demo mit einigen Inhalten. Damit kann man z.B. die Such- und Filterfunktionen testen oder ebenfalls Bilder hochladen. 

## 2. Inhalt des Projektes
Das Projekt soll eine Anwendung ergeben, durch welche Nutzer ihre Bilder anonym und in einem späteren Schritt (Modul 183) auch mit einem Benutzerkonto hochladen können. Die Bilder stehen dann öffentlich zur Verfügung. Durch unterschiedliche Tags und einem Titel, welche dem Bild zugeordnet werden können, kann man nach Bildern suchen.

Ein Bild kann heruntergeladen werden, wobei eine Funktion zur Auswahl der Auflösung besteht. Um dem Datenschutz konform zu sein wird auch eine Kontaktmöglichkeit verbaut, falls ein Benutzer ein unangemessenes Bild findet.

## 3. Umsetzung der Anforderung
Für das Projekt wird PHP und JavaScript verwendet. Unter einbindung unterschiedlicher Libraries kann so eine Entwicklungsumgebung geschaffen werden, welche alle Anforderungen verarbeiten kann.

## 4. Erstellung von Multimedia-Inhalten
Die Bilder & Gifs, welche von Benutzern hochgeladen werden können, werden von diesen selbst erstellt. Dies kann per Mobiltelefon-Kamera oder mit einer professionellen Systemkamera geschehen.

Dabei wird die Dateigrösse sehr grosszügig gewählt, da Fotos mit hoher Auflösung auch eine hohe Datenmenge anfordern. Dies sollte jedoch für die Performance der Anwendung kein Problem darstellen, da für die Suchfunktion angepasste Thumbnails verwendet werden, welche beim Upload auf dem Server generiert werden.

Wir beschränken uns zur Übersicht auf folgende Datei-Typen bzw. Datei-Endungen: .jpg, .png, .gif

## 5. Upload-Funktionen/Formular
Für den Upload soll eine eigene Seite bestehen, auf welcher sich das entsprechende Formular befindet. Das Formular soll den Nutzer nach einem Bild-Titel, sowie einer Beschreibung (optional) und den zugehörigen Tags (optional) fragen. Der Upload selbst prüft die Datei (Client&Server-Seitig) auf die Dateiendung und Grösse.

Die Benutzereingaben sollen Client- und Serverseitig auf ihre Korrektheit überprüft werden. Anschliessend werden per Library auf dem Server ein Thumbnail-Format des Bildes für die Suche sowie eines für die Darstellung im Overlay erstellt. Diese Formate können anschliessend abhängig vom Gerät des Nutzers eingesetzt werden, um die Suchfunktion optimal zu gestalten.

Wir legen uns auf folgende Formate fest:

**Vollformat (Original)**

- Bild wie hochgeladen (komplett unverändert).
- Soll dem Benutzer zum Download zur Verfügung stehen

**Preview**

- Breite: 800px
- Höhe: Automatisch
- Format: JPG
- Qualität: 80%
- Für Desktops in der Suche und Vorschau
- Für Smartphones in der Vorschau

**Thumbnail**

- Breite: 300px
- Höhe: Automatisch
- Format: JPG
- Qualität: 40%
- Für Smartphones in der Suche



## 6. Responsiveness
Die Anwendung soll auf mobilen Geräten genauso funktionieren wie auf einem Desktop-PC. Um dies zu garantieren Nutzen wir das gängige CSS-Framework Bootstrap, welches uns dank vorkonfigurierter Funktionen die Entwicklung erleichtert. Zusätzlich sollen die Bilder wie zuvor erwähnt ein angepasstes Thumbnail für mobile Browser erhalten, damit die Performance und die Ladezeiten auch per Mobilnetz ausreichend sind.

## 7. Startseite & Suchfunktion
Die Startseite ist die zweite von insgesamt 2 Seiten, welche zur Anwendung gehören (Upload & Startseite). Auf der Startseite werden standartmässig die neusten 20 Bilder angezeigt, wobei sich im oberen Bereich der Benutzeroberfläche eine Suchfunktion sowie eine Filterfunktion befindet. Dadurch kann der Benutzer die hochgeladenen Bilder nach ihren Tags und Titeln durchsuchen und nach Upload-Datum, Anzahl Aufrufen oder Bewertung sortieren.

Wenn der Nutzer auf ein Bild klickt, öffnet sich dieses in einem Overlay (Bootstrap Modal). Dort befindet sich anschliesssend das generierte Bild für die optimierte Darstellung im Overlay, sowie die Bewertungsfunktion und unterschiedliche Download-Buttons, sortiert nach Auflösungen. Wenn der Benutzer ein Bild herunterlädt, wird dieses in diesem Moment auf dem Server auf die gewählte Grösse zugeschnitten und an den Benutzer zum Download gesendet.

## 8. Coding Standards & Validierung
Um eine gute Benutzererfahrung sowie reibungslosen und Normen Code zu übermitteln, werden alle HTML und CSS Teile durch den W3C Markup Validation Service erfolgreich validiert.

Im Anschluss an die Arbeit wird der gesamte Code nochmals reviewt wobei Coding-Standards sowie Kommentare nachgetragen/optimiert werden.

## 9. Testing
Siehe Datei `docs/Testkonzept.docx`
