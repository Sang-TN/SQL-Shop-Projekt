-- Aufgaben: SQL-Shop Erweiterung--

-- A1 --
-- Gebe folgende Informationen als Datensätze aus: Bestellnummer, Kundenname, Bestelldatum --
SELECT Bestellungen.BestellID, Kunden.Nachname, Bestellungen.Bestelldatum
FROM Bestellungen
JOIN Kunden ON Bestellungen.KundenID = Kunden.KundenID;

-- A2 --
-- Gebe folgende Informationen als Datensätze aus: Kundenname, Produktbezeichnung, Menge, Bestellnummer --
SELECT Kunden.Nachname, Produkte.Name, Bestellpositionen.Menge, Bestellungen.BestellID
FROM Kunden
JOIN Bestellungen ON Kunden.KundenID = Bestellungen.KundenID
JOIN Bestellpositionen ON Bestellungen.BestellID = Bestellpositionen.BestellID
JOIN Produkte ON Bestellpositionen.ProduktID = Produkte.ProduktID;

-- B1 --
-- Gebe folgende Informationen als Datensätze aus: Produktname, Preis, Lieferantenname --
SELECT Produkte.Name, Produkte.Preis, Lieferanten.Firmenname AS Lieferant
FROM Produkte
JOIN Lieferanten ON Produkte.LieferantenID = Lieferanten.LieferantenID;

-- B2 --
-- Gebe alle Bestellungen von Kunden aus der Stadt „Mainz“ aus. Kundenname, Stadt, Bestellnummer, Bestelldatum --
SELECT Kunden.Nachname, Kunden.Stadt, Bestellungen.BestellID, Bestellungen.Bestelldatum
FROM Kunden
JOIN Bestellungen ON Kunden.KundenID = Bestellungen.KundenID
WHERE Kunden.Stadt = 'Mainz';

-- C1 --
-- Berechne den Gesamtpreis jeder einzelnen Position. Bestellnummer, Produktname, Menge, Einzelpreis, Positionspreis --
SELECT 
    Bestellpositionen.BestellID, 
    Produkte.Name, 
    Bestellpositionen.Menge, 
    Produkte.Preis AS Einzelpreis,
    (Bestellpositionen.Menge * Produkte.Preis) AS Positionspreis
FROM Bestellpositionen
JOIN Produkte ON Bestellpositionen.ProduktID = Produkte.ProduktID;

-- C2 --
-- Berechne den Gesamtbetrag jeder Bestellung. Bestellnummer, Kundenname, Gesamtbetrag  --
SELECT 
    Bestellungen.BestellID, 
    Kunden.Nachname, 
    SUM(Bestellpositionen.Menge * Produkte.Preis) AS Gesamtbetrag
FROM Bestellungen
JOIN Kunden ON Bestellungen.KundenID = Kunden.KundenID
JOIN Bestellpositionen ON Bestellungen.BestellID = Bestellpositionen.BestellID
JOIN Produkte ON Bestellpositionen.ProduktID = Produkte.ProduktID
GROUP BY Bestellungen.BestellID;

-- D1 --
-- Berechne den Gesamtumsatz pro Kunde und sortiere absteigend nach Umsatz. --
SELECT 
    Kunden.Vorname || ' ' || Kunden.Nachname AS Kundenname,
    SUM(Bestellpositionen.Menge * Produkte.Preis) AS Gesamtumsatz
FROM Kunden
JOIN Bestellungen ON Kunden.KundenID = Bestellungen.KundenID
JOIN Bestellpositionen ON Bestellungen.BestellID = Bestellpositionen.BestellID
JOIN Produkte ON Bestellpositionen.ProduktID = Produkte.ProduktID
GROUP BY Kunden.KundenID
ORDER BY Gesamtumsatz DESC;