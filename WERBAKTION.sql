-- Kunde
CREATE TABLE Kunde(
  KundenNr int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Vorname VARCHAR(20),
  Name VARCHAR(20),
  Strasse VARCHAR(100),
  HausNr char(10),
  PLZ char(5),
  Ort VARCHAR(100),
  Kunde_Aktive BOOLEAN
);

-- werbeaktion
CREATE TABLE Werbeaktion(
  WerbungsID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Werbepartner VARCHAR(50),
  Werbung_verschickt DATE,
  KundenNr int REFERENCES Kunde(KundenNr)
);

-- Inserting sample data into the Kunde table
INSERT INTO Kunde (Vorname, Name, Strasse, HausNr, PLZ, Ort, Kunde_Aktive) VALUES
('Max', 'Mustermann', 'Hauptstraße', '12', '10115', 'Berlin', TRUE),
('Anna', 'Schmidt', 'Am Markt', '5', '20095', 'Hamburg', TRUE),
('Thomas', 'Schulze', 'Bahnhofstraße', '8', '80331', 'München', FALSE),
('Sabine', 'Müller', 'Kaiserplatz', '3', '50667', 'Köln', TRUE),
('Andreas', 'Schneider', 'Marktplatz', '15', '10178', 'Berlin', FALSE),
('Laura', 'Fischer', 'Rathausstraße', '10', '10178', 'Berlin', TRUE),
('Andrea', 'Antrago', 'Marktplatz', '15', '10178', 'Augsburg', FALSE),
('Thieß', 'Ortlow', 'Rathausstraße', '10', '10178', 'Augsburg', TRUE);

-- Inserting sample data into the Werbeaktion table
INSERT INTO Werbeaktion (Werbepartner, Werbung_verschickt, KundenNr) VALUES
('Marketing GmbH', '2024-03-15', 1),  -- Customer Max Mustermann in Berlin
('WerbeAgentur', '2024-03-20', 2),     -- Customer Anna Schmidt in Hamburg
('AdvertiseCompany', '2024-03-25', 3),  -- Customer Thomas Schulze in München
('Sales GmbH', '2024-03-10', 4),        -- Customer Sabine Müller in Köln
('Marketing GmbH', '2024-03-18', 5),    -- Customer Andreas Schneider in Berlin
('WerbeAgentur', '2024-03-22', 6);      -- Customer Laura Fischer in Berlin

INSERT INTO Werbeaktion (Werbepartner, Werbung_verschickt, KundenNr) VALUES
('Marketing GmbH', '2019-03-15', 5),  -- Customer Max Mustermann in Berlin
('WerbeAgentur', '2020-03-20', 4);  

INSERT INTO Werbeaktion (Werbepartner, Werbung_verschickt, KundenNr) VALUES
('Marketing GmbH', '2022-03-15', 3),  -- Customer Max Mustermann in Berlin
('WerbeAgentur', '2021-03-20', 3);  

-- SQL Abfrage wie viele kunden in Augsburg Status aktiv sind
SELECT * FROM Kunde WHERE Ort like '%Augsburg%' AND Kunde_Aktive = TRUE;
-- +----------+---------+--------+----------------+--------+-------+----------+--------------+
-- | KundenNr | Vorname | Name   | Strasse        | HausNr | PLZ   | Ort      | Kunde_Aktive |
-- +----------+---------+--------+----------------+--------+-------+----------+--------------+
-- |        8 | Thieß   | Ortlow | Rathausstraße  | 10     | 10178 | Augsburg |            1 |
-- +----------+---------+--------+----------------+--------+-------+----------+--------------+

SELECT count(*) "Kunde Aktiv aus Augsburg" 
FROM Kunde 
WHERE Ort like '%Augsburg%' AND Kunde_Aktive = 1;
-- +--------------------------+
-- | Kunde Aktiv aus Augsburg |
-- +--------------------------+
-- |                        1 |
-- +--------------------------+

SELECT count(*) AS "Werbungen vor dem 31.12.2021 an Kunden mit PLZ 8..." FROM Werbeaktion W
JOIN Kunde K on K.KundenNr W.KundenNr
WHERE W.Werbung_verschickt < '2021.12.31'
AND K.PLZ like '8%';
-- +-----------------------------------------------------+
-- | Werbungen vor dem 31.12.2021 an Kunden mit PLZ 8... |
-- +-----------------------------------------------------+
-- |                                                   1 |
-- +-----------------------------------------------------+
