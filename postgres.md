# SQL

- [What is a RDBMS](#what-is-a-rdbms)
- [What is SQL](#what-is-sql)
- [Working with Databases and Tables](#working-with-databases-and-tables)
    - [Create](#create)
    - [Drop](#drop)
    - [Alter](#alter)
- [Data Types](#data-types)
    - [Character Types](#character-types)
    - [Numeric Types](#numeric-types)
    - [Date Types](#date-types)
    - [Boolean Type](#boolean-type)
- [Insert Data](#insert-data)
- [Querying Data](#querying-data)
- [Updating Data](#updating-data)
- [NULL](#null)
- [CHECK Constraint](#check-constraint)
- [Unique Values and Identifiers](#unique-values-and-identifiers)
- [The Primary Key](#the-primary-key)
- [CRUD](#crud)
- [Filter Data](#filter-data)

---

## What is a RDBMS

RDBMS stands for **Relational Database Management System**. In this, data can be stored in a tabular structure. The best-known RDBMS are, for example, **MySQL** or **PostgreSQL**.

An RDBMS can contain not only one, but several databases. These can be created, deleted or edited via the data management system.

A single database can contain many different tables. For example, one table for unicorns and another for locations.

### **Unicorns:**

| id  | name        | age | location_id |
| --- | ----------- | --- | ----------: |
| 1   | Friendcorn  | 175 |           1 |
| 2   | Lazycorn    | 957 |           2 |
| 3   | Strangecorn | 5   |           1 |

### **Locations:**

| id  | location      | lat | lng |
| --- | ------------- | --- | --: |
| 1   | Strange Town  | 175 |  33 |
| 2   | Sleepy Hollow | 55  | 199 |

>It is possible to link the different tables together. Like **Unicorns** and **Locations** in the example above.

A table is divided into **fields (columns)** and **records (rows)**. It is important that a record must be assigned a unique id, to be able to identify it later.

![Server](./images/server.png)

---

## What is SQL

SQL is the language that is required to communicate with a relational database.
In the core syntax, a distinction is made between **Key Words** and **Identifiers**.<br> 
The **Key Words** are specified by the language itself.<br>
 The **Identifiers** result from the various fields in a table.<br>

An acurate list of all Keywords can be found [here](https://www.postgresql.org/docs/current/sql-keywords-appendix.html).


![Syntax](./images/syntax.jpg)

Syntax Regeln:
Syntax rules:

1. SQL statements must end with a semicolon (if multiple statements are included in the same command).
2. SQL statements are case-insensitive. This means that `FROM` is the same as `from` (for better identification of keywords, they should still be capitalized).
3. identifiers can be surrounded with double quotes to avoid conflicts with built-in keywords.

---

## Working with Databases and Tables

When working with databases and tables, the following keywords are important.

- **CREATE** is needed to create a database or table.
- **ALTER** is needed to update an existing database or table.
- **DROP** is needed to delete an existing database or table

```SQL
CREATE DATABASE cornify;
```

```SQL
DROP DATABASE cornify;
```
___

## Create
The keywords `CREATE TABLE` followed by a random table name indicate that a table is being created. The following round brackets specify which fields the table contains and which data types are allowed in the respective fields.

A list of the most common data types can be found in the chapter [Data Types](#data-types).
```SQL
CREATE TABLE unicorns(
    id SERIAL PRIMARY KEY,
    unicorn_name VARCHAR(200),
    salary INT,
);
```
___

## DROP
Using the keywords `DROP TABLE` followed by the respective table name. A table can be deleted
```SQL
DROP TABLE unicorns;
```
---

## Alter
The keywords `ALTER TABLE` followed by the table name indicate which table is to be changed.

In the example below, a description field of data type `TEXT` is added to the unicorns table. More information on this topic will be given later in the [Modifying Tables](#modifying-tables) chapter.
```SQL
ALTER TABLE unicorns ADD COLUMN description TEXT;
```
---

## Data Types

Data types are needed to specify which value may be entered into the field of a table.

> Data types can differ depending on the RDBMS. In this chapter, the most common data types are discussed. Special data types for PostgreSQL can be looked up [here](https://www.postgresql.org/docs/current/datatype.html), for example.

**The most common data types are:**

- Character
- Numeric
- Date
- Boolean

---

## Character Types

The character types can be chosen between **CHAR(X)**, **VARCHAR(X)** and **TEXT** (The X indicates how many characters can be stored).

**CHAR(X)** and **VARCHAR(X)** are almost identical. The big difference is that the missing characters in **CHAR(X)** are filled with spaces.

**TEXT** can be used when a larger amount of text is to be stored. Like a blog post for example. The character type text stores a maximum size of 1GB (PostgreSQL).

Another special character type is the **ENUM**.
In an ENUM you can specify which concrete text values are allowed. For example: Mr | Mrs | Mx

---

## Numeric Types

All Numeric Types for PostgreSQL can be read [here](https://www.postgresql.org/docs/current/datatype-numeric.html). However, the most important ones are **SMALLINT** and **INTEGER**. As well as **DECIMAL** and **NUMERIC**.

**SMALLINT** and **INTEGER** are numbers without decimal places.

**DECIMAL** and **NUMERIC** are used to store numbers with decimal places.

**REAL** and **DOUBLE** are the same then DECIMAL or NUMERIC. The difference is, that **REAL** and **DOUBLE** have variable-precision that means they are inexact. But therefore much faster performance.

---

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

---
## Boolean Type
The Boolean type accepts **truthy** or **falsy** values.

**truthy:** 
1. true
2. 'yes
3. 'on
4. 1

**Falsy:**
1. false
2. 'no
3. 'off
4. 0


---
## What about files

Databases are used to store primitive values. That means the path to a certain file can be stored in a database, not the file itself.

---

## Insert Data

With the keyword **INSERT** data can be stored in a database. The keyword **INTO** specifies in which table the data is stored.

The keyword **VALUES** can be used to specify which values are stored in the respective fields.

```SQL
INSERT INTO unicorns (unicorn_name, salary, unicorn_type)
VALUES ('Lazyhorn', 8000, 'magical_one');
```

> **important** The column names in the round brackets before VALUES indicate the order in which the values must be entered.

---

## Querying Data

To query data you can use the **SELECT** keyword.
Followed by a \* as wildcard you will get all fields.

If you want to query specific fields you can do that by field name.
With the **From** keyword you can specify the table you want to get out the data.

```SQL
SELECT (unicorn_name, id) FROM unicorns;
```

---

## Time to Practice:

An example for creating a table can be taken from [this](./sql/02-unicorns-table.sql). file.
How to create a record can be seen in the example above.

> It is important to ensure that the values take into account the correct data type of the respective field. A string as value should always be written in single quotes.

---

## Updating Data

The keyword **ALTER** is needed to update a table or a field.
All possibilities to update a field or table can be looked up [here](https://www.postgresql.org/docs/current/sql-altertable.html).

In the example below, the data type for yearly_salary has been changed to **REAL** in the clans table.
Likewise, the field yearly_salary has been renamed to yearly_revenue.

```SQL
ALTER TABLE clans
ALTER yearly_salary SET DATA TYPE REAL;

ALTER TABLE clans RENAME COLUMN yearly_salary TO yearly_revenue;
```

> **ALTER TABLE** allows you to run multiple updating operations together. You can, for example update two fields in one ALTER TABLE statement.

---

## NULL

The **NULL** type is needed if you want to indicate that there is no data for this field.

**NULL VS 0**

In the table below, Strangecorn has a value of **NULL** in the salary field.
Let's assume that later on we want to calculate the average of all salaries. In this case, all records with the salary value of **NULL** would be excluded from the calculation.

However, if a 0 was entered as the value, the record would be included in the calculation and thus falsify the result.

### **Unicorns:**

| id  | unicorn_name | salary | unicorn_type |
| --- | ------------ | ------ | -----------: |
| 1   | Friendcorn   | 5000   |            1 |
| 2   | Lazycorn     | 7000   |            2 |
| 3   | Strangecorn  | NULL   |            1 |

With a value of **NULL** the average can now be calculated correctly and requested via the **AVG** function.
```SQL
SELECT AVG(salary) FROM unicorns;
```

**NOT NULL**
> A Constraint restrict which values can actually be inserted into a column

In some cases, it should not be allowed that no value is entered for a field. This can be achieved with the keywords **NOT NULL**. The example below shows a table in which the fields must be filled in.
```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    salary INT DEFAULT NULL,
    unicorn_type unicorn_status
);
```
___
## Time to Practice:
Update all existing tables (unicorns, clans, conversations) and give a **NOT NULL** "CONSTRAINT" at needed position. All fields where a **NULL** value is useful should be changed so that the default value is **NULL**.

The solution of the task can be taken [here](./sql/10-update-not-null.sql).
___

## CHECK Constraint
The NOT NULL constraint ensures that a value must be entered for a specific field. But what happens if a NULL value is allowed. Like for example the field Salary in the table Unicorns. Here we want to check if the value is greater than 0. 

This can be ensured with the **CHECK** constraint.
In round brackets after CHECK you can specify which values are accepted.
```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    salary INT DEFAULT NULL CHECK (salary > 1000),
    unicorn_type unicorn_status
);
```
To add a Constaraint to an existing field, the procedure is a little different. With the keywords **ADD CONSTRAINT** a new constraint can be created. This will be assigned a name of your choice. The constraint is not directly assigned to a field but results from the filter.
```SQL
ALTER TABLE unicorns
ADD CONSTRAINT salary_range CHECK (salary > 1000 AND salary < 100000);
```
___
## Unique Values and Identifiers

To ensure that a value is unique the constraint **Unique** can be used. This can be useful when assigning id's or email addresses.
```SQL
CREATE TABLE unicorns(
    id SERIAL PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    email: VARCHAR(200) NOT NULL UNIQUE,
    salary INT DEFAULT NULL,
    unicorn_type unicorn_status
);
```
## The Primary Key

The **PRIMARY KEY** is also a constraint that monitors that a value is unique. A **PRIMARY KEY** may only be assigned once per table.

The **PRIMARY KEY** signals to the RDBMS that this field is the primary identifier.

> When storing data, each data entry should have at least one unique value (for identifying the record).
___
## CRUD
What are CRUD operations?  CRUD stands for create, read, update, delete. So these are the basic data manipulation operations.

**The following keywords are required for CRUD operations:**

- **Create Data:** `INSERT INTO`
- **Read Data:** `SELECT`
- **Update Data:** `UPDATE`
- **Delete Data:** `DELETE`

### Create Data:
```SQL
-- creates new record in db
INSERT INTO <table name> (<column names>)
VALUES (<column values>);

-- creates multiple records in db
INSERT INTO <table name> (<column names>)
VALUES 
    (<column values>), -- record 1
    (<column values>); -- record 2

-- creates new record by getting value out of a query
INSERT INTO <table name> (<column names>)
SELECT <query>
FROM <table2 name>;
```

### Read Data:
```SQL
-- Fetch the values for the specified columns from the specified table
SELECT <columns> FROM <table name>;

-- Fetch the values for the specified columns from the specified table - but only for records where the codition is met z.B price < 1000
SELECT <columns> FROM <table name> WHERE <condition>;
```

### Updating Data:
```SQL
UPDATE <table name>
SET <column name> = <new value>, ...
WHERE <condition>;
```

### Deleting Data:
```SQL
DELETE FROM <table name>
WHERE <condition>;
```
___

## Filter Data
The **WHERE** clause can be used to filter the requested data from the database.
https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-where/