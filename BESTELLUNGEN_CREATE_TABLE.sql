CREATE TABLE BESTELLUNG (BestellNr INT NOT NULL AUTO_INCREMENT PRIMARY KEY, Datum date, KundenNr INT NOT NULL);

CREATE TABLE KUNDE (KundenNr INT NOT NULL AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(128) NOT NULL);

CREATE TABLE BESTELLPOSITION(PositionNr INT NOT NULL AUTO_INCREMENT PRIMARY KEY, BestellNr INT NOT NULL, MenuId INT NOT NULL, Anzahl int);

CREATE TABLE MENU (MenuId INT NOT NULL AUTO_INCREMENT PRIMARY KEY, MerkmalId INT NOT NULL);

CREATE TABLE MERKMAL(MerkmalId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,Text TEXT NULL);

ALTER TABLE BESTELLUNG ADD CONSTRAINT fk_KUNDE FOREIGN KEY
(KundenNr) REFERENCES KUNDE(KundenNr);

ALTER TABLE MENU ADD CONSTRAINT fk_MERKMAL FOREIGN KEY
(MerkmalId) REFERENCES MERKMAL(MerkmalId);

ALTER TABLE BESTELLPOSITION ADD CONSTRAINT fk_BESTELLUNG FOREIGN KEY 
(BestellNr) REFERENCES BESTELLUNG(BestellNr);

ALTER TABLE BESTELLPOSITION ADD CONSTRAINT fk_MENU FOREIGN KEY 
(MenuId) REFERENCES MENU(MenuId);

-- Inserting customers
INSERT INTO KUNDE (Name) VALUES
('John Doe'),
('Jane Smith'),
('Michael Johnson');

-- Inserting characteristics
INSERT INTO MERKMAL (Text) VALUES
('Vegetarian'),
('Gluten-Free'),
('Spicy'),
('Vegan');

-- Inserting menu items
INSERT INTO MENU (MerkmalId) VALUES
(1),
(2),
(3),
(4),
(1),
(3);

-- Inserting orders
INSERT INTO BESTELLUNG (Datum, KundenNr) VALUES
('2024-04-01', 1),
('2024-04-02', 2),
('2024-04-03', 3);

-- Inserting order items
INSERT INTO BESTELLPOSITION (BestellNr, MenuId, Anzahl) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 3),
(3, 5, 2),
(3, 6, 1);

-- Inserting customers without orders
INSERT INTO KUNDE (Name) VALUES
('Alice Brown'),
('Bob Wilson');


-- tests
-- getting all customers
SELECT * FROM KUNDE;
-- +----------+-----------------+
-- | KundenNr | Name            |
-- +----------+-----------------+
-- |        1 | John Doe        |
-- |        2 | Jane Smith      |
-- |        3 | Michael Johnson |
-- +----------+-----------------+

-- getting all customers with orders
SELECT K.Name, B.BestellNr, B.Datum FROM KUNDE K
JOIN BESTELLUNG B ON K.KundeNr = B.KundenNr;
-- +-----------------+-----------+------------+
-- | Name            | BestellNr | Datum      |
-- +-----------------+-----------+------------+
-- | John Doe        |         1 | 2024-04-01 |
-- | Jane Smith      |         2 | 2024-04-02 |
-- | Michael Johnson |         3 | 2024-04-03 |
-- +-----------------+-----------+------------+

-- getting all customers and all orders LEFT JOIN
SELECT K.KundenNr, K.Name, B.BestellNr, B.Datum FROM KUNDE K 
LEFT JOIN  BESTELLUNG B ON B.KundenNr = K.KundenNr;
-- +----------+-----------------+-----------+------------+
-- | KundenNr | Name            | BestellNr | Datum      |
-- +----------+-----------------+-----------+------------+
-- |        1 | John Doe        |         1 | 2024-04-01 |
-- |        2 | Jane Smith      |         2 | 2024-04-02 |
-- |        3 | Michael Johnson |         3 | 2024-04-03 |
-- |        4 | Alice Brown     |      NULL | NULL       |
-- |        5 | Bob Wilson      |      NULL | NULL       |
-- +----------+-----------------+-----------+------------+


-- getting all orders with menu
SELECT B.BestellNr, B.Datum,BP.PositionNr,M.MenuId,BP.Anzahl  FROM BESTELLUNG B 
JOIN BESTELLPOSITION BP ON B.BestellNr = BP.BestellNr 
JOIN MENU M on M.MenuId = BP.MenuId;
-- +-----------+------------+------------+--------+--------+
-- | BestellNr | Datum      | PositionNr | MenuId | Anzahl |
-- +-----------+------------+------------+--------+--------+
-- |         1 | 2024-04-01 |          1 |      1 |      2 |
-- |         1 | 2024-04-01 |          2 |      2 |      1 |
-- |         2 | 2024-04-02 |          3 |      3 |      1 |
-- |         3 | 2024-04-03 |          4 |      4 |      3 |
-- |         3 | 2024-04-03 |          5 |      5 |      2 |
-- |         3 | 2024-04-03 |          6 |      6 |      1 |
-- +-----------+------------+------------+--------+--------+

-- what orders cusomer on 1?
SELECT * FROM KUNDE;
SELECT K.KundenNr, K.Name,B.BestellNr,B.Datum, BP.MenuId, BP.Anzahl FROM KUNDE K 
JOIN  BESTELLUNG B ON B.KundenNr = K.KundenNr 
JOIN BESTELLPOSITION BP ON B.BestellNr = BP.BestellNr 
WHERE K.KundenNr = 1;
-- +----------+----------+-----------+------------+--------+--------+
-- | KundenNr | Name     | BestellNr | Datum      | MenuId | Anzahl |
-- +----------+----------+-----------+------------+--------+--------+
-- |        1 | John Doe |         1 | 2024-04-01 |      1 |      2 |
-- |        1 | John Doe |         1 | 2024-04-01 |      2 |      1 |
-- +----------+----------+-----------+------------+--------+--------+

-- select bestllung 1 with menu and merkmal
SELECT B.Datum, BP.Anzahl, M.MenuId, MM.Text FROM BESTELLUNG B 
JOIN BESTELLPOSITION BP ON B.BestellNr = BP.BestellNr
JOIN MENU M ON BP.MenuId = M.MenuId
JOIN MERKMAL MM ON M.MerkmalId = MM.MerkmalId  
WHERE B.BestellNr = 1;
-- +------------+--------+--------+-------------+
-- | Datum      | Anzahl | MenuId | Text        |
-- +------------+--------+--------+-------------+
-- | 2024-04-01 |      2 |      1 | Vegetarian  |
-- | 2024-04-01 |      1 |      2 | Gluten-Free |
-- +------------+--------+--------+-------------+
-- check BESTELLPOSITION table
DESCRIBE BESTELLPOSITION;
-- +------------+---------+------+-----+---------+----------------+
-- | Field      | Type    | Null | Key | Default | Extra          |
-- +------------+---------+------+-----+---------+----------------+
-- | PositionNr | int(11) | NO   | PRI | NULL    | auto_increment |
-- | BestellNr  | int(11) | NO   | MUL | NULL    |                |
-- | MenuId     | int(11) | NO   | MUL | NULL    |                |
-- | Anzahl     | int(11) | YES  |     | NULL    |                |
-- +------------+---------+------+-----+---------+----------------+
CREATE TABLE BESTELLPOSITION2 (
    PositionNr INT NOT NULL,
    BestellNr INT NOT NULL,
    MenuId INT NOT NULL,
    Anzahl int,
    PRIMARY KEY (PositionNr, BestellNr),
    FOREIGN KEY (BestellNr) REFERENCES BESTELLUNG(BestellNr),
  FOREIGN KEY (MenuId) REFERENCES MENU(MenuId)
);

-- Inserting data into BESTELLPOSITION2
INSERT INTO BESTELLPOSITION2 (PositionNr, BestellNr, MenuId, Anzahl) VALUES
(1, 1, 1, 2),  -- PositionNr 1 in Order 1, MenuId 1, Quantity 2
(2, 1, 2, 1),  -- PositionNr 2 in Order 1, MenuId 2, Quantity 1
(3, 2, 3, 1),  -- PositionNr 3 in Order 2, MenuId 3, Quantity 1
(4, 3, 4, 3),  -- PositionNr 4 in Order 3, MenuId 4, Quantity 3
(5, 3, 5, 2);  -- PositionNr 5 in Order 3, MenuId 5, Quantity 2

-- rerun with BESTELLPOSITION2



-- getting all orders with menu
SELECT B.BestellNr, B.Datum,BP.PositionNr,M.MenuId,BP.Anzahl  FROM BESTELLUNG B 
JOIN BESTELLPOSITION2 BP ON B.BestellNr = BP.BestellNr 
JOIN MENU M on M.MenuId = BP.MenuId;
-- +-----------+------------+------------+--------+--------+
-- | BestellNr | Datum      | PositionNr | MenuId | Anzahl |
-- +-----------+------------+------------+--------+--------+
-- |         1 | 2024-04-01 |          1 |      1 |      2 |
-- |         1 | 2024-04-01 |          2 |      2 |      1 |
-- |         2 | 2024-04-02 |          3 |      3 |      1 |
-- |         3 | 2024-04-03 |          4 |      4 |      3 |
-- |         3 | 2024-04-03 |          5 |      5 |      2 |
-- +-----------+------------+------------+--------+--------+

-- what orders cusomer on 1?
SELECT * FROM KUNDE;
SELECT K.KundenNr, K.Name,B.BestellNr,B.Datum, BP.MenuId, BP.Anzahl FROM KUNDE K 
JOIN  BESTELLUNG B ON B.KundenNr = K.KundenNr 
JOIN BESTELLPOSITION2 BP ON B.BestellNr = BP.BestellNr 
WHERE K.KundenNr = 1;
-- +----------+----------+-----------+------------+--------+--------+
-- | KundenNr | Name     | BestellNr | Datum      | MenuId | Anzahl |
-- +----------+----------+-----------+------------+--------+--------+
-- |        1 | John Doe |         1 | 2024-04-01 |      1 |      2 |
-- |        1 | John Doe |         1 | 2024-04-01 |      2 |      1 |
-- +----------+----------+-----------+------------+--------+--------+


-- select bestllung 1 with menu and merkmal
SELECT B.Datum, BP.Anzahl, M.MenuId, MM.Text FROM BESTELLUNG B 
JOIN BESTELLPOSITION2 BP ON B.BestellNr = BP.BestellNr
JOIN MENU M ON BP.MenuId = M.MenuId
JOIN MERKMAL MM ON M.MerkmalId = MM.MerkmalId  
WHERE B.BestellNr = 1;
-- +------------+--------+--------+-------------+
-- | Datum      | Anzahl | MenuId | Text        |
-- +------------+--------+--------+-------------+
-- | 2024-04-01 |      2 |      1 | Vegetarian  |
-- | 2024-04-01 |      1 |      2 | Gluten-Free |
-- +------------+--------+--------+-------------+

-- chatgpt
SELECT K.Name AS CustomerName, BP.BestellNr, BP.PositionNr, M.MenuId, M.MerkmalId, BP.Anzahl, B.Datum
FROM BESTELLPOSITION2 BP
JOIN BESTELLUNG B ON BP.BestellNr = B.BestellNr
JOIN KUNDE K ON B.KundenNr = K.KundenNr
JOIN MENU M ON BP.MenuId = M.MenuId;
-- +-----------------+-----------+------------+--------+-----------+--------+------------+
-- | CustomerName    | BestellNr | PositionNr | MenuId | MerkmalId | Anzahl | Datum      |
-- +-----------------+-----------+------------+--------+-----------+--------+------------+
-- | John Doe        |         1 |          1 |      1 |         1 |      2 | 2024-04-01 |
-- | John Doe        |         1 |          2 |      2 |         2 |      1 | 2024-04-01 |
-- | Jane Smith      |         2 |          3 |      3 |         3 |      1 | 2024-04-02 |
-- | Michael Johnson |         3 |          4 |      4 |         4 |      3 | 2024-04-03 |
-- | Michael Johnson |         3 |          5 |      5 |         1 |      2 | 2024-04-03 |
-- +-----------------+-----------+------------+--------+-----------+--------+------------+

SELECT K.Name AS CustomerName, BP.BestellNr, BP.PositionNr, M.MenuId, M.MerkmalId, BP.Anzahl, B.Datum
FROM BESTELLPOSITION2 BP
JOIN BESTELLUNG B ON BP.BestellNr = B.BestellNr
JOIN KUNDE K ON B.KundenNr = K.KundenNr
JOIN MENU M ON BP.MenuId = M.MenuId
WHERE K.Name = 'CustomerName';
SELECT K.Name AS CustomerName, BP.BestellNr, BP.PositionNr, M.MenuId, M.MerkmalId, BP.Anzahl, B.Datum
FROM BESTELLPOSITION2 BP 
  JOIN BESTELLUNG B ON BP.BestellNr = B.BestellNr 
  JOIN KUNDE K ON B.KundenNr = K.KundenNr 
  JOIN MENU M ON BP.MenuId = M.MenuId 
WHERE K.Name = 'John Doe';

-- +--------------+-----------+------------+--------+-----------+--------+------------+
-- | CustomerName | BestellNr | PositionNr | MenuId | MerkmalId | Anzahl | Datum      |
-- +--------------+-----------+------------+--------+-----------+--------+------------+
-- | John Doe     |         1 |          1 |      1 |         1 |      2 | 2024-04-01 |
-- | John Doe     |         1 |          2 |      2 |         2 |      1 | 2024-04-01 |
-- +--------------+-----------+------------+--------+-----------+--------+------------+

SELECT K.Name AS CustomerName, BP.BestellNr, BP.PositionNr, M.MenuId, M.MerkmalId, BP.Anzahl, B.Datum
FROM BESTELLPOSITION2 BP
JOIN BESTELLUNG B ON BP.BestellNr = B.BestellNr
JOIN KUNDE K ON B.KundenNr = K.KundenNr
JOIN MENU M ON BP.MenuId = M.MenuId
WHERE B.Datum = '2024-04-01';

-- +--------------+-----------+------------+--------+-----------+--------+------------+
-- | CustomerName | BestellNr | PositionNr | MenuId | MerkmalId | Anzahl | Datum      |
-- +--------------+-----------+------------+--------+-----------+--------+------------+
-- | John Doe     |         1 |          1 |      1 |         1 |      2 | 2024-04-01 |
-- | John Doe     |         1 |          2 |      2 |         2 |      1 | 2024-04-01 |
-- +--------------+-----------+------------+--------+-----------+--------+------------+
