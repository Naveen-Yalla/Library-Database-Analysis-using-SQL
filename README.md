# Library Database Management System
A structured SQL-based project to efficiently manage the operations of a library, including book cataloging, branch inventories, publishers, borrowers, and lending activities.

# Project Overview
This Library Management System models a complete set of library operations using a relational database design. The system demonstrates practical SQL skills and data management concepts by interlinking real-world entities such as books, authors, publishers, borrowers, and branches.

## ER Diagram
The project is based on a detailed Entity-Relationship (ER) diagram that models the core entities and their relationships within a library system.
The ER diagram visually represents:

**Entities:** such as Books, Authors, Publishers, Library Branches, Borrowers, and Book Loans.

**Relationships:** including which authors wrote which books, which publisher owns which book, how many copies of each book are available at each branch, and borrower loan associations.

**Cardinality and Constraints:** defining one-to-many and many-to-many relationships with appropriate foreign keys ensuring data integrity.

This ER diagram acts as the foundation for the relational database schema implemented in SQL and guides the creation of all tables, keys, and constraints to accurately represent real-world library operations.

## Features
- Store detailed records for books, authors, and publishers.
- Track book copies at individual library branches.
- Record borrowing and lending history for each borrower.
- Support for complex queries on book availability, branch inventories, and borrower activity.
- Retrieve reports like overdue books, branch loan summaries, and most active borrowers.
- Comprehensive Query Analytics such as active borrowers, popular books, usage statistics per branch, trend analysis, and more.
- Branch-Level Management like See, compare, and report on stock, loans, and activity at each branch.

## Technologies Used
- SQL: Schema design, constraint management, data manipulation.
- MySQL: Used MySQL software to communicate with Relational Database Management System(RDBMS).
- CSV files: Populate tables with sample data.
