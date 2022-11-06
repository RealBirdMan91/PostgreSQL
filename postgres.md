# SQL

- [What is SQL](#what-is-sql)
- [Core Syntax](#core-syntax)
- [Data Definition](#data-definition)
- [Insert & Querying Data](#insert-and-querying-data)

---

## What is SQL

SQL stands for Structured Query Language, and it is needed to communicate with data in a database. SQL is a relational database language.  Besides SQL there are also non-relational database languages like MongoDB for example.

> SQL is typically used for managing data in relational database management systems (RDBMS). In these, data can be stored in a tabular structure. Individual tables can in turn be linked to each other.

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

SQL is the language that communicates with a database. An RDBMS is the database system itself. There are two well-known database systems MySQL or PostgreSQL for example.

![Server](./images/server.png)

---

## Core Syntax

The syntax in SQL is subdivided into predefined key words,
these are for example SELECT FROM WHERE.
The identifiers result from the different columns in the table.

![Syntax](./images/syntax.jpg)

**Syntax Rules:**

1. SQL statements must end with a semicolon (if more than one statement in the same command).
2. SQL statements are case-insensitive. That means *FROM* is the same then *from* (To better identify the keywords, they should still be capitalized).
3. Identifiers can be surrounded with double quotes to avoid clashes with build-in keywords.

___

## Data Definition


When working with databases and tables, the following keywords are important.

- **CREATE** is needed to create a database or table.
- **ALTER** is needed to update an existing database or table.
- **DROP** is needed to delete an existing database or table

```SQL

CREATE DATABASE cornify;

```
> Examples can be taken from the sql folder. The example above can be found [here](./sql/01-create-database.sql) for example. 

## Data Types:
Data types can differ depending on the RDBMS. In this chapter, the most common data types are discussed. Special data types for PostgreSQL can be looked up [here](https://www.postgresql.org/docs/current/datatype.html), for example.

**The most common data types are:**
- Character
- Numeric
- Date

## Character Types

The character types can be chosen between **CHAR(X)**, **VARCHAR(X)** and **TEXT** (The X indicates how many characters can be stored).

**CHAR(X)** and **VARCHAR(X)** are almost identical. The big difference is that the missing characters in **CHAR(X)** are filled with spaces.

**TEXT** can be used when a larger amount of text is to be stored. Like a blog post for example. The character type text stores a maximum size of 1GB (PostgreSQL).

Another special character type is the **ENUM**.
In an ENUM you can specify which concrete text values are allowed. For example: Mr | Mrs | Mx 
___

## Numeric Types
All Numeric Types for PostgreSQL can be read [here](https://www.postgresql.org/docs/current/datatype-numeric.html). However, the most important ones are **SMALLINT** and **INTEGER**. As well as **DECIMAL** and **NUMERIC**.

**SMALLINT** and **INTEGER** are numbers without decimal places.

**DECIMAL** and **NUMERIC** are used to store numbers with decimal places.

**REAL** and **DOUBLE** are the same then DECIMAL or NUMERIC. The difference is, that **REAL** and **DOUBLE** have variable-precision that means they are inexact. But therefore much faster performance.
___

## Date Types
All Date Types for PostgreSQL can be read [here](https://www.postgresql.org/docs/current/datatype-datetime.html).
The most important date types are **DATE** and **TIMESTAMP**.

**DATE** contains the current date without taking hours or minutes into account. 

**TIMESTAMP** is needed to store hours and minutes with consideration of the time zone.

With the help of the **DEFAULT** keyword, default values can be stored for the respective field. For a date type this can be helpful in combination with the **CURRENT_TIMESTAMP** keyword.

```SQL
CREATE TABLE conversations (
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    clan_name VARCHAR(200), 
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
)
```
___
## Other Types
Other data types that are often used are **BOOLEAN** (true or false), **JSON** or **XML**.

## What about files?
Databases are used to store primitive values. That means the path to a certain file can be stored in a database, not the file itself.
___


## Insert and Querying Data

## Insert Data:

With the keyword **INSERT** data can be stored in a database. The keyword **INTO** specifies in which table the data is stored.

The keyword **VALUES** can be used to specify which values are stored in the respective fields.

```SQL
INSERT INTO unicorns (unicorn_name, salary, unicorn_type) 
VALUES ('Lazyhorn', 8000, 'magical_one');
```

> **important** The column names in the round brackets before VALUES indicate the order in which the values must be entered.

## Querying Data:
To query data you can use the keyword **SELECT**.
Followed by a * as wildcard you will get all fields.
If you want to query specific fields you can do that by field name.
With the **From** keyword you can specify the table you want to get out the data.

```SQL
SELECT (unicorn_name, id) FROM unicorns;
```
____

## Time to Practice:
An example for creating a table can be taken from [this](./sql/02-unicorns-table.sql). file.
How to create a record can be seen in the example above.

It is important to ensure that the values take into account the correct data type of the respective field. A string as value should always be written in single quotes.
___

