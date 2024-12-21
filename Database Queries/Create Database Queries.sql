-- Step 1: Create the database
CREATE DATABASE GreenspotGrocerDB;
USE GreenspotGrocerDB;

-- Step 2: Create the Vendors table
CREATE TABLE Vendors (
    VendorID VARCHAR(50) PRIMARY KEY, 		 -- Unique identifier for each vendor
    VendorName VARCHAR(255)                  -- Vendor's name or company information
);

-- Step 3: Create the Products table
CREATE TABLE Products (
    ItemNum INT PRIMARY KEY,                 -- Unique identifier for each product
    Description VARCHAR(255),                -- Product description
    ItemType VARCHAR(50),                    -- Category/type of the product
    Location VARCHAR(20),                    -- Storage location
    Unit VARCHAR(50),                        -- Unit of measurement (e.g., dozen, bunch, etc.)
    VendorID VARCHAR(50),                    -- Foreign key to Vendors
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID) -- Linking to Vendors
);

-- Step 4: Create the Inventory table
CREATE TABLE Inventory (
    ItemNum INT PRIMARY KEY,                 -- Unique identifier for inventory (same as ItemNum in Products)
    QuantityOnHand INT,                      -- Quantity available in stock
    PurchaseDate DATE,                       -- Date of purchase
    Location VARCHAR(20),                    -- Storage location
    FOREIGN KEY (ItemNum) REFERENCES Products(ItemNum) -- Linking to Products
);

-- Step 5: Create the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order
    CustID INT,                              -- Customer identifier
    ItemNum INT,                             -- Foreign key linking to Products
    Quantity INT,                            -- Quantity ordered
    Price DECIMAL(10, 2),                    -- Selling price per unit
    DateSold DATE,                           -- Date of the sale
    FOREIGN KEY (ItemNum) REFERENCES Products(ItemNum) -- Linking to Products
);


