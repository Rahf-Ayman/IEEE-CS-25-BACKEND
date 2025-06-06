# MySQL Research

### **What is a Database and why does it exist?**
 
 A database is an organized collection of data that is stored and managed electronically.  
 It allows users to efficiently store, retrieve, update, and manage data.
 
 Before databases, people stored data in files and spreadsheets,  
 but as data grew, these methods became inefficient. Databases solve several problems, including:
 
 - **Efficient Data Management** – Databases allow quick searching, sorting, and updating of data.
 - **Data Integrity & Consistency** – Ensures that data is accurate and consistent across multiple users.
 - **Security** – Databases provide user authentication and access control to protect sensitive information.
 - **Scalability** – They can handle large volumes of data and grow with application needs.
 - **Data Relationships** – With relational databases, data can be structured in a way that prevents redundancy and maintains relationships.

### **What is SQL?**
 
 SQL (Structured Query Language) is a programming language used to store, manage,  
 and manipulate data in relational databases.

### **What are the 5 most famous databases in the world now, and why?**
 
 - **Oracle Database** – Oracle Database is renowned for its robustness and scalability,  
   making it a preferred choice for large enterprises handling extensive and complex data operations.
 - **MySQL** – As an open-source relational DBMS, MySQL powers a substantial portion of websites globally.
 - **Microsoft SQL Server** – Developed by Microsoft, this relational DBMS is favored by many  
   organizations for its seamless integration with other Microsoft products.
 - **PostgreSQL** – PostgreSQL has experienced significant growth due to its advanced features,  
   extensibility, and standards compliance, making it a popular choice among developers.
 - **MongoDB** – A NoSQL database designed for handling large volumes of unstructured data,  
   making it ideal for applications requiring flexible and scalable data storage.

### What is RDBMS?
 
 RDBMS stands for Relational Database Management System , used to maintain a relational database and uses SQL queries to access the data in the database.

### RDBMS VS DBMS.
 
 | DBMS | RDBMS
 | :------- | :------- 
 | Data is stored in a database management system (DBMS) as a file. | Tables are used to store information.
 | In this architecture, data redundancy is common. | Data redundancy is not possible using keys and indexes.
 | There is no correlation between the data. | Data is kept in the form of tables that are linked together via foreign keys.
 | Normalization is not supported by DBMS. | A relational database management system (RDBMS) can be normalised.
 | For complicated and vast amounts of data, data retrieval takes longer. | Because of its relational methodology, data retrieval is quick.
 | The integrity constraints are not supported by DBMS. | RDBMS provides integrity constraints.
 | Data elements need to access individually. | Multiple data elements can be accessed at the same time.
 | It supports single user. | It supports multiple users.

### Naming conventions.
 
 These are sets of standards that are generally accepted by the majority of developers out there.
 Among all sorts of conventions, naming conventions are some of the most common. Because as programmers, we name a lot of things. Such as variables, functions, classes, methods, interfaces and so on.

 - **Camel Case**:  you start a name with a small letter. If the name has multiple words, the later words will start with a capital letter. <code>firstName</code>
 - **Snake Case**: you start the name with a small letter in snake case. If the name has multiple words, the later words will start with small letters and you use a underscore (_) to separate the words. <code>first_name</code>
 - **Kebab Case**: Kebab case is similar to snake case, but you use a hyphen (-) instead of an underscore (_) to separate the words. <code>first-name</code>
 - **Pascal Case**: names in pascal case start with a capital letter. In case of the names with multiple words, all words will start with capital letters. <code>FirstName</code> 

### Primary keys vs Unique keys.
  The primary key does not accept any duplicate and NULL values , but Uniqe key does not accept any duplicate only and accept only one NULL value for the column.

### MySQL Constraints
 - <code>NOT NULL</code> -> Ensures that a column cannot have a NULL value.
 - <code>UNIQUE</code> -> Ensures that all values in a column are different.
 - <code>PRIMARY KEY</code> -> A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table.
 - <code>FOREIGN KEY</code> -> Prevents actions that would destroy links between tables.
 - <code>CHECK</code> -> Ensures that the values in a column satisfies a specific condition.
 - <code>DEFAULT</code> -> Sets a default value for a column if no value is specified.
 - <code>CREATE INDEX</code> -> Used to create and retrieve data from the database very quickly.

### Indexing in MySQL.
  Indexes are used to find rows with specific column values quickly. Without an index, MySQL must begin with the first row and then read through the entire table to find the relevant rows. The larger the table, the more this costs.
  - **Simple Index** : A simple index is a basic type of index where the values inserted into the column, containing this index, are searched easily. In such case, the column can contain duplicate values or NULL.
  - **Unique Index**: A Unique index does not allow any duplicate values to be inserted into a table column (where the index is defined on).It can be added to single or multiple columns of a table. If it is added to a single column, the values of that column must be unique. But if it is added to multiple columns, the combination of values in these columns must be unique.
  - **Primary Key Index**: Primary Key Index is an extension of unique index, as the primary key column must always contain unique values and these values must not be NULL. Primary key can be set to a single column of a database table, or multiple columns as well.
  - **Fulltext Index**: In a database, sometimes you would have to search for a blob of text instead of a record. You can use fulltext index for it. As its name suggests, it is used to make the text searches in a table easier.
  - **Descending Index**: The descending index is only available in MySQL versions after 8.0. It is simple index used to store data in a reverse order. Using this index, it is easy to search for the latest values inserted into the database table.

### Difference between MySQL and Postgresql.
| MySQL | Postgresql
| :------- | :-------
| MySQL is a purely relational database management system.| 	PostgreSQL is an object-relational database management system. 
| MySQL has limited support of database features like views, triggers, and procedures. |PostgreSQL supports most advanced database features like materialized views, INSTEAD OF triggers, and stored procedures in multiple languages.
| MySQL supports numeric, character, date and time, spatial, and JSON data types. | PostgreSQL supports all MySQL data types along with geometric, enumerated, network address, arrays, ranges, XML, hstore, and composite.
| MySQL has B-tree and R-tree index support. | PostgreSQL supports multiple index types like expression indexes, partial indexes, and hash indexes along with trees.
| MySQL has improved performance for high-frequency read operations. | PostgreSQL has improved performance for high-frequency write operations.

### Relations
1. **One-to-One Relationship**
   - Definition: Each record in Table A is associated with one and only one record in Table B, and vice versa.
   - Setup: Include a foreign key in one of the tables that references the primary key of the other table.
1. **One-to-One Relationship** 
   - Definition: Each record in Table A can be associated with multiple records in Table B, but each record in Table B is associated with only one record in Table A.
   - Setup: Include a foreign key in the "many" side table (Table B) that references the primary key of the "one" side table (Table A).
1. **Many-to-Many Relationship** 
   - Definition: Each record in Table A can be associated with multiple records in Table B, and vice versa.
   - Setup: Create an intermediate table (also known as a junction or linking table) that contains foreign keys referencing both related tables.  

### Write-ahead logging.
Write-Ahead Logging (WAL) is a standard technique in databases to ensure data integrity and durability. The core idea is simple: before any changes are applied to the actual database, the changes are first written to a log. This guarantees that even if a system crash occurs, the database can be recovered by replaying the log. 

### What are normalization and denormalization?
| Normalization | Denormalization
| :------- | :-------
|In normalization, Non-redundancy and consistency data are stored in set schema.| In denormalization, data are combined to execute the query quickly. 
|In normalization, Data redundancy and inconsistency is reduced. |In denormalization, redundancy is added for quick execution of queries.
|Data integrity is maintained in normalization.| Data integrity is not maintained in denormalization.
| In normalization, redundancy is reduced or eliminated. |In denormalization, redundancy is added instead of reduction or elimination of redundancy.
| Number of tables in normalization is increased.| Denormalization, Number of tables in decreased.

### Multi-version concurrency Control
Multi-Version Concurrency Control is a technology,
utilized to enhance databases by resolving concurrency problems and also data locking by preserving older database versions. 
When many tasks attempt to update the same piece of data simultaneously, MVCC causes a conflict and necessitates a retry from one or more of the processes.
Types:
- **Timestamp-based MVCC**: The data visibility to transactions is defined by the unique timestamp assigned to each transaction that creates a new version of a record.
- **Hybrid MVCC**: This coordinates data flexibility and performance by combining two or more MVCC approaches.
- **History-based MVCC**: This Keeps track of every modification made to a record, making transaction rollbacks simple.

### Trigger
A trigger is a stored procedure in a database that automatically invokes whenever a special event in the database occurs. By using SQL triggers, developers can automate tasks, ensure data consistency, and keep accurate records of database activities. For example, a trigger can be invoked when a row is inserted into a specified table or when specific table columns are updated.
**Key Features of SQL Triggers**:
- **Automatic Execution**: Triggers fire automatically when the defined event occurs (e.g., INSERT, UPDATE, DELETE).
- **Event-Driven**: Triggers are tied to specific events that take place within the database.
- **Table Association**: A trigger is linked to a specific table or view, and operates whenever changes are made to the table’s data.

### How can you take the backup of a database?
steps:
1. Open Mysql.
2. Select your database from the left panel.
3. Click "Export" from the top menu.
4. Choose Export Method
5. click "start export"
the backup file (.sql) will be downloaded.

 
 ##### Resources
  *task 2*
 - [w3schools](https://www.w3schools.com/mysql/mysql_rdbms.asp)
 - [freecodecamp](https://www.freecodecamp.org/news/programming-naming-conventions-explained/)
 - [unacademy](https://unacademy.com/content/cbse-class-11/difference-between/dbms-and-rdbms/#:~:text=the%20database%20structure.-,Answer%3A%20The%20main%20differences%20are%3A,it%20is%20supported%20by%20RDBMS)
 - [geeksforgeeks](https://www.geeksforgeeks.org/difference-between-rdbms-and-dbms/)

 ---
   *task 3*
 - [geeksforgeeks](https://www.geeksforgeeks.org/difference-between-primary-key-and-unique-key/)
 - [w3schools](https://www.w3schools.com/mysql/mysql_constraints.asp)
 - [MySQL Decumentation](https://dev.mysql.com/doc/refman/8.4/en/mysql-indexes.html#:~:text=Indexes%20are%20used%20to%20find,table%2C%20the%20more%20this%20costs.)
 - [tutorialspoint](https://www.tutorialspoint.com/mysql/mysql-indexes.htm)
 - [Amazon](https://aws.amazon.com/compare/the-difference-between-mysql-vs-postgresql/#:~:text=Summary%20of%20differences%3A%20PostgreSQL%20vs%20MySQL,-Category&text=MySQL%20is%20a%20purely%20relational%20database%20management%20system.,object%2Drelational%20database%20management%20system.&text=MySQL%20has%20limited%20support%20of,views%2C%20triggers%2C%20and%20procedures.)

 ---
 *task 4*
 - [geeksforgeeks_normalization](https://www.geeksforgeeks.org/difference-between-normalization-and-denormalization/)
 - [geeksforgeeks_Relationship](https://www.geeksforgeeks.org/relationships-in-sql-one-to-one-one-to-many-many-to-many/)
- [Bytebase](https://www.bytebase.com/blog/write-ahead-logging/)

---
*task 5*
- [geeksforgeeks_MVCC](https://www.geeksforgeeks.org/what-is-multi-version-concurrency-control-mvcc-in-dbms/)
- [geeksforgeeks_trigger](https://www.geeksforgeeks.org/sql-trigger-student-database/)










