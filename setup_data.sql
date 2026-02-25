--4 Kunden

INSERT INTO Kunden (Vorname, Nachname, Email, Adresse) VALUES
('Safwan', 'Asif', 'Asif@mail.de', 'Hochstraße', 'Mainz'),
('Max', 'Richter', 'Richter@mail.de', 'Kingstraße','Mainz'),
('Emil', 'Schuster', 'Schuster@mail.de', 'Kaiserstraße','Frankfurt'),
('Sara', 'Jacobs', 'Jacobs@mail.de', 'Albertstraße','Frankfurt');

--Lieferant

INSERT INTO Lieferanten (Firmenname, Kontaktperson)
VALUES ('Global Tech', 'Herr Sach');
Produkte
INSERT INTO Produkte (Name, Preis, Lagerbestand, LieferantenID) VALUES
('Laptop', 899.00, 10, 1),
('Maus', 25.50, 50, 1),
('Tastatur', 45.00, 30, 1),
('Monitor', 199.99, 15, 1),
('HDMI Kabel', 12.00, 100, 1),
('Webcam', 59.00, 20, 1);

--Bestellungen für die Kunden

INSERT INTO Bestellungen (Bestelldatum, KundenID) VALUES
('2026-02-01', 1), ('2026-02-02', 1),
('2026-02-03', 2), ('2026-02-04', 2),
('2026-02-05', 3);

--2 Bestellungen pro Bestellung, ID von 1 bis 5

INSERT INTO Bestellpositionen (BestellID, ProduktID, Menge, Einzelpreis) VALUES
(1, 1, 1, 899.00), (1, 2, 1, 25.50),
(2, 3, 1, 45.00), (2, 5, 2, 12.00),
(3, 4, 1, 199.99), (3, 2, 1, 25.50),
(4, 6, 1, 59.00), (4, 5, 1, 12.00),
(5, 1, 1, 899.00), (5, 4, 1, 199.99);

--Kundendaten updaten mit neuer Adresse

UPDATE Kunden
SET Adresse = 'Neuweg 99, Berlin'
WHERE Nachname = 'Mustermann';

--Produkt erstellt zum Löschen

INSERT INTO Produkte (Name, Preis, LieferantenID) VALUES ('Test-Produkt', 0.00, 1);
DELETE FROM Produkte WHERE Name = 'Test-Produkt';