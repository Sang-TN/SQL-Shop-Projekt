--Kunden Alphabetisch nach Nachnamen sortierend (aufsteigend)

SELECT * FROM Kunden
ORDER by Nachname ASC;

--Alle Produkte von Lieferant 1 anzeigen

SELECT Name, Preis FROM Produkte
WHERE LieferantenID = 1;

--Alle Bestellungen von Kunde 1 anzeigen

SELECT BestellID, Bestelldatum
FROM Bestellungen
WHERE KundenID = 1;

--Gesamtwert einer Bestellung zusammenrechnen

SELECT sum (Menge * Einzelpreis) AS Gesamtwert
FROM Bestellpositionen
WHERE BestellID = 1;

--Liste aller bestellten Produkte inkl. Der Menge

SELECT Produkte.Name, Bestellpositionen.Menge
FROM Bestellpositionen
JOIN Produkte ON Bestellpositionen.ProduktID = Produkte.ProduktID;

--Liste der Kunden die Nicht bestellt haben

SELECT Kunden.Vorname, Kunden.Nachname
FROM Kunden
LEFT JOIN Bestellungen ON Kunden.KundenID = Bestellungen.KundenID
WHERE Bestellungen.BestellID IS NULL;