**TEIL 1: Kern Überlegungen (Warum Architektur)**

**Folie 1: Warum Architektur?**

- Einleitung: Erläuterung der Bedeutung von Architektur in der Softwareentwicklung.
- Beispiel: Vergleich eines chaotischen Hausbaus ohne klare Strukturen mit Softwareentwicklung ohne Architektur.

---

**Folie 2: Probleme ohne Architektur**

- Bild: Darstellung einer unorganisierten Baustelle.
- Text: Beschreibung der Probleme wie Chaos, Inkonsistenz und Instabilität, die ohne eine klare Architektur in der Softwareentwicklung auftreten können.

---

**Folie 3: Lösung: Architektur**

- Bild: Illustration strukturierter Baupläne.
- Text: Erklärung der Vorteile klarer Strukturen durch Architektur, wie verbesserte Wartbarkeit und Kostenreduktion.
- Abschluss: Betonung der Notwendigkeit und Vorteile einer Investition in Architektur für die Schaffung stabiler und wartbarer Software.

**Teil 2: Infrastruktur (Anwendung und Design Pattern)**

**Folie 1: Clean Architecture**

- Erklärung: Clean Architecture ist ein von Robert C. Martin entwickeltes Architekturmuster, das darauf abzielt, klare Strukturen und klare Verantwortlichkeiten in Softwareprojekten zu schaffen.
- Weiterführung: Clean Architecture fördert die Trennung von Geschäftslogik und Infrastrukturdetails, um die Wartbarkeit, Flexibilität und Erweiterbarkeit der Software zu verbessern.
- Hervorhebung: Betonung der Bedeutung klarer Strukturen und eines stabilen Fundaments für Softwareprojekte.

---

**Folie 2: Dependency Injection (DI)**

- Erklärung: Dependency Injection ist ein Designmuster, das die Abhängigkeiten zwischen Komponenten locker koppelt, indem Abhängigkeiten von außen bereitgestellt werden, anstatt sie im Code fest zu verdrahten.
- Vorteile für Clean Architecture: Ermöglicht eine bessere Trennung von Modulen und erhöht die Testbarkeit, da Abhängigkeiten leichter ausgetauscht und gemockt werden können.

---

**Folie 3: CQRS (Command Query Responsibility Segregation)**

- Erklärung: CQRS trennt Lese- und Schreiboperationen in der Anwendung, indem unterschiedliche Modelle für Lese- und Schreibzugriffe verwendet werden.
- Vorteile für Clean Architecture: Verbessert die Skalierbarkeit und Performance, da Lese- und Schreibzugriffe unabhängig voneinander optimiert werden können. Reduziert auch komplexe Datenmodelle und erhöht die Flexibilität.

---

**Folie 4: Specification Pattern**

- Erklärung: Das Specification Pattern definiert Bedingungen oder Kriterien als separate Objekte, die dann in Abfragen oder Validierungen verwendet werden können.
- Einsatz in Clean Architecture: Das Specification Pattern kann verwendet werden, um komplexe Abfragen oder Validierungen zu modularisieren und die Wartbarkeit und Lesbarkeit des Codes zu verbessern.

---

**Folie 5: Repository Pattern**

- Erklärung: Das Repository Pattern trennt den Datenzugriff von der Geschäftslogik, indem es eine Abstraktionsschicht zwischen den Datenbankoperationen und der Anwendung bereitstellt.
- Vorteile für Clean Architecture: Erlaubt die Trennung von Datenzugriffsdetails und Geschäftslogik, verbessert die Testbarkeit und Flexibilität und ermöglicht den Austausch von Datenzugriffstechnologien ohne Änderungen an der Anwendung.

---

**Folie 6: Clean Architecture in Aktion**

- Bild: Darstellung der Schichten der Clean Architecture (z. B. Entities, Use Cases, Schnittstellen, Infrastruktur) mit Fokus auf die eingebundenen Patterns.
- Beschreibung: Erläuterung, wie Dependency Injection, CQRS, Specification Pattern und Repository Pattern in die Clean Architecture integriert werden, um klare Strukturen und klare Verantwortlichkeiten zu schaffen.
- Beispiel: Visualisierung eines Beispiel-Szenarios und wie die Patterns die Struktur und Organisation des Codes beeinflussen und die Erweiterbarkeit der Software ermöglichen.

**Teil 3: UseCase (Anforderungen an die Umsetzung der Clean Architecture)**

**Folie 1: Umsetzung von Use Cases in Clean Architecture**

- Einleitung: Erläuterung der Bedeutung der Umsetzung von Use Cases in der Clean Architecture, um klare Strukturen und klare Verantwortlichkeiten zu gewährleisten.

---

**Folie 2: Dependency Injection**

- Erklärung: Lockerung von Abhängigkeiten zwischen Use Cases und anderen Komponenten durch Dependency Injection.
- Beispiel: Demonstration der Verwendung von Dependency Injection für die Integration von Use Cases, um lose Kopplung und Testbarkeit zu ermöglichen.

---

**Folie 3: CQRS (Command Query Responsibility Segregation)**

- Erklärung: Trennung von Lese- und Schreiboperationen für klare Strukturierung der Use Cases.
- Beispiel: Anwendung von CQRS zur Separierung von Lese- und Schreiboperationen in Use Cases, um Skalierbarkeit und Performance zu verbessern.

---

**Folie 4: Repository Pattern**

- Erklärung: Trennung von Datenzugriff und Geschäftslogik für eine saubere Implementierung der Use Cases.
- Beispiel: Integration des Repository Patterns zur Datenverwaltung innerhalb von Use Cases, um den Datenzugriff zu abstrahieren und die Wartbarkeit zu erhöhen.

---

**Folie 5: Specification Pattern**

- Erklärung: Modularisierung von komplexen Abfragen oder Validierungen durch das Specification Pattern.
- Beispiel: Verwendung von Specifications zur Definition und Verwendung von Abfragekriterien in Use Cases, um die Lesbarkeit und Wartbarkeit des Codes zu verbessern.

---

**Folie 6: Clean Architecture in Aktion**

- Darstellung eines Anwendungsbeispiels mit verschiedenen Use Cases und deren Umsetzung in der Clean Architecture unter Verwendung der vorgestellten Muster.
- Betonung der Bedeutung der korrekten Umsetzung von Use Cases für den Erfolg eines Softwareprojekts in der Clean Architecture.

**TEIL 4: View und Ausblick**
**Teil 4**
IV. View (Ausblick)

**Folie 1: Lohnt sich der Aufwand für Clean Architecture?**

- Einleitung: Diskussion über den Nutzen und die Kosten von Clean Architecture in Softwareprojekten.

---

**Folie 2: Vorteile von Clean Architecture**

- Vorteile: Verbesserte Wartbarkeit, Flexibilität, Testbarkeit und Skalierbarkeit.
- Beispielhafte Erläuterungen.

---

**Folie 3: Kosten und Herausforderungen**

- Kosten: Höherer anfänglicher Aufwand, Lernkurve, zusätzliche Komplexität.
- Beispielhafte Erläuterungen.

---

**Folie 4: Entscheidungskriterien**

- Kriterien: Größe des Projekts, Komplexität der Anforderungen, Wartbarkeitsanforderungen.
- Empfehlungen für die Entscheidungsfindung.

---

**Folie 5: Dank und Ressourcen**

- Dank an die Entwickler von Clean Architecture, insbesondere Robert C. Martin.
- Verweis auf Ressourcen: Bücher, Blogbeiträge, Videos.

---

**Folie 6: Persönliche Erfahrungen und Fazit**

- Eigene Erfahrungen: Vor- und Nachteile, Fazit.
- Empfehlungen für die Anwendung von Clean Architecture.