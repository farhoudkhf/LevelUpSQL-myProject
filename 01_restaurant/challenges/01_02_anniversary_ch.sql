-- Create a table in the database to store customer
-- responses to our anniversary invitation.

-- Associate a customer's ID number with the number of people
-- they plan to bring in their party.

-- Hint: SQLite offers the INTEGER and REAL datatypes

CREATE TABLE IF NOT EXISTS responses_from_customer(
    customerID INTEGER, 
    numberOfGuests INTEGER,
    FOREIGN KEY (customerID) REFERENCES Customers(CustomerID)
);


-- get table info
PRAGMA table_info(AnniversaryAttendees);

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- DROP TABLE IF EXISTS responses_from_customerTBD;