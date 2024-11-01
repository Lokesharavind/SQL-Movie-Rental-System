# SQL-Movie-Rental-System
Ensure MySQL is installed and accessible for running the SQL scripts.
This project is a comprehensive SQL-based movie rental system, simulating a full-featured database environment for managing customer records, movie inventory, rental transactions, and rental history. The project involves creating a structured database, defining constraints, and applying various SQL operations for data handling.

Features
Database Setup and Tables
Database Creation: Initializes the movie_db database.
Tables:
customers: Stores customer details, with constraints like unique email, age verification, and default country.
movies: Holds movie details including genre, release year, and rating.
rentals: Tracks active rentals, referencing customer and movie details.
rental_history: Archives past rentals with auto-incrementing primary keys for rental transactions.
Key Functionalities
Data Manipulation:

Inserts and Updates for adding and modifying customer, movie, and rental records.
Delete, Truncate, and Drop commands to manage records effectively.
Constraints: Implementations include unique, check, foreign key, and default constraints.
Indexes: Optimized querying on specific fields using indexes.
Complex Queries:

Joins: INNER, LEFT, RIGHT, and FULL joins for data retrieval across related tables.
Subqueries: Includes correlated and non-correlated subqueries for conditional data fetching.
Aggregate Functions: Calculations using COUNT, AVG, MAX, MIN, and SUM.
Conditional Clauses: Filtering with WHERE, IN, BETWEEN, LIKE, and pattern matching with wildcards.
Transaction Control:

Demonstrates ROLLBACK and COMMIT to maintain data integrity in transactions.
Views:

Complex views are created to provide a summarized, customer-centric view of movie rentals.
Stored Procedures:

Encapsulates frequently used SQL logic, such as customer data retrieval, in stored procedures.
Date and Time Manipulation:

Operations include date extraction, interval addition, and timezone handling.
Regular Expressions:

Leverages MySQL REGEXP functions for pattern matching and string manipulation.
