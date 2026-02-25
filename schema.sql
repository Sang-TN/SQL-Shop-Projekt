--Tabelle Bestellposition

CREATE TABLE Bestellpositionen (
PositionsID INTEGER PRIMARY KEY AUTOINCREMENT,
BestellID INTEGER,
ProduktID INTEGER,
Menge INTEGER,
Einzelpreis REAL,
FOREIGN KEY (BestellID) REFERENCES Bestellungen(BestellID),
FOREIGN KEY (ProduktID) REFERENCES Produkte(ProduktID)
);

--Tabelle Bestellungen

CREATE TABLE Bestellungen (
BestellID INTEGER PRIMARY KEY AUTOINCREMENT,
Bestelldatum TEXT,
KundenID INTEGER,
FOREIGN KEY (KundenID) REFERENCES Kunden(KundenID)
);

--Tabelle Kunden

CREATE TABLE Kunden (
KundenID INTEGER PRIMARY KEY AUTOINCREMENT,
Vorname TEXT,
Nachname TEXT,
Email TEXT UNIQUE,
Adresse TEXT
Stadt Text,
);

--Tabelle Lieferanten

CREATE TABLE Lieferanten (
LieferantenID INTEGER PRIMARY KEY AUTOINCREMENT,
Firmenname TEXT,
Kontaktperson TEXT,
Telefon TEXT
);

--Tabelle Produkte

CREATE TABLE Produkte (
ProduktID INTEGER PRIMARY KEY AUTOINCREMENT,
Name TEXT,
Preis REAL,
Lagerbestand INTEGER,
LieferantenID INTEGER,
FOREIGN KEY (LieferantenID) REFERENCES Lieferanten(LieferantenID)
);

--Tabelle sqlite_sequence

CREATE TABLE sqlite_sequence(name,seq);

