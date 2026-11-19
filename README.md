# DataLore

My data science coursework and practice, kept in one place: Python fundamentals, SQL exercises and a full case study, and MongoDB queries. Every file is meant to be read top to bottom and run as-is.

## Contents

### `python_basics/`

Commented, runnable scripts that walk through core Python, one topic per file:

| File | Topics |
| ---- | ------ |
| `01_variables_and_operators.py` | Variables, data types, arithmetic and comparison operators |
| `02_control_flow_and_loops.py` | `if` / `elif` / `else`, `for` and `while` loops |
| `03_lists_and_tuples.py` | Indexing, slicing, list methods, tuples |
| `04_dictionaries_and_sets.py` | Key-value access, dictionary methods, set operations |
| `05_functions_and_scope.py` | Parameters, return values, local and global scope |
| `06_file_io_and_exceptions.py` | Reading and writing files, `try` / `except` |
| `07_oop_basics.py` | Classes, objects, constructors, methods |
| `08_oop_advanced.py` | Inheritance and encapsulation |

### `SQL/`

MySQL exercises, from first `CREATE TABLE` statements to a multi-phase case study:

| File | What it covers |
| ---- | -------------- |
| `day1.sql` | Creating a database and table, `ALTER TABLE` |
| `company_db_queries.sql` | Building and querying an `Employee` table |
| `country_persons_queries.sql`, `country_persons_queries_part2.sql` | `Country` and `Persons` tables: aggregates, `GROUP BY`, `HAVING`, sorting and `LIMIT` |
| `library_management_queries.sql` | A library schema (branches, employees, books, customers, issues and returns) with reporting queries |
| `managers_sql_queries.md` | 23 requirements on a `Managers` table, each answered with its SQL |
| `quickkart_Casestudy.sql` | **QuickKart e-commerce case study** for MySQL 8: database setup, customer, product and order management, KPIs with aggregate functions, `GROUP BY` reports, `HAVING` filters and business classification with `CASE` |

### `MongoDB/`

| File | What it covers |
| ---- | -------------- |
| `mongodb_practice.js` | Switching databases, inserting and finding documents |
| `mongodb_assignment.js` | Queries, updates (`$set`, `$inc`, `$push`, `$pull`) and aggregation pipelines (`$match`, `$group`, `$avg`, `$sum`) on a `Students` collection |

## Running the code

- **Python:** Python 3, no extra packages. Run any file directly, for example `python python_basics/01_variables_and_operators.py`.
- **SQL:** written for MySQL 8. Open a file in MySQL Workbench or the `mysql` client and run it from the top, since later queries depend on the tables created earlier.
- **MongoDB:** paste the statements into `mongosh`.

The repository grows as the course goes on.
