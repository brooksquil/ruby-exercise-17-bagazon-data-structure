CREATE TABLE `Customers` (
    `customer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`last_name` TEXT NOT NULL,
	`first_name` TEXT NOT NULL,
	`date_customer_created` DATE NOT NULL,
	`date_last_active` DATE NOT NULL,
	`active` BOOLEAN NOT NULL,
	`email` TEXT NOT NULL UNIQUE,
	`street_address` TEXT NOT NULL,
	`city` TEXT NOT NULL,
	`us_state` TEXT NOT NULL,
	`zipcode` INTEEGER NOT NULL,
	`phone_number` INTEGER NOT NULL,
	FOREIGN KEY(`product`) REFERENCES `Products` (`product`),
	FOREIGN KEY(`payment_type`) REFERENCES `Payment_Types` (`payment_type`),
	FOREIGN KEY(`orderID`) REFERENCES `Orders` (`orderID`),

);

CREATE TABLE `Products` (
	`product` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`product_title` TEXT NOT NULL,
	`product_price` FLOAT NOT NULL,
	`product_description` DATE NOT NULL,
	FOREIGN KEY(`product_type`) REFERENCES `Product_Types` (`product_type`),
	FOREIGN KEY(`customer`) REFERENCES `Customers` (`customer`),
);

CREATE TABLE `Product_Types` (
	`product_type` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`product_type_name` TEXT NOT NULL,
);

CREATE TABLE `Orders` (
	`orderID` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`shipped` BOOLEAN NOT NULL,
	`delivered` BOOLEAN NOT NULL,
	FOREIGN KEY(`product`) REFERENCES `Products` (`product`),
	FOREIGN KEY(`customer`) REFERENCES `Customers` (`customer`),
	FOREIGN KEY(`payment_type`) REFERENCES `Payment_Types` (`payment_type`),
);

CREATE TABLE `Payment_Types` (
	`payment_type` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`payment_card_type` TEXT NOT NULL,
	`account_number` INTEGER NOT NULL,
	FOREIGN KEY(`customer`) REFERENCES `Customers` (`customer`)
);
	
CREATE TABLE `Employees` (
    `employee` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`last_name` TEXT NOT NULL,
	`first_name` TEXT NOT NULL,
	`date_employee_hired` DATE NOT NULL,
	`job_title` TEXT NOT NULL,
	`active` BOOLEAN NOT NULL,
	`email` TEXT NOT NULL UNIQUE,
	`street_address` TEXT NOT NULL,
	`city` TEXT NOT NULL,
	`us_state` TEXT NOT NULL,
	`zipcode` INTEGER NOT NULL,
	`phone_number` INTEGER NOT NULL,
	FOREIGN KEY(`department`) REFERENCES `Departments` (`department`),
	FOREIGN KEY(`training_program`) REFERENCES `Training_Programs` (`training_program`),
	FOREIGN KEY(`employee_type`) REFERENCES `Employee_Types` (`employee_type`),
	FOREIGN KEY(`computer`) REFERENCES `Computers` (`computer`)
);
	
CREATE TABLE `Departments` (
	`department` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`supervisor` TEXT NOT NULL,
	`expense_budget` INTEGER NOT NULL,
	FOREIGN KEY(`employee_type`) REFERENCES `Employee_Types` (`employee_type`)
);

CREATE TABLE `Employee_Types` (
	`employee_type` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`employee_type_name` TEXT NOT NULL,
);

CREATE TABLE `Computers` (
	`computer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`purchase_date` DATE NOT NULL,
	`decomission_date` DATE NOT NULL,
	FOREIGN KEY(`employee`) REFERENCES `Employees` (`employee`)
	);
	
CREATE TABLE `Training_Programs` (
	`training_program` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`instructor` TEXT NOT NULL,
	`subject_of_training` TEXT NOT NULL,
	`max_occupancy` INTEGER NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`decomission_date` DATE NOT NULL,
	FOREIGN KEY(`employee`) REFERENCES `Employees` (`employee`)
);

