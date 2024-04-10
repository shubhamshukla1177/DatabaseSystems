-- assignment: Project Component 2
-- course: CS 550 Database Systems
-- professor: Dr. Wassim Itani

-- Customers table holds the customer personal information
CREATE TABLE Customers (
    cid NUMBER PRIMARY KEY,
    cname VARCHAR2(50),
    gender CHAR(1),
    ssn VARCHAR2(11),
    occupation VARCHAR2(50),
    is_member NUMBER(1),
    mstatus VARCHAR2(20),
    dob DATE,
    email VARCHAR2(100)
);

-- Customer_Phones table holds the customer's phone numbers
CREATE TABLE Customer_Phones(
    phone_number VARCHAR2(10),
    customer_id NUMBER,
    PRIMARY KEY (phone_number, customer_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(cid) ON DELETE CASCADE
);

-- Customer_Addresses table holds the customer's address information such as street, apt, city, state, and zip
CREATE TABLE Customer_Addresses(
    street VARCHAR2(50),
    apt VARCHAR2(30),
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip VARCHAR2(10),
    customer_id NUMBER,
    PRIMARY KEY (street, apt, city, state, zip),
    FOREIGN KEY (customer_id) REFERENCES Customers(cid) ON DELETE CASCADE
);

-- Prizes table holds the information of the prize
CREATE TABLE Prizes (
    prize_id NUMBER PRIMARY KEY,
    p_description VARCHAR2(100),
    points_needed NUMBER
);

-- ExchgCenters table holds information of the exchange center
CREATE TABLE ExchgCenters(
    center_id NUMBER PRIMARY KEY,
    c_location VARCHAR2(50),
    center_name VARCHAR2(50)
);

-- Points_Accounts table holds the point account number and number of points
CREATE TABLE Points_Accounts(
    point_acct_no NUMBER PRIMARY KEY,
    num_of_points NUMBER,
    customer_id NUMBER,
    FOREIGN KEY (customer_id) REFERENCES Customers (cid) ON DELETE CASCADE
);

-- Prizes_Customers (Redeem relation) table holds the customer's redeemed prizes. 
-- It also connects the aggregation between Prizes and Customers (related by Redeem) to ExchangeCenters and Point_Accounts
CREATE TABLE Prizes_Customers (
    customer_id NUMBER,
    prize_id NUMBER,
    quantity NUMBER,
    r_date DATE,
    center_id NUMBER,
    point_acct_no NUMBER,
    PRIMARY KEY (customer_id, prize_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(cid) ON DELETE CASCADE,
    FOREIGN KEY (prize_id) REFERENCES Prizes(prize_id) ON DELETE CASCADE,
    FOREIGN KEY (center_id) REFERENCES ExchgCenters(center_id) ON DELETE CASCADE,
    FOREIGN KEY (point_acct_no) REFERENCES Points_Accounts(point_acct_no) ON DELETE CASCADE
);

-- Login table holds the login credentials (username and password) for the customer
CREATE TABLE Login (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(50),
    customer_id NUMBER UNIQUE,
    FOREIGN KEY (customer_id) REFERENCES Customers (cid) ON DELETE CASCADE
);

-- Transactions table holds information of transactions
CREATE TABLE Transactions (  
    tref NUMBER PRIMARY KEY,
    cashier_name VARCHAR2(50),
    t_description VARCHAR2(50),
    t_points NUMBER,
    t_time TIMESTAMP,
    t_date DATE,
    amount NUMBER,  
    customer_id NUMBER,  
    point_account_id NUMBER,
    FOREIGN KEY (customer_id) REFERENCES Customers (cid) ON DELETE CASCADE,
    FOREIGN KEY (point_account_id) REFERENCES Points_Accounts (point_acct_no) ON DELETE CASCADE
);

-- Products table holds information of products
CREATE TABLE Products (  
    prod_id NUMBER PRIMARY KEY,  
    prod_name VARCHAR2(50),  
    price NUMBER(38,2),  
    prod_points NUMBER
); 

-- Transactions_Products (Contain relation) table holds the products and quantity of a transaction
CREATE TABLE Transactions_Products(
    transaction_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    PRIMARY KEY (transaction_id, product_id),
    FOREIGN KEY (transaction_id) REFERENCES Transactions(tref),
    FOREIGN KEY (product_id) REFERENCES Products(prod_id)
);

-- Families table holds a customer's family information
CREATE TABLE Families (
    family_id NUMBER PRIMARY KEY,
    num_members NUMBER,
    family_name VARCHAR2(50),
    point_acct_no NUMBER,
    customer_id NUMBER,
    FOREIGN KEY (point_acct_no) REFERENCES Points_Accounts (point_acct_no) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customers (cid) ON DELETE CASCADE
);

-- Cards table holds information of the loyalty card
CREATE TABLE Cards (
    card_id NUMBER,
    status VARCHAR2(50),
    exp_date DATE,
    c_date DATE,
    customer_id NUMBER,
    PRIMARY KEY (card_id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES Customers (cid) ON DELETE CASCADE
);

-- Offers table holds information of the existent offers
CREATE TABLE Offers (
    offer_id NUMBER PRIMARY KEY,
    action VARCHAR2(50),
    o_date DATE,
    o_description VARCHAR2(50)
);

-- Offers_Transactions (Apply relation) table holds the offer applied to a transaction
CREATE TABLE Offers_Transactions (
    offer_id NUMBER,
    tref NUMBER,    
    PRIMARY KEY (offer_id, tref),
    FOREIGN KEY (offer_id) REFERENCES Offers(offer_id) ON DELETE CASCADE,
    FOREIGN KEY (tref) REFERENCES Transactions(tref)  ON DELETE CASCADE
);

-- Branches table holds information of the LoyaltyFirst branches
CREATE TABLE Branches (
    branch_id NUMBER PRIMARY KEY,
    branch_name VARCHAR2(50),
    b_location VARCHAR2(50),
    opening_hours VARCHAR2(50)
);

-- Branches_Offers (Apply_Offer relation) table holds the offers provided by branch
CREATE TABLE Branches_Offers (
    branch_id NUMBER,
    offer_id NUMBER,
    PRIMARY KEY (branch_id, offer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)  ON DELETE CASCADE,
    FOREIGN KEY (offer_id) REFERENCES Offers(offer_id) ON DELETE CASCADE
);
