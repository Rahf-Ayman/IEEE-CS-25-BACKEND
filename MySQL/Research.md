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

 ##### Resources
 - [w3schools](https://www.w3schools.com/mysql/mysql_rdbms.asp)
 - [freecodecamp](https://www.freecodecamp.org/news/programming-naming-conventions-explained/)
 - [unacademy](https://unacademy.com/content/cbse-class-11/difference-between/dbms-and-rdbms/#:~:text=the%20database%20structure.-,Answer%3A%20The%20main%20differences%20are%3A,it%20is%20supported%20by%20RDBMS)
 - [geeksforgeeks](https://www.geeksforgeeks.org/difference-between-rdbms-and-dbms/)








