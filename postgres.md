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
- [Default Values](#default-values)     
- [Constraints](#constraints)
    - [Check Constraints ](#check-constraints )
    - [Not Null Constraints ](#not-null-constraints )
    - [Unique Constraints ](#unique-constraints )    
    - [Primary Keys ](#primary-keys )     
    - [Foreign Keys ](#foreign-keys )
- [Modifying Tables ](#modifying-tables )
    - [Add columns ](#add-columns )
    - [Remove columns ](#remove-columns )
    - [Add constraints ](#add-constraints )
    - [Remove constraints ](#remove-constraints )
    - [Change default values ](#change-default-values )    
- [CRUD](#crud ) 
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
## Default Values
A column can be assigned a default value. When a new row is created and no values are specified for some of the columns, those columns will be filled with their respective default values.

```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    salary INT DEFAULT NULL
);
```
### Null:
The `NULL` type is needed if you want to indicate that there is no data for this field.

**NULL VS 0**
In the table below, Strangecorn has a value of `NULL` in the salary field. Let's assume that later on we want to calculate the average of all salaries. In this case, all records with the salary value of `NULL` would be excluded from the calculation.

However, if a 0 was entered as the value, the record would be included in the calculation and thus falsify the result.

### **Unicorns:**

| id  | unicorn_name | salary | unicorn_type |
| --- | ------------ | ------ | -----------: |
| 1   | Friendcorn   | 5000   |            1 |
| 2   | Lazycorn     | 7000   |            2 |
| 3   | Strangecorn  | NULL   |            1 |

With a value of `NULL` the average can now be calculated correctly and requested via the `AVG` function.

```SQL
SELECT AVG(salary) FROM unicorns;
```

---

## Constraints
A **Constraint** restrict which values can actually be inserted into a column.

**A distinction is made between different constraints, these would be:**

1. Check Constraints
2. Not-Null Constraints
3. Unique Constraints
4.  Primary Keys
5. Foreign Keys
6. Exclusion Constraints
---
## Check Constraints
The `CHECK` constraint can be used to specify that the value in a particular column must satisfy a Boolean expression (truth value).

In the example below, it is specified that the column salary may only contain values that are greater than 1000.

```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    salary INT CHECK (salary > 1000)
);
```

>You can also give the constraint a separate name. This clarifies error messages and allows you to refer to the constraint when you need to change it. 

```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    salary INT CONSTRAINT salary_price CHECK (salary > 1000)
);
```
---
## Not Null Constraints
A not-null constraint simply specifies that a column must not assume the null value.

The example below specifies that the value for unicorn_name must not be `NULL`.
```SQL
CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    salary INT DEFAULT NULL CONSTRAINT salary_price CHECK (salary > 1000)
);
```
---
## Unique Constraints
The `UNIQUE` constraint ensure that the value in a column is unique.
This can be useful when assigning id's or email addresses.
```SQL
CREATE TABLE unicorns(
    id SERIAL PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    email: VARCHAR(200) NOT NULL UNIQUE,
    salary INT DEFAULT NULL CONSTRAINT salary_price CHECK (salary > 1000)
);
```
---

## Primary Keys
The `PRIMARY KEY` indicates, that a value is unique. A `PRIMARY KEY` may only be assigned once per table.
```SQL
CREATE TABLE unicorns(
    id SERIAL PRIMARY KEY,
    unicorn_name VARCHAR(200) NOT NULL,
    email: VARCHAR(200) NOT NULL UNIQUE,
    salary INT DEFAULT NULL CONSTRAINT salary_price CHECK (salary > 1000)
);
```
> The `PRIMARY KEY` signals to the RDBMS that this field is the primary identifier of a record.

---
## Foreign Keys

 @TODO Work out here later

---

## Modifying Tables
PostgreSQL provides a set of commands to make changes to an existing table. The **records** in the table will not be deleted.

**Postgres provides solutions for the following scenarios.**
1. Add columns
2. Remove columns
3. Add constraints
4. Remove constraints
5. Change default values
6. Change column data types
7. Rename columns
8. Rename tables
---
## Add columns
As described in the section **Working with Databases and Tables**, `ALTER TABLE` is needed to update an existing table.

Using the keywords `ADD COLUMN` a new column can be created. Also the desired data type for the field must be specified.

```SQL
ALTER TABLE unicorns ADD COLUMN description text;
```
---
## Remove columns
The keyword `DROP` followed by the column name can be used to drop a column.
```SQL
ALTER TABLE unicorns DROP COLUMN description;
```
---
## Add constraints
To add a Constaraint to an existing field, the procedure is a little different. With the keywords `ADD CONSTRAINT` a new constraint can be created. This will be assigned a name of your choice. The constraint is not directly assigned to a field but results from the filter.

```SQL
ALTER TABLE unicorns
ADD CONSTRAINT salary_range CHECK (salary > 1000 AND salary < 100000);
```
---
## Remove constraints
To remove a constraint you need to know its name. If you gave it a name then that's easy.

```SQL
ALTER TABLE unicorns
DROP CONSTRAINT salary_range;
```
---

## Change default values

### 1. Changing a Column's Default Value:
After the table has been referenced, the desired column can be changed via 'ALTER COLUMN'. The keyword `SET` allows to set a default value.
```SQL
ALTER TABLE unicorns ALTER COLUMN is_happy SET DEFAULT TRUE;
```

### 2. Changing a Column's Data Type:
The keywords `SET DATA TYPE` can be used to change the data type of a column.
```SQL
ALTER TABLE unicorns ALTER COLUMN salary SET DATA TYPE REAL;
```

> This will succeed only if each existing entry in the column can be converted to the new type by an implicit cast. If a more complex conversion is needed, you can add a USING clause that specifies how to compute the new values from the old.<br>
PostgreSQL will attempt to convert the column's default value (if any) to the new type, as well as any constraints that involve the column. But these conversions might fail, or might produce surprising results. It's often best to drop any constraints on the column before altering its type, and then add back suitably modified constraints afterwards.


### 3. Renaming a Column:
The keywords `RENAME COLUMN` can be used to rename a column. This is done by referencing the old column name followed by the keyword `TO` and the name of the new column.
```SQL
ALTER TABLE unicorns RENAME COLUMN salary TO yearly_salary;
```

### 4. Renaming a Table:
A table can be renamed similarly to a column. An example is included below.
```SQL
ALTER TABLE unicorns RENAME TO beautiful_unicorns;
```
---

## CRUD