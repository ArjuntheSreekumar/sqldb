# Cozyspot MySQL Database Project

## 📘 Project Overview

Cozy spot is a fictional Mediterranean-style restaurant designed as part of a MySQL database project. The project models customer management, booking records, and course offerings through structured relational tables and demonstrates the use of SQL queries, constraints, views, procedures, and functions.

## 📁 Database Structure

### 🗃️ Tables

* **Customers** – Stores customer ID, name, and contact.
* **Bookings** – Tracks table bookings, dates, and guest numbers.
* **Courses** – Lists menu items and prices.
* **DeliveryAddress** – Captures delivery location and type.

### 🔧 Operations

* Created database and tables using `CREATE DATABASE`, `CREATE TABLE`.
* Populated tables using `INSERT`.
* Used `ALTER` to extend schemas.
* Enforced data integrity with `PRIMARY KEY`, `UNIQUE`, `FOREIGN KEY` constraints.

## 🛠️ SQL Concepts Demonstrated

### 1. **Filtering Data**

```sql
SELECT * FROM Bookings WHERE BookingDate BETWEEN '2022-10-02' AND '2022-10-04';
```

### 2. **JOINs**

```sql
SELECT Customers.FullName, Bookings.BookingID
FROM Customers
RIGHT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
WHERE BookingDate = '2022-10-02';
```

### 3. **Grouping & Aggregation**

```sql
SELECT BookingDate, COUNT(*) FROM Bookings GROUP BY BookingDate;
```

### 4. **Views**

```sql
CREATE VIEW BookingsView AS
SELECT BookingID, BookingDate, NumberOfGuests
FROM Bookings
WHERE NumberOfGuests > 3 AND BookingDate < '2022-10-04';
```

### 5. **Stored Procedures**

```sql
DELIMITER //
CREATE PROCEDURE GetBookingsData (IN InputDate DATE)
BEGIN
  SELECT * FROM Bookings WHERE BookingDate = InputDate;
END //
DELIMITER ;
```

### 6. **String Functions**

```sql
SELECT CONCAT("ID: ", BookingID, ', Date: ', BookingDate, ', Number of guests: ', NumberOfGuests) AS "Booking Details"
FROM Bookings;
```

## 🧪 How to Run

1. Open MySQL Workbench or CLI.
2. Run the SQL script provided in `cozy_corner.sql`.
3. Use the provided queries to test views, procedures, and filters.

## 📂 Repository Structure

```
├── main.sql       # Complete SQL script
├── README.md             # Project documentation
```

## 🔍 Learning Outcomes

* Hands-on practice with relational database modeling.
* Familiarity with MySQL DDL, DML, and procedural SQL.
* Experience writing reusable components like views and procedures.

---

🔗 [Project Repository](https://github.com/yourusername/cozy_corner)

Feel free to fork, modify, or contribute!
