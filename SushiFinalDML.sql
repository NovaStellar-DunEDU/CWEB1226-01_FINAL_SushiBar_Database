IF DB_ID('SushiBar') IS NULL
THROW 50001, 'You did not run the DDL file yet and or correctly.', 1;
GO

IF DB_ID('SushiBar') IS NOT NULL
USE SushiBar;
GO

INSERT INTO StoreCountry (CountryName)
VALUES
('United States');
GO

INSERT INTO StoreTerritory (TerritoryName, StoreCountryID)
VALUES
('Minnesota', 1), ('Colorado', 1);
GO

INSERT INTO StoreZipcode (ZipcodeEntry)
VALUES
(55401), (80203);
GO

INSERT INTO StoreCity (StoreTerritoryID, CityName, StoreZipcodeID)
VALUES
(1, 'Minneapolis', 1), (2, 'Denver', 2);
GO

INSERT INTO StoreStreet (StoreCityID, StreetName)
VALUES
(1, '563 Main Street'), (2, '1450 Grant Street');
GO

INSERT INTO Store (StoreName, OpenTime, CloseTime)
VALUES
('Cresent Sushi Bar @ Minneapolis', '10:00', '22:00'),
('Cresent Sushi Bar @ Denver', '10:00', '22:00');
GO

INSERT INTO StoreLocation (StoreID, StoreStreetID)
VALUES
(1, 1), (2, 2);
GO

INSERT INTO StoreEmail (StoreLocationID, StoreEmail)
VALUES
(1, 'Minneapolis_CresentSushiBar_Support@gmail.com'),
(2, 'Denver_CresentSushiBar_Support@gmail.com');
GO

INSERT INTO StorePhone (StoreLocationID, StorePhoneNumber)
VALUES
(1, '1+ 612-985-7433'), (2, '1+ 303-682-4827');
GO

INSERT INTO MenuItems (StoreLocationID, Category, ItemName, ItemDescription, ItemPrice)
VALUES
(1, 'Appetizers', 'Edamame', 'Steamed young soybeans tossed in sea salt', 5.50),
(1, 'Appetizers', 'Gyoza', 'Pan-fried pork dumplings with garlic, ginger, and soy dipping sauce', 7.00),
(1, 'Appetizers', 'Seaweed Salad', 'Marinated seaweed with sesame oil and seeds', 6.25),
(1, 'Appetizers', 'Tempura Shrimp', 'Lightly battered shrimp fried crispy with tempura dipping sauce', 9.50),
(1, 'Appetizers', 'Miso Soup', 'Traditional soybean broth with tofu, seaweed, and green onions', 4.00),

(1, 'Rolls', 'California Roll', 'Crab, avocado, and cucumber wrapped in sushi rice and seaweed', 8.50),
(1, 'Rolls', 'Spicy Tuna Roll', 'Fresh tuna mixed with spicy mayo and rolled with rice and nori', 9.25),
(1, 'Rolls', 'Dragon Roll', 'Eel and cucumber inside, topped with avocado and eel sauce', 12.50),
(1, 'Rolls', 'Veggie Roll', 'Avocado, cucumber, carrot, and pickled radish', 7.75),
(1, 'Rolls', 'Rainbow Roll', 'California roll topped with assorted sashimi', 13.75),

(1, 'Entrees', 'Chicken Teriyaki', 'Grilled chicken glazed with teriyaki sauce, served with rice and veggies', 14.00),
(1, 'Entrees', 'Salmon Teriyaki', 'Grilled salmon with sweet teriyaki glaze and steamed vegetables', 16.50),
(1, 'Entrees', 'Sushi Combo', 'Assorted nigiri and a tuna roll served with miso soup', 18.75),
(1, 'Entrees', 'Tofu Stir Fry', 'Stir-fried tofu with mixed vegetables in savory soy-ginger sauce', 13.25),
(1, 'Entrees', 'Beef Udon', 'Thick udon noodles in broth with sliced beef and green onions', 15.50);
GO

INSERT INTO MenuItems (StoreLocationID, Category, ItemName, ItemDescription, ItemPrice)
VALUES
(2, 'Appetizers', 'Edamame', 'Steamed young soybeans tossed in sea salt', 5.50),
(2, 'Appetizers', 'Gyoza', 'Pan-fried pork dumplings with garlic, ginger, and soy dipping sauce', 7.00),
(2, 'Appetizers', 'Seaweed Salad', 'Marinated seaweed with sesame oil and seeds', 6.25),
(2, 'Appetizers', 'Tempura Shrimp', 'Lightly battered shrimp fried crispy with tempura dipping sauce', 9.50),
(2, 'Appetizers', 'Miso Soup', 'Traditional soybean broth with tofu, seaweed, and green onions', 4.00),

(2, 'Rolls', 'California Roll', 'Crab, avocado, and cucumber wrapped in sushi rice and seaweed', 8.50),
(2, 'Rolls', 'Spicy Tuna Roll', 'Fresh tuna mixed with spicy mayo and rolled with rice and nori', 9.25),
(2, 'Rolls', 'Dragon Roll', 'Eel and cucumber inside, topped with avocado and eel sauce', 12.50),
(2, 'Rolls', 'Veggie Roll', 'Avocado, cucumber, carrot, and pickled radish', 7.75),
(2, 'Rolls', 'Rainbow Roll', 'California roll topped with assorted sashimi', 13.75),

(2, 'Entrees', 'Chicken Teriyaki', 'Grilled chicken glazed with teriyaki sauce, served with rice and veggies', 14.00),
(2, 'Entrees', 'Salmon Teriyaki', 'Grilled salmon with sweet teriyaki glaze and steamed vegetables', 16.50),
(2, 'Entrees', 'Sushi Combo', 'Assorted nigiri and a tuna roll served with miso soup', 18.75),
(2, 'Entrees', 'Tofu Stir Fry', 'Stir-fried tofu with mixed vegetables in savory soy-ginger sauce', 13.25),
(2, 'Entrees', 'Beef Udon', 'Thick udon noodles in broth with sliced beef and green onions', 15.50);
GO

INSERT INTO CustomerName (FirstName, MiddleInital, LastName)
VALUES
('John','A','Walker'),
('Emily','B','Hughes'),
('Michael','C','Turner'),
('Sarah','D','Benson'),
('David','E','Carter'),
('Olivia','F','Reed'),
('Daniel','G','Morgan'),
('Sophia','H','Price'),
('Andrew','I','Foster'),
('Chloe','J','Hayes'),
('Ethan','K','Parker'),
('Ava','L','Brooks'),
('Ryan','M','Coleman'),
('Lily','N','Stewart'),
('Jacob','O','Sullivan'),
('Grace','P','Holland'),
('Anthony','Q','Barrett'),
('Hannah','R','Walters'),
('Samuel','S','Jennings'),
('Ella','T','Manning'),
('Joseph','U','Harper'),
('Zoe','V','Fleming'),
('Christopher','W','Doyle'),
('Natalie','X','Sharp'),
('Joshua','Y','Keller'),
('Mia','Z','Baldwin'),
('Benjamin','A','Rhodes'),
('Aria','B','Dalton'),
('Logan','C','Vargas'),
('Scarlett','D','Conrad'),
('Henry','E','Merritt'),
('Victoria','F','Santos'),
('Owen','G','Barker'),
('Penelope','H','Harrington'),
('Jack','I','Whitman'),
('Layla','J','Finley'),
('Gabriel','K','Norris'),
('Nora','L','Pruitt'),
('Isaac','M','Shepherd'),
('Camila','N','Hampton'),
('Julian','O','Benson'),
('Aubrey','P','Griffin'),
('Wyatt','Q','Dawson'),
('Harper','R','Lambert'),
('Luke','S','Chandler'),
('Eleanor','T','Benson'),
('Grayson','U','Harrington'),
('Stella','V','Maddox'),
('Levi','W','Carson'),
('Violet','X','Mercer');
GO

INSERT INTO CustomerCountry (CustomerCountryName)
VALUES
('United States');
GO

INSERT INTO CustomerTerritory (CustomerCountryID, CustomerTerritoryName)
VALUES
(1,'Minnesota'), (1, 'Colorado');
GO

INSERT INTO CustomerZipCode (CustomerZipcodeEntry)
VALUES
('55401'),('55402'),('55403'),('55404'),('55405'),
('55406'),('55407'),('55408'),('55409'),('55410'),
('55411'),('55412'),('55413'),('55414'),('55415'),
('55416'),('55417'),('55418'),('55419'),('55420'),
('55421'),('55422'),('55423'),('55424'),('55425');
GO

INSERT INTO CustomerZipCode (CustomerZipcodeEntry)
VALUES
('80202'),('80203'),('80204'),('80205'),('80206'),
('80207'),('80209'),('80210'),('80211'),('80212'),
('80214'),('80215'),('80219'),('80220'),('80221'),
('80222'),('80224'),('80226'),('80227'),('80228'),
('80012'),('80013'),('80014'),('80015'),('80123');
GO

INSERT INTO CustomerCity (CustomerTerritoryID, CityName, CustomerZipCodeID)
VALUES
(1,'Minneapolis',1),(1,'Minneapolis',2),(1,'Minneapolis',3),(1,'Minneapolis',4),(1,'Minneapolis',5),
(1,'Minneapolis',6),(1,'Minneapolis',7),(1,'Minneapolis',8),(1,'Minneapolis',9),(1,'Minneapolis',10),
(1,'St Paul',11),(1,'St Paul',12),(1,'St Paul',13),(1,'St Paul',14),(1,'St Paul',15),
(1,'Bloomington',16),(1,'Bloomington',17),(1,'Bloomington',18),(1,'Bloomington',19),(1,'Bloomington',20),
(1,'Brooklyn Park',21),(1,'Brooklyn Center',22),(1,'Fridley',23),(1,'Columbia Heights',24),(1,'Coon Rapids',25);
GO

INSERT INTO CustomerCity (CustomerTerritoryID, CityName, CustomerZipCodeID)
VALUES
(2,'Denver',26),(2,'Denver',27),(2,'Denver',28),(2,'Denver',29),(2,'Denver',30),
(2,'Denver',31),(2,'Denver',32),(2,'Denver',33),(2,'Denver',34),(2,'Denver',35),
(2,'Lakewood',36),(2,'Lakewood',37),(2,'Denver',38),(2,'Denver',39),(2,'Westminster',40),
(2,'Denver',41),(2,'Denver',42),(2,'Lakewood',43),(2,'Lakewood',44),(2,'Lakewood',45),
(2,'Aurora',46),(2,'Aurora',47),(2,'Aurora',48),(2,'Aurora',49),(2,'Littleton',50);
GO


INSERT INTO CustomerStreet (CustomerCityID, StreetName)
VALUES
-- MINNESOTA STREET NAMES (1–25)
(1,'Hennepin Ave'),
(2,'University Ave SE'),
(3,'Nicollet Mall'),
(4,'Washington Ave S'),
(5,'Franklin Ave'),
(6,'Lake St E'),
(7,'Lyndale Ave S'),
(8,'Chicago Ave'),
(9,'Broadway St NE'),
(10,'Lowry Ave N'),
(11,'Grand Ave'),
(12,'Summit Ave'),
(13,'Snelling Ave'),
(14,'Selby Ave'),
(15,'Lexington Pkwy'),
(16,'France Ave S'),
(17,'Penn Ave S'),
(18,'Portland Ave'),
(19,'Cedar Ave'),
(20,'American Blvd W'),
(21,'Brooklyn Blvd'),
(22,'Shingle Creek Pkwy'),
(23,'East River Rd'),
(24,'Central Ave NE'),
(25,'Coon Rapids Blvd'),

-- COLORADO STREET NAMES (26–50)
(26,'Colfax Ave'),
(27,'Broadway'),
(28,'Federal Blvd'),
(29,'Speer Blvd'),
(30,'Colorado Blvd'),
(31,'Hampden Ave'),
(32,'Arapahoe Rd'),
(33,'Quebec St'),
(34,'Parker Rd'),
(35,'Wadsworth Blvd'),
(36,'Sheridan Blvd'),
(37,'Alameda Ave'),
(38,'Mississippi Ave'),
(39,'Yosemite St'),
(40,'County Line Rd'),
(41,'Santa Fe Dr'),
(42,'Lincoln Ave'),
(43,'Tower Rd'),
(44,'Peoria St'),
(45,'Monaco Pkwy'),
(46,'Havana St'),
(47,'Chambers Rd'),
(48,'Washington St'),
(49,'Lowell Blvd'),
(50,'Kipling St');
GO

INSERT INTO CustomerAddress (CustomerID, CustomerStreetID, AddressType)
VALUES
(1,1,'Home'),
(2,2,'Home'),
(3,3,'Home'),
(4,4,'Home'),
(5,5,'Home'),
(6,6,'Work'),
(7,7,'Home'),
(8,8,'Home'),
(9,9,'Home'),
(10,10,'Work'),
(11,11,'Home'),
(12,12,'Home'),
(13,13,'Home'),
(14,14,'Home'),
(15,15,'Work'),
(16,16,'Home'),
(17,17,'Home'),
(18,18,'Home'),
(19,19,'Work'),
(20,20,'Home'),
(21,21,'Home'),
(22,22,'Home'),
(23,23,'Work'),
(24,24,'Home'),
(25,25,'Home'),
(26,26,'Home'),
(27,27,'Work'),
(28,28,'Home'),
(29,29,'Home'),
(30,30,'Home'),
(31,31,'Work'),
(32,32,'Home'),
(33,33,'Home'),
(34,34,'Home'),
(35,35,'Work'),
(36,36,'Home'),
(37,37,'Home'),
(38,38,'Home'),
(39,39,'Work'),
(40,40,'Home'),
(41,41,'Home'),
(42,42,'Home'),
(43,43,'Work'),
(44,44,'Home'),
(45,45,'Home'),
(46,46,'Home'),
(47,47,'Work'),
(48,48,'Home'),
(49,49,'Home'),
(50,50,'Home');
GO

INSERT INTO CustomerPhone (CustomerID, CustomerPhoneNumber)
VALUES
-- MINNESOTA PHONE NUMBERS (1–25)
(1,'612-555-0142'),
(2,'612-555-0198'),
(3,'612-555-4421'),
(4,'651-555-8834'),
(5,'651-555-2279'),
(6,'763-555-9033'),
(7,'763-555-1184'),
(8,'952-555-7712'),
(9,'952-555-6409'),
(10,'612-555-7321'),
(11,'651-555-4490'),
(12,'651-555-6628'),
(13,'763-555-2044'),
(14,'763-555-9910'),
(15,'952-555-3157'),
(16,'952-555-8820'),
(17,'612-555-5033'),
(18,'612-555-7741'),
(19,'651-555-9012'),
(20,'651-555-1448'),
(21,'763-555-6672'),
(22,'763-555-3301'),
(23,'952-555-4880'),
(24,'952-555-1299'),
(25,'612-555-6904'),

-- COLORADO PHONE NUMBERS (26–50)
(26,'303-555-0147'),
(27,'303-555-8821'),
(28,'303-555-9934'),
(29,'720-555-4410'),
(30,'720-555-6622'),
(31,'720-555-7789'),
(32,'303-555-2204'),
(33,'303-555-5571'),
(34,'720-555-9032'),
(35,'720-555-1180'),
(36,'303-555-7744'),
(37,'303-555-6402'),
(38,'720-555-3150'),
(39,'720-555-8829'),
(40,'303-555-5031'),
(41,'303-555-7718'),
(42,'720-555-4499'),
(43,'720-555-6620'),
(44,'303-555-9017'),
(45,'303-555-1442'),
(46,'720-555-6670'),
(47,'720-555-3309'),
(48,'303-555-4888'),
(49,'303-555-1290'),
(50,'720-555-6901');
GO

INSERT INTO CustomerEmail (CustomerID, CustomerEmail)
VALUES
(1,'john.walker@example.com'),
(2,'emily.hughes@example.com'),
(3,'michael.turner@example.com'),
(4,'sarah.benson@example.com'),
(5,'david.carter@example.com'),
(6,'olivia.reed@example.com'),
(7,'daniel.morgan@example.com'),
(8,'sophia.price@example.com'),
(9,'andrew.foster@example.com'),
(10,'chloe.hayes@example.com'),

(11,'ethan.parker@example.com'),
(12,'ava.brooks@example.com'),
(13,'ryan.coleman@example.com'),
(14,'lily.stewart@example.com'),
(15,'jacob.sullivan@example.com'),
(16,'grace.holland@example.com'),
(17,'anthony.barrett@example.com'),
(18,'hannah.walters@example.com'),
(19,'samuel.jennings@example.com'),
(20,'ella.manning@example.com'),

(21,'joseph.harper@example.com'),
(22,'zoe.fleming@example.com'),
(23,'christopher.doyle@example.com'),
(24,'natalie.sharp@example.com'),
(25,'joshua.keller@example.com'),
(26,'mia.baldwin@example.com'),
(27,'benjamin.rhodes@example.com'),
(28,'aria.dalton@example.com'),
(29,'logan.vargas@example.com'),
(30,'scarlett.conrad@example.com'),

(31,'henry.merritt@example.com'),
(32,'victoria.santos@example.com'),
(33,'owen.barker@example.com'),
(34,'penelope.harrington@example.com'),
(35,'jack.whitman@example.com'),
(36,'layla.finley@example.com'),
(37,'gabriel.norris@example.com'),
(38,'nora.pruitt@example.com'),
(39,'isaac.shepherd@example.com'),
(40,'camila.hampton@example.com'),

(41,'julian.benson@example.com'),
(42,'aubrey.griffin@example.com'),
(43,'wyatt.dawson@example.com'),
(44,'harper.lambert@example.com'),
(45,'luke.chandler@example.com'),
(46,'eleanor.benson@example.com'),
(47,'grayson.harrington@example.com'),
(48,'stella.maddox@example.com'),
(49,'levi.carson@example.com'),
(50,'violet.mercer@example.com');
GO

INSERT INTO CustomerContact (CustomerID, CustomerAddressID, CustomerPhoneID, CustomerEmailID)
VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,6,6),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10),
(11,11,11,11),
(12,12,12,12),
(13,13,13,13),
(14,14,14,14),
(15,15,15,15),
(16,16,16,16),
(17,17,17,17),
(18,18,18,18),
(19,19,19,19),
(20,20,20,20),
(21,21,21,21),
(22,22,22,22),
(23,23,23,23),
(24,24,24,24),
(25,25,25,25),
(26,26,26,26),
(27,27,27,27),
(28,28,28,28),
(29,29,29,29),
(30,30,30,30),
(31,31,31,31),
(32,32,32,32),
(33,33,33,33),
(34,34,34,34),
(35,35,35,35),
(36,36,36,36),
(37,37,37,37),
(38,38,38,38),
(39,39,39,39),
(40,40,40,40),
(41,41,41,41),
(42,42,42,42),
(43,43,43,43),
(44,44,44,44),
(45,45,45,45),
(46,46,46,46),
(47,47,47,47),
(48,48,48,48),
(49,49,49,49),
(50,50,50,50);
GO

INSERT INTO Customer (CustomerNameID, CustomerContactID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(36,36),
(37,37),
(38,38),
(39,39),
(40,40),
(41,41),
(42,42),
(43,43),
(44,44),
(45,45),
(46,46),
(47,47),
(48,48),
(49,49),
(50,50);
GO

INSERT INTO CardInfo (CustomerID, CardNumber, ExpirationDate, CVV)
VALUES
(1,'4539876543211001','2028-04-01',421),
(2,'4539876543211002','2027-11-01',388),
(3,'4539876543211003','2029-06-01',552),
(4,'4539876543211004','2028-09-01',119),
(5,'4539876543211005','2027-02-01',774),
(6,'4539876543211006','2029-01-01',663),
(7,'4539876543211007','2028-03-01',501),
(8,'4539876543211008','2027-07-01',944),
(9,'4539876543211009','2029-10-01',382),
(10,'4539876543211010','2028-12-01',215),

(11,'4539876543211011','2027-05-01',602),
(12,'4539876543211012','2029-08-01',330),
(13,'4539876543211013','2028-10-01',447),
(14,'4539876543211014','2027-03-01',559),
(15,'4539876543211015','2029-04-01',128),

(16,'4539876543211016','2028-06-01',771),
(17,'4539876543211017','2027-09-01',904),
(18,'4539876543211018','2029-02-01',663),
(19,'4539876543211019','2028-11-01',552),
(20,'4539876543211020','2027-01-01',337),

(21,'4539876543211021','2029-03-01',882),
(22,'4539876543211022','2028-07-01',441),
(23,'4539876543211023','2027-10-01',229),
(24,'4539876543211024','2029-05-01',773),
(25,'4539876543211025','2028-02-01',664),

(26,'4539876543211026','2027-04-01',501),
(27,'4539876543211027','2029-09-01',882),
(28,'4539876543211028','2028-08-01',330),
(29,'4539876543211029','2027-06-01',447),
(30,'4539876543211030','2029-12-01',559),

(31,'4539876543211031','2028-05-01',128),
(32,'4539876543211032','2027-08-01',771),
(33,'4539876543211033','2029-11-01',904),
(34,'4539876543211034','2028-01-01',663),
(35,'4539876543211035','2027-12-01',552);
GO

INSERT INTO PaymentInfo (CardInfoID, PaidInCash, PaidWhen, PaidTime)
VALUES
(1,0,'2026-05-01','14:22'),
(2,0,'2026-05-02','10:11'),
(3,0,'2026-05-03','16:45'),
(4,0,'2026-05-04','09:33'),
(5,0,'2026-05-05','18:12'),
(6,0,'2026-05-06','13:55'),
(7,0,'2026-05-07','11:02'),
(8,0,'2026-05-08','17:44'),
(9,0,'2026-05-09','15:21'),
(10,0,'2026-05-10','12:10'),

(11,0,'2026-05-11','09:50'),
(12,0,'2026-05-12','14:33'),
(13,0,'2026-05-13','16:01'),
(14,0,'2026-05-14','10:45'),
(15,0,'2026-05-15','13:22'),

(16,0,'2026-05-16','11:18'),
(17,0,'2026-05-17','17:40'),
(18,0,'2026-05-18','09:55'),
(19,0,'2026-05-19','15:33'),
(20,0,'2026-05-20','12:44'),

(21,0,'2026-05-21','10:12'),
(22,0,'2026-05-22','14:09'),
(23,0,'2026-05-23','18:33'),
(24,0,'2026-05-24','09:41'),
(25,0,'2026-05-25','16:55'),

(26,0,'2026-05-26','11:33'),
(27,0,'2026-05-27','13:14'),
(28,0,'2026-05-28','15:22'),
(29,0,'2026-05-29','10:05'),
(30,0,'2026-05-30','17:48'),

(31,0,'2026-05-31','12:22'),
(32,0,'2026-06-01','09:33'),
(33,0,'2026-06-02','14:44'),
(34,0,'2026-06-03','16:55'),
(35,0,'2026-06-04','11:29');
GO

INSERT INTO PaymentInfo (CardInfoID, PaidInCash, PaidWhen, PaidTime)
VALUES
(NULL,1,'2026-05-01','10:15'),
(NULL,1,'2026-05-02','11:22'),
(NULL,1,'2026-05-03','14:40'),
(NULL,1,'2026-05-04','09:55'),
(NULL,1,'2026-05-05','16:12'),
(NULL,1,'2026-05-06','13:01'),
(NULL,1,'2026-05-07','12:33'),
(NULL,1,'2026-05-08','17:10'),
(NULL,1,'2026-05-09','15:44'),
(NULL,1,'2026-05-10','10:55'),
(NULL,1,'2026-05-11','11:40'),
(NULL,1,'2026-05-12','09:22'),
(NULL,1,'2026-05-13','16:33'),
(NULL,1,'2026-05-14','12:10'),
(NULL,1,'2026-05-15','14:55');
GO

INSERT INTO OrderType (TypeName)
VALUES
('Dine-In'),
('Walk-In'),
('Curbside'),
('Delivery');
GO

INSERT INTO Orders (CustomerID, OrderTypeID, StoreLocationID) 
-- 4 dine in, 4 walk in, 4 curbside, 4 delivery, Store 1
VALUES
(1,1,1), -- Dine-In
(2,2,1), -- Walk-In
(3,3,1), -- Curbside
(4,4,1), -- Delivery
(5,2,1), -- Walk-In
(6,3,1), -- Curbside
(7,1,1), -- Dine-In
(8,4,1), -- Delivery
(9,3,1), -- Curbside
(10,1,1), -- Dine-In
(11,2,1), -- Walk-In
(12,4,1), -- Delivery
(13,3,1), -- Curbside
(14,1,1), -- Dine-In
(15,2,1), -- Walk-In
(16,4,1); -- Delivery
GO

INSERT INTO Orders (CustomerID, OrderTypeID, StoreLocationID) 
-- 4 dine in, 4 walk in, 4 curbside, 4 delivery, Store 2
VALUES
(16,1,2), -- Dine-In
(17,2,2), -- Walk-In
(18,3,2), -- Curbside
(19,4,2), -- Delivery
(20,2,2), -- Walk-In
(21,3,2), -- Curbside
(22,1,2), -- Dine-In
(23,4,2), -- Delivery
(24,3,2), -- Curbside
(25,1,2), -- Dine-In
(26,2,2), -- Walk-In
(27,4,2), -- Delivery
(28,3,2), -- Curbside
(29,1,2), -- Dine-In
(30,2,2), -- Walk-In
(31,4,2), -- Delivery
(32,3,2), -- Curbside
(33,1,2), -- Dine-In
(34,1,2); -- Dine-In
GO

INSERT INTO LineItem (OrderID, MenuID, Quantity, TotalPrice)
VALUES
-- Order 1 (Customer 1)
(1,1,1,5.50),      -- Edamame
(1,6,1,8.50),      -- California Roll

-- Order 2 (Customer 2)
(2,2,1,7.00),      -- Gyoza
(2,7,2,18.50),     -- Spicy Tuna Roll x2

-- Order 3 (Customer 3)
(3,13,1,18.75),    -- Sushi Combo

-- Order 4 (Customer 4)
(4,4,1,9.50),      -- Tempura Shrimp
(4,10,1,13.75),    -- Rainbow Roll

-- Order 5 (Customer 5)
(5,11,1,14.00),    -- Chicken Teriyaki

-- Order 6 (Customer 6)
(6,12,1,16.50),    -- Salmon Teriyaki
(6,5,1,4.00),      -- Miso Soup

-- Order 7 (Customer 7)
(7,3,1,6.25),      -- Seaweed Salad
(7,8,1,12.50),     -- Dragon Roll

-- Order 8 (Customer 8)
(8,9,1,7.75),      -- Veggie Roll

-- Order 9 (Customer 9)
(9,15,1,15.50),    -- Beef Udon

-- Order 10 (Customer 10)
(10,14,1,13.25),   -- Tofu Stir Fry

-- Order for Customer 11
(11, 4, 1, 9.50),     -- Tempura Shrimp
(1, 11, 1, 14.00),    -- Chicken Teriyaki

-- Order for Customer 12
(12, 6, 1, 8.50),      -- California Roll
(12, 15, 1, 15.50),    -- Beef Udon

-- Order for Customer 13
(13, 1, 1, 5.50),      -- Edamame
(13, 10, 1, 13.75),    -- Rainbow Roll

-- Order for Customer 14
(14, 3, 1, 6.25),      -- Seaweed Salad
(14, 12, 1, 16.50),    -- Salmon Teriyaki

-- Order for Customer 15
(15, 7, 1, 9.25),      -- Spicy Tuna Roll
(15, 14, 1, 13.25),    -- Tofu Stir Fry

-- Order for Customer 16
(16, 2, 1, 7.00),      -- Gyoza
(16, 9, 1, 7.75);      -- Veggie Roll
GO

INSERT INTO LineItem (OrderID, MenuID, Quantity, TotalPrice)
VALUES
-- Orders 17–20 (Dine-In, Walk-In, Curbside, Delivery)
(17,21,2,17.00),     -- California Roll x2
(18,16,1,5.50),      -- Edamame x1
(19,19,1,9.50),      -- Tempura Shrimp x1
(20,28,1,18.75),    -- Sushi Combo x1

-- 21–24
(21,17,2,14.00),     -- Gyoza x2
(22,24,1,7.75),      -- Veggie Roll x1
(23,22,3,27.75),     -- Spicy Tuna Roll x3
(24,26,1,16.50),    -- Salmon Teriyaki x1

-- 25-28
(25,18,1,6.25),      -- Seaweed Salad x1
(26,21,1,8.50),      -- California Roll x1
(27,26,2,28.00),    -- Chicken Teriyaki x2
(28,30,1,15.50),    -- Beef Udon x1

-- 29-32
(29,23,2,25.00),     -- Dragon Roll x2
(30,25,1,13.75),    -- Rainbow Roll x1
(31,20,1,4.00),      -- Miso Soup x1
(32,29,3,39.75),    -- Tofu Stir Fry x3

-- 33 and 34
(33,25,2, 28.00), -- Rainbow Roll x2
(34,30,1, 15.50), -- Beef Udon x1
(35,29,3,39.75);   -- Tofu Stir Fry x3
GO

INSERT INTO IngredientType (GlutenFree, Vegan, Spicy, Vegetarian, AllergenComments)
VALUES
(1,1,0,1,'None'),
(1,0,0,0,'Contains seafood'),
(1,0,1,0,'Contains chili'),
(0,0,0,0,'Contains gluten'),
(1,1,0,1,'Soy-based'),
(1,0,0,1,'Contains egg'),
(1,0,0,0,'Contains fish'),
(1,1,0,1,'Seaweed product'),
(1,0,0,0,'Shellfish allergen'),
(1,1,0,1,'Vegetable ingredient');
GO

INSERT INTO IngredientInfo (IngredientName)
VALUES
('Soybeans'),
('Sea Salt'),
('Pork'),
('Ginger'),
('Garlic'),
('Seaweed'),
('Shrimp'),
('Tempura Batter'),
('Tofu'),
('Green Onion'),
('Crab'),
('Avocado'),
('Cucumber'),
('Tuna'),
('Spicy Mayo'),
('Eel'),
('Carrot'),
('Radish'),
('Salmon'),
('Udon Noodles');
GO

INSERT INTO Ingredient (IngredientTypeID, IngredientInfoID)
VALUES
(1,1),
(1,2),
(4,3),
(1,4),
(1,5),
(8,6),
(9,7),
(4,8),
(5,9),
(1,10),
(2,11),
(10,12),
(10,13),
(7,14),
(6,15),
(7,16),
(10,17),
(10,18),
(7,19),
(4,20);
GO

INSERT INTO StoreIngredient (StoreLocationID, IngredientID, IngredientQuantity, UnitCost)
VALUES
(1,1,50,0.10),
(1,2,20,0.02),
(1,3,15,0.40),
(1,4,30,0.05),
(1,5,25,0.05),
(1,6,40,0.15),
(1,7,18,0.60),
(1,8,22,0.25),
(1,9,35,0.20),
(1,10,50,0.03),

(1,11,25,0.50),
(1,12,30,0.30),
(1,13,40,0.10),
(1,14,20,0.70),
(1,15,18,0.25),

(1,16,15,0.80),
(1,17,45,0.08),
(1,18,40,0.06),
(1,19,20,0.75),
(1,20,25,0.40);
GO

INSERT INTO StoreIngredient (StoreLocationID, IngredientID, IngredientQuantity, UnitCost)
VALUES
(2,1,50,0.10),
(2,2,20,0.02),
(2,3,15,0.40),
(2,4,30,0.05),
(2,5,25,0.05),
(2,6,40,0.15),
(2,7,18,0.60),
(2,8,22,0.25),
(2,9,35,0.20),
(2,10,50,0.03),

(2,11,25,0.50),
(2,12,30,0.30),
(2,13,40,0.10),
(2,14,20,0.70),
(2,15,18,0.25),

(2,16,15,0.80),
(2,17,45,0.08),
(2,18,40,0.06),
(2,19,20,0.75),
(2,20,25,0.40);
GO

INSERT INTO MenuAndIngredient (MenuID, StoreIngredientID, AmountMakeable)
VALUES
-- 1. Edamame
(1,1,50),   -- Soybeans
(1,2,20),   -- Sea Salt
(1,10,50),  -- Green Onion

-- 2. Gyoza
(2,3,15),   -- Pork
(2,4,30),   -- Ginger
(2,5,25),   -- Garlic

-- 3. Seaweed Salad
(3,6,40),   -- Seaweed
(3,17,45),  -- Carrot
(3,18,40),  -- Radish

-- 4. Tempura Shrimp
(4,7,18),   -- Shrimp
(4,8,22),   -- Tempura Batter
(4,5,25),   -- Garlic

-- 5. Miso Soup
(5,9,35),   -- Tofu
(5,6,40),   -- Seaweed
(5,10,50),  -- Green Onion

-- 6. California Roll
(6,11,25),  -- Crab
(6,12,30),  -- Avocado
(6,13,40),  -- Cucumber
(6,6,40),   -- Seaweed

-- 7. Spicy Tuna Roll
(7,14,20),  -- Tuna
(7,15,18),  -- Spicy Mayo
(7,13,40),  -- Cucumber
(7,6,40),   -- Seaweed

-- 8. Dragon Roll
(8,16,15),  -- Eel
(8,12,30),  -- Avocado
(8,13,40),  -- Cucumber
(8,6,40),   -- Seaweed

-- 9. Veggie Roll
(9,12,30),  -- Avocado
(9,13,40),  -- Cucumber
(9,17,45),  -- Carrot
(9,18,40),  -- Radish

-- 10. Rainbow Roll
(10,11,25), -- Crab
(10,14,20), -- Tuna
(10,19,20), -- Salmon
(10,12,30), -- Avocado
(10,13,40), -- Cucumber

-- 11. Chicken Teriyaki
(11,4,30),  -- Ginger
(11,5,25),  -- Garlic
(11,17,45), -- Vegetables (Carrot)
(11,18,40), -- Vegetables (Radish)

-- 12. Salmon Teriyaki
(12,19,20), -- Salmon
(12,4,30),  -- Ginger
(12,5,25),  -- Garlic
(12,17,45), -- Vegetables

-- 13. Sushi Combo
(13,14,20), -- Tuna
(13,19,20), -- Salmon
(13,11,25), -- Crab
(13,6,40),  -- Seaweed

-- 14. Tofu Stir Fry
(14,9,35),  -- Tofu
(14,17,45), -- Vegetables
(14,18,40), -- Vegetables
(14,5,25),  -- Garlic

-- 15. Beef Udon
(15,20,25), -- Udon Noodles
(15,10,50), -- Green Onion
(15,5,25);  -- Garlic
GO

INSERT INTO Reservation (ReservedDate, ReservedStartTime, ReservedEndTime, NumberInParty)
VALUES
('2026-05-18', '17:00', '18:30', 2),
('2026-05-18', '17:30', '19:00', 4),
('2026-05-18', '18:00', '19:30', 3),
('2026-05-18', '18:30', '20:00', 5);
GO

INSERT INTO Reservation (ReservedDate, ReservedStartTime, ReservedEndTime, NumberInParty)
VALUES
('2026-05-17', '17:00', '18:30', 2),
('2026-05-17', '17:30', '19:00', 4),
('2026-05-17', '18:00', '19:30', 3),
('2026-05-17', '18:30', '20:00', 5),
('2026-05-18', '11:00', '13:00', 2),
('2026-05-18', '11:30', '13:30', 1);
GO

INSERT INTO DineIn (OrderID, ReservationID)
VALUES
(1, 1),
(7, 2),
(10, 3),
(14, 4);
GO

INSERT INTO DineIn (OrderID, ReservationID)
VALUES
(17, 5),
(23, 6),
(26, 7),
(30, 8),
(34, 9),
(35, 10);
GO

INSERT INTO WalkIn (OrderID, ReadyToPickupTime)
VALUES
(2,  '2026-04-24 11:45:00'),
(5,  '2026-04-23 10:55:00'),
(11, '2026-04-21 13:45:00'),
(15, '2026-04-20 11:40:00');
GO

INSERT INTO WalkIn (OrderID, ReadyToPickupTime)
VALUES
(17,  '2026-05-18 12:10:00'),
(20,  '2026-05-18 12:25:00'),
(26, '2026-05-18 12:40:00'),
(30, '2026-05-18 13:00:00');
GO

INSERT INTO Curbside (OrderID, ParkingSpotNumber)
VALUES
(3,  5),
(6,  2),
(9,  7),
(13, 4);
GO

INSERT INTO Delivery (OrderID, DeliveryInstructions)
VALUES
(4,  'Leave at front door'),
(8,  'Call when arriving'),
(12, 'Gate code 1294'),
(16, 'Ring bell twice');
GO

INSERT INTO StaffPhone (StaffPhoneNumber)
VALUES
('612-204-7812'),
('612-317-4498'),
('612-455-9031'),
('612-612-7740'),
('651-228-9134'),
('651-442-7801'),
('651-390-6629'),
('651-512-4470'),
('763-221-9044'),
('763-417-8820'),
('763-589-3301'),
('763-744-1298'),
('952-204-7789'),
('952-331-9055'),
('952-447-6621'),
('952-590-1180'),
('612-733-4419'),
('651-309-5578'),
('763-288-9042'),
('952-774-6630');
GO

INSERT INTO StaffEmail (StaffEmail)
VALUES
('alex.morgan@restaurant.com'),
('brianna.lee@restaurant.com'),
('carter.james@restaurant.com'),
('diana.soto@restaurant.com'),
('ethan.kim@restaurant.com'),
('felix.turner@restaurant.com'),
('grace.holt@restaurant.com'),
('henry.pace@restaurant.com'),
('isabella.cho@restaurant.com'),
('jackson.reed@restaurant.com'),
('karen.voss@restaurant.com'),
('leo.martin@restaurant.com'),
('mia.sanders@restaurant.com'),
('nathan.brooks@restaurant.com'),
('olivia.hart@restaurant.com'),
('paul.nguyen@restaurant.com'),
('quinn.davis@restaurant.com'),
('riley.stone@restaurant.com'),
('sophia.west@restaurant.com'),
('tyler.knox@restaurant.com');
GO

INSERT INTO StaffRole (StoreLocationID, RoleName, RoleDescription)
VALUES
(1,'Server', 'Handles table service'),
(1,'Server', 'Handles table service'),
(2,'Server', 'Handles table service'),
(2,'Server', 'Handles table service'),
(1,'Host', 'Greets and seats guests'),
(2,'Host', 'Greets and seats guests'),
(1,'Cook', 'Prepares menu items'),
(2,'Cook', 'Prepares menu items'),
(1,'Sous Chef', 'Assists head chef'),
(2,'Sous Chef', 'Assists head chef'),
(1,'Manager', 'Oversees operations'),
(2,'Manager', 'Oversees operations'),
(1,'Dishwasher', 'Cleans dishes'),
(2,'Dishwasher', 'Cleans dishes'),
(1,'Busser', 'Clears and resets tables'),
(2,'Busser', 'Clears and resets tables'),
(1,'Prep Cook', 'Prepares ingredients'),
(2,'Prep Cook', 'Prepares ingredients'),
(1,'Runner', 'Delivers food to tables'),
(2,'Runner', 'Delivers food to tables');
GO

INSERT INTO Staff (StaffRoleID, StaffEmailID, StaffPhoneID, StaffFirstName, StaffLastName, ShiftStartTime, ShiftEndTime, IsActive)
VALUES
(1, 1, 1, 'Alex', 'Morgan', '10:00', '16:00', 1),
(2, 2, 2, 'Brianna', 'Lee', '16:00', '22:00', 1),
(3, 3, 3, 'Carter', 'James', '11:00', '17:00', 1),
(4, 4, 4, 'Diana', 'Soto', '17:00', '23:00', 1),
(5, 5, 5, 'Ethan', 'Kim', '09:00', '15:00', 1),
(6, 6, 6, 'Felix', 'Turner', '15:00', '21:00', 1),
(7, 7, 7, 'Grace', 'Holt', '10:00', '18:00', 1),
(8, 8, 8, 'Henry', 'Pace', '12:00', '20:00', 1),
(9, 9, 9, 'Isabella', 'Cho', '08:00', '14:00', 1),
(10, 10, 10, 'Jackson', 'Reed', '14:00', '22:00', 1),
(11, 11, 11, 'Karen', 'Voss', '09:00', '17:00', 1),
(12, 12, 12, 'Leo', 'Martin', '13:00', '21:00', 1),
(13, 13, 13, 'Mia', 'Sanders', '10:00', '16:00', 1),
(14, 14, 14, 'Nathan', 'Brooks', '16:00', '22:00', 1),
(15, 15, 15, 'Olivia', 'Hart', '11:00', '19:00', 1),
(16, 16, 16, 'Paul', 'Nguyen', '09:00', '15:00', 1),
(17, 17, 17, 'Quinn', 'Davis', '15:00', '23:00', 1),
(18, 18, 18, 'Riley', 'Stone', '10:00', '18:00', 1),
(19, 19, 19, 'Sophia', 'West', '12:00', '20:00', 1),
(20, 20, 20, 'Tyler', 'Knox', '08:00', '14:00', 1);
GO

INSERT INTO TableAssigned (ReservationID, StaffID, IsSeated)
VALUES
(1, 5, 1),
(2, 5, 1),
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(6, 6, 1),
(7, 6, 1),
(8, 6, 1),
(9, 6, 1),
(10, 6, 1);
GO

INSERT INTO OnlineOrderType(MethodName)
VALUES
('Walk-In'), ('Curbside'), ('Delivery');
GO

INSERT INTO OnlineOrderTime(OnlineOrderDate, OnlineTimeOfOrder,TimeOfPickup)
VALUES
('2026-4-24', '11:30', '12:05'),
('2026-4-24', '11:45', '12:25'),
('2026-4-23', '12:30', '13:10'),
('2026-4-23', '10:45', '11:25'),
('2026-4-22', '10:20', '11:15'),
('2026-4-22', '14:30', '15:10'),
('2026-4-21', '11:20', '12:15'),
('2026-4-21', '13:30', '14:35'),
('2026-4-20', '12:35', '13:05'),
('2026-4-20', '14:25', '14:45'),
('2026-4-20', '11:30', '12:15'),
('2026-4-19', '15:00', '15:25'),
('2026-4-18', '14:33', '14:50'),
('2026-4-18', '11:30', '12:05'),
('2026-4-17', '11:45', '12:25'),
('2026-4-17', '11:20', '12:15'),
('2026-4-16', '13:30', '14:35'),
('2026-4-16', '12:35', '13:05'),
('2026-4-15', '14:25', '14:45'),
('2026-4-15', '11:30', '12:15'),
('2026-4-14', '15:00', '15:25'),
('2026-4-14', '14:33', '14:50'),
('2026-4-13', '15:00', '15:25'),
('2026-4-13', '14:33', '14:50')
GO

INSERT INTO OnlineOrder(OrderID, OnlineOrderTypeID, OnlineOrderTimeID, PickedUp)
VALUES
(2, 1, 1, 1),
(3, 2, 2, 1),
(4, 3, 3, 1),
(5, 1, 4, 1),
(6, 2, 5, 1),
(8, 3, 6, 1),
(9, 1, 7, 1),
(11, 2, 8, 1),
(12, 3, 9, 1),
(13, 1, 10, 1),
(15, 2, 11, 1),
(17, 3, 12, 1),
(18, 1, 13, 1),
(19, 2, 14, 1),
(20, 3, 15, 1),
(21, 1, 16, 1),
(23, 2, 17, 1),
(24, 3, 18, 1),
(26, 1, 19, 1),
(27, 2, 20, 1),
(28, 3, 21, 1),
(29, 1, 19, 1),
(30, 2, 20, 1),
(31, 3, 21, 1),
(32, 2, 22, 1);
GO

INSERT INTO TimeOfOrderDineIn (ReservationID, StaffID, OrderDate, TimeOfOrder)
VALUES
-- 2026-05-18 Evening Reservations
(1, 1, '2026-05-18', '17:12'),
(2, 1, '2026-05-18', '17:44'),
(3, 2, '2026-05-18', '18:09'),
(4, 2, '2026-05-18', '18:41'),

-- 2026-05-17 Evening Reservations
(5, 3, '2026-05-17', '17:05'),
(6, 3, '2026-05-17', '17:52'),
(7, 4,  '2026-05-17', '18:14'),
(8, 4, '2026-05-17', '18:47'),

-- 2026-05-18 Lunch Reservations
(9, 3, '2026-05-18', '11:18'),
(10, 4, '2026-05-18', '11:42');
GO