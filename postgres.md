# SQL

- [What is RDBMS](#what-is-rdbms)
- [What is SQL](#what-is-sql)
- [Data Definition](#data-definition)
---

## What is RDBMS
RDBMS steht für **Relationales Datenbankmanagementsystem**.  In diesem können Daten in einer tabellarischen Struktur gespeichert werden. Die bekanntesten RDBMS sind beispielsweise **MySQL** oder **PostgreSQL**.

In einem RDBMS kann sich nicht nur eine, sondern mehrere Datenbanken befinden. Diese können über das Managementsystem, erstellt, gelöscht oder bearbeitet werden.

Eine einzelne Datenbank wiederrum kann viele verschiedene Tabellen beinhalten. Zum Beispiel eine Tabelle für Unicorns und eine weitere für die Locations.

### **Unicorns:**

| id  | name        | age | location_id |
| --- | ----------- | --- | ----------: |
| 1   | Friendcorn  | 175 |           1 |
| 2   | Lazycorn    | 957 |           2 |
| 3   | Strangecorn | 5   |           1 |

### **Locations:**

| id  | location          | lat | lng |
| --- | ------------- | --- | --: |
| 1   | Strange Town  | 175 |  33 |
| 2   | Sleepy Hollow | 55  | 199 |

Es ist möglich die unterschiedlichen Tabellen miteinander zu verlinken. So ist es beispielsweise möglich, einem Einhorn eine Location zuzuweisen.

Eine Tabelle ist in **fields (columns)** und **records (rows)** unterteilt. Wichtig ist das einem record eine einzigartige id zugewiesen werden muss. Das ist wichtig um ihn später wieder identifizieren zu können.

![Server](./images/server.png)

---

## What is SQL
SQL ist die Sprache, welche benötigt wird um mit einer Relationalen Datenbank zu kommunizieren.
In der Core Syntax unterscheidet man hier zwischen **Key Words** und **Identifiers**. Die **Key Words** werden von der sprache selbst vorgegeben. Die **Identifiers** ergeben sich aus den verschiedenen Feldern in einer Tabelle. 

![Syntax](./images/syntax.jpg)

Syntax Regeln:
1. SQL-Anweisungen müssen mit einem Semikolon enden (wenn mehrere Anweisungen im selben Befehl enthalten sind).
2. Bei SQL-Anweisungen wird die Groß- und Kleinschreibung nicht berücksichtigt. Das bedeutet, dass FROM dasselbe ist wie from (zur besseren Identifizierung der Schlüsselwörter sollten sie dennoch groß geschrieben werden).
3. Bezeichner können mit doppelten Anführungszeichen umgeben werden, um Konflikte mit eingebauten Schlüsselwörtern zu vermeiden.
---
## Data Definition

Bei der Arbeit mit Datenbanken und Tabellen sind die folgenden Schlüsselwörter wichtig.

- **CREATE** is needed to create a database or table.
- **ALTER** is needed to update an existing database or table.
- **DROP** is needed to delete an existing database or table

```SQL

CREATE DATABASE cornify;
CREATE TABLE unicorns;

```