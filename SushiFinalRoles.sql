
IF DB_ID('SushiBar') IS NULL
THROW 50001, 'You did not run the DDL file yet and or correctly.', 1;
GO

IF DB_ID('SushiBar') IS NOT NULL
USE SushiBar;
GO

CREATE ROLE Service_Administrator -- Application Service Role, DDL, No DML, Makes changes to the schema but doesn't alter the data
GRANT ALTER, CONTROL, REFERENCES, VIEW DEFINITION TO Service_Administrator;
DENY INSERT, UPDATE, DELETE TO Service_Administrator;

CREATE ROLE Store1_Manager -- Able to read Menu, Reservations, Dine-In orders, and Online Orders TO ONLY STORE 1
GRANT SELECT ON Store1_Menu TO Store1_Manager;
GRANT SELECT ON Store1_Reservations TO Store1_Manager;
GRANT SELECT ON Store1_DineIn_Orders TO Store1_Manager;
GRANT SELECT ON Store1_Curbside_Orders TO Store1_Manager;
GRANT SELECT ON Store1_WalkIn_Orders TO Store1_Manager;
GRANT SELECT ON Store1_Delivery_Orders TO Store1_Manager;

CREATE ROLE Store2_Manager -- Able to read Menu, Reservations, Dine-In orders, and Online Orders TO ONLY STORE 2
GRANT SELECT ON Store2_Menu TO Store1_Manager;
GRANT SELECT ON Store2_Reservations TO Store1_Manager;
GRANT SELECT ON Store2_DineIn_Orders TO Store1_Manager;
GRANT SELECT ON Store2_Curbside_Orders TO Store1_Manager;
GRANT SELECT ON Store2_WalkIn_Orders TO Store1_Manager;
GRANT SELECT ON Store2_Delivery_Orders TO Store1_Manager;

CREATE ROLE Store1_Host -- Read Menu, Read and write to Dinner Reservations and Dine-In orders TO ONLY STORE 1
GRANT SELECT ON Store1_Menu TO Store1_Host;
GRANT SELECT ON Store1_Reservations TO Store1_Host;
GRANT SELECT ON Store1_DineIn_Orders TO Store1_Host;
GRANT SELECT, INSERT, UPDATE, DELETE ON Store1_Reservations TO Store1_Host;
GRANT SELECT, INSERT, UPDATE, DELETE ON Store1_DineIn_Orders TO Store1_Host;

CREATE ROLE Store2_Host -- Read Menu, Read and write to Dinner Reservations and Dine-In orders TO ONLY STORE 2
GRANT SELECT ON Store2_Menu TO Store2_Host;
GRANT SELECT ON Store2_Reservations TO Store2_Host;
GRANT SELECT ON Store2_DineIn_Orders TO Store2_Host;
GRANT SELECT, INSERT, UPDATE, DELETE ON Store2_Reservations TO Store2_Host;
GRANT SELECT, INSERT, UPDATE, DELETE ON Store2_DineIn_Orders TO Store2_Host;

--
-- Pseudocode for the things I would have implemented next if this wasn't on such a time crunch:

-- The online orders will be automatically sent to a Cook, Sous Chef, and or Head Chef
-- Cook will only have Read permissions on Menu, Online Orders and Ingredients for their store
-- Sous Chefs will have Read permissions on Menu, and Online Orders, but will be able to edit DML for Ingredients
-- Head Chefs will have Read permissions on Online Orders, but will be able to edit DML for Menu and Ingredients