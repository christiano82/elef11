# Datenbanken
## Arten von Datenbanken
Nenne 2 Nicht-Relationäre Datenbanksysteme:
* Dokument Datenbank
* Objektorientierte Datenbanken (OODBMS)
* Key Value Stores

## Normalformen
Ziel: Konsistenzerhöhung durch Redundanzvermeidung
### 1NF
"Jede Zelle klar und rein, in 1NF soll sie stets sein."

Unnormalisiert:
* mehrwertige Daten im Kurs Attribut
| StudentenID | Name        | Kurse               |
| ----------- | ----------- | ------------------- |
| 1           | John Doe    | Math, Science       |
| 2           | Jane Smith  | English, History    |
| 3           | Alice Brown | Math, Physics, Chem |

Auflösen der Attribute Kurs

| StudentenID | Name        | Kurs    |
| ----------- | ----------- | ------- |
| 1           | John Doe    | Math    |
| 1           | John Doe    | Science |
| 2           | Jane Smith  | English |
| 2           | Jane Smith  | History |
| 3           | Alice Brown | Math    |
| 3           | Alice Brown | Physics |
| 3           | Alice Brown | Chem    |

Jetzt ist jede Zelle in der Tabelle atomar, und die Tabelle erfüllt die Anforderungen der ersten Normalform (1NF). Jeder Datensatz enthält nur einen Kurs pro Zeile, was die Datenstruktur verbessert und Redundanzen minimiert.
## Aufgabe 1NF alle Attribute sind Atomar!

| Bestellung | Kunde  | Datum      | Menu   | Anzahl | Merkmal | KundenNr |
| ---------- | ------ | ---------- | ------ | ------ | ------- | -------- |
| 1          | Müller | 31.03.2023 | Penne  | 3      | Veggi   | 23       |
| 2          | Mayer  | 31.03.2023 | Tortil | 1      | GFreee  | 71       |
| 2          | Mayer  | 31.03.2023 | Steak  | 1      | Fleisch | 71       |
