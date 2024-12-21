# Greenspot-Grocer-Database-Project
Greenspot Grocer Database ProjectGreenspot Grocer is a (fictional) small, family-owned online grocery store that is growing rapidly and planning a major expansion. They are currently storing their product data in a spreadsheet format that has become unwieldy and will soon be unable to accommodate their growing inventory. 

## Overview
This project involved transforming Greenspot Grocer's spreadsheet data into a well-structured relational database using MySQL Workbench. The goal was to address inconsistencies in the original dataset, create a scalable solution for inventory management and sales reporting, and support the business's future growth.

---

## Project Objectives
1. Analyze and identify anomalies in the original dataset.
2. Design and implement a normalized relational database schema.
3. Create and populate database tables using MySQL Workbench.
4. Test the database using SQL queries for insights and validation.
5. Provide recommendations for future improvements.

---

## Steps Followed

### 1. Setup
- **Tools Installed**:
  - MySQL Server
  - MySQL Workbench
- **Connection**:
  - Established a connection to the MySQL Server from Workbench for database creation and management.

---

### 2. Planning
- **Dataset Analysis**:
  - Reviewed the provided spreadsheet to identify:
    - Key entities (`Products`, `Vendors`, `Inventory`, `Orders`).
    - Data anomalies such as missing vendor IDs and incomplete inventory records.
  - Identified logical relationships between the entities.

---

### 3. Database Design
- **Entity-Relationship (ER) Diagram**:
  - Created an ER Diagram in MySQL Workbench to visualize the database structure.
  - Designed relationships:
    - `Products` linked to `Vendors` via `VendorID`.
    - `Inventory` and `Orders` linked to `Products` via `ItemNum`.

- **Normalization**:
  - Split data into separate tables to reduce redundancy and improve scalability.

---

### 4. Table Creation
Implemented the following database schema:

#### Vendors Table
| Column      | Type         | Description                     |
|-------------|--------------|---------------------------------|
| VendorID    | VARCHAR(50)  | Primary Key, unique vendor ID. |
| VendorName  | VARCHAR(255) | Name of the vendor.            |

#### Products Table
| Column      | Type         | Description                        |
|-------------|--------------|------------------------------------|
| ItemNum     | INT          | Primary Key, unique product ID.   |
| Description | VARCHAR(255) | Description of the product.       |
| ItemType    | VARCHAR(50)  | Type/category of the product.     |
| Location    | VARCHAR(20)  | Product storage location.         |
| Unit        | VARCHAR(50)  | Unit of measurement (e.g., dozen).|
| VendorID    | VARCHAR(50)  | Foreign Key, references Vendors.  |

#### Inventory Table
| Column          | Type         | Description                              |
|------------------|--------------|------------------------------------------|
| ItemNum          | INT          | Primary Key, Foreign Key referencing Products. |
| QuantityOnHand   | INT          | Current stock quantity.                 |
| PurchaseDate     | DATE         | Last stock purchase date.               |
| Location         | VARCHAR(20)  | Inventory location.                     |

#### Orders Table
| Column   | Type          | Description                          |
|----------|---------------|--------------------------------------|
| OrderID  | INT (Auto-Inc) | Primary Key, unique order ID.       |
| CustID   | INT           | Customer identifier.                |
| ItemNum  | INT           | Foreign Key, references Products.   |
| Quantity | INT           | Quantity ordered.                   |
| Price    | DECIMAL(10,2) | Price per unit at the time of sale. |
| DateSold | DATE          | Date the order was sold.            |

---

### 5. Data Import
- **Source**:
  - Split the original dataset into separate CSV files for `Products`, `Vendors`, `Inventory`, and `Orders`.
- **Import**:
  - Used MySQL Workbench’s Data Import Wizard to load data into the respective tables.
- **Data Cleaning**:
  - Validated and cleaned data to ensure proper formatting and remove inconsistencies.

---

### 6. Testing and Validation
Executed SQL queries to test the database's functionality and relationships:

#### Sample Queries
1. **Retrieve Products and Their Vendors**:
   ```sql
   SELECT 
       p.ItemNum, p.Description, v.VendorName
   FROM 
       Products p
   INNER JOIN 
       Vendors v
   ON 
       p.VendorID = v.VendorID;

2. **Check Inventory Details**:
   ```sql
   SELECT
       p.ItemNum, p.Description, i.QuantityOnHand, i.PurchaseDate
   FROM 
       Products p
   INNER JOIN 
       Inventory i
   ON 
       p.ItemNum = i.ItemNum; 

3. **Monthly Revenue**:
   ```sql
   SELECT 
       YEAR(o.DateSold) AS SaleYear,
       MONTH(o.DateSold) AS SaleMonth,
       SUM(o.Quantity * o.Price) AS TotalRevenue
   FROM 
       Orders o
   GROUP BY 
       YEAR(o.DateSold), MONTH(o.DateSold);

### Results
1. Successfully normalized and structured the data into a relational database.
2. Queries demonstrated:
   - Revenue and order trends by month.
   - Products contributing the most revenue.
   - Inventory levels and out-of-stock products.

## Recommendations for Future Improvements
1. Add a Customer Table:
   - Track customer details and link orders to customers.
2. Advanced Inventory Tracking:
   - Include restocking dates and track stock movements.
3. Analytics and Alerts:
   - Add stored procedures for low-stock notifications.
   - Enable advanced reporting (e.g., profitability analysis).
4. Data Cleaning Automation:
   - Implement a pipeline to validate and clean data before import.

## Tools Used
1. Python3 (Jupyter Notebook): For data cleaning and aggregation.
2. MySQL Workbench: For schema design, table creation, and data import.
3. MySQL Server: For database hosting and query execution.
4. Microsoft Excel: To clean and split raw data into tables.

## Conclusion
This project successfully transformed raw spreadsheet data into a scalable and normalized relational database. The database is robust, supports business growth, and provides valuable insights for decision-making.
