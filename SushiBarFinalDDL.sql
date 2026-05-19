IF DB_ID('SushiBar') IS NULL
CREATE DATABASE SushiBar;
GO

IF DB_ID('SushiBar') IS NOT NULL
USE SushiBar;
GO

CREATE TABLE StoreCountry
(
	StoreCountryID INT IDENTITY PRIMARY KEY NOT NULL,
	CountryName VARCHAR(100) NOT NULL
);
GO

CREATE TABLE StoreTerritory
(
	StoreTerritoryID INT IDENTITY PRIMARY KEY NOT NULL,
	TerritoryName VARCHAR(100) NOT NULL,
	StoreCountryID INT NOT NULL,
	CONSTRAINT FK_StoreCountryID FOREIGN KEY (StoreCountryID) REFERENCES StoreCountry(StoreCountryID)

);
GO

CREATE TABLE StoreZipcode
(
	StoreZipcodeID INT IDENTITY PRIMARY KEY NOT NULL,
	ZipcodeEntry VARCHAR(10) NOT NULL
);
GO

CREATE TABLE StoreCity
(
	StoreCityID INT IDENTITY PRIMARY KEY NOT NULL,
	CityName VARCHAR(60) NOT NULL,
	StoreTerritoryID INT NOT NULL,
	CONSTRAINT FK_StoreTerritoryID FOREIGN KEY (StoreTerritoryID) REFERENCES StoreTerritory(StoreTerritoryID),
	StoreZipcodeID INT NOT NULL,
	CONSTRAINT FK_StoreZipcodeID FOREIGN KEY (StoreZipcodeID) REFERENCES StoreZipcode(StoreZipcodeID)
);
GO

CREATE TABLE StoreStreet
(
	StoreStreetID INT IDENTITY PRIMARY KEY NOT NULL,
	StreetName VARCHAR(60) NOT NULL,
	StoreCityID INT NOT NULL,
	CONSTRAINT FK_StoreCityID FOREIGN KEY (StoreCityID) REFERENCES StoreCity(StoreCityID)
);
GO

CREATE TABLE Store
(
	StoreID INT IDENTITY PRIMARY KEY NOT NULL,
	StoreName VARCHAR(50) NOT NULL,
	OpenTime TIME NOT NULL,
	CloseTime TIME NOT NULL
);
GO

CREATE TABLE StoreLocation
(
	StoreLocationID INT IDENTITY PRIMARY KEY NOT NULL,
	StoreID INT NOT NULL,
	CONSTRAINT FK_Store_ToLocationID FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
	StoreStreetID INT NOT NULL,
	CONSTRAINT FK_Store_StreetID FOREIGN KEY (StoreStreetID) REFERENCES StoreStreet(StoreStreetID)
);
GO

CREATE TABLE StorePhone
(
	StorePhoneID INT IDENTITY PRIMARY KEY NOT NULL,
	StorePhoneNumber VARCHAR(50) NOT NULL,
	StoreLocationID INT NOT NULL
	CONSTRAINT FK_StorePhone_StoreLocation FOREIGN KEY (StoreLocationID) REFERENCES StoreLocation(StoreLocationID)
);
GO

CREATE TABLE StoreEmail
(
	StoreEmailID INT IDENTITY PRIMARY KEY NOT NULL,
	StoreEmail VARCHAR(50) NOT NULL,
	StoreLocationID INT NOT NULL,
	CONSTRAINT FK_StoreEmail_StoreLocation FOREIGN KEY (StoreLocationID) REFERENCES StoreLocation(StoreLocationID)
);
GO

CREATE TABLE IngredientType
(
	IngredientTypeID INT IDENTITY PRIMARY KEY NOT NULL,
	GlutenFree BIT NOT NULL DEFAULT 0,
	Vegan BIT NOT NULL DEFAULT 0,
	Spicy BIT NOT NULL DEFAULT 0,
	Vegetarian BIT NOT NULL DEFAULT 0,
	AllergenComments VARCHAR(200)
);
GO

CREATE TABLE IngredientInfo
(
	IngredientInfoID INT IDENTITY PRIMARY KEY NOT NULL,
	IngredientName VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Ingredient
(
	IngredientID INT IDENTITY PRIMARY KEY NOT NULL,
	IngredientTypeID INT NOT NULL,
	CONSTRAINT FK_Ingredient_IngredientTypeID FOREIGN KEY (IngredientTypeID) REFERENCES IngredientType(IngredientTypeID),
	IngredientInfoID INT NOT NULL,
	CONSTRAINT FK_Ingredient_IngredientInfoID FOREIGN KEY (IngredientInfoID) REFERENCES IngredientInfo(IngredientInfoID)
);
GO

CREATE TABLE StoreIngredient
(
	StoreIngredientID INT IDENTITY PRIMARY KEY NOT NULL,
	IngredientID INT NOT NULL,
	CONSTRAINT FK_Ingredient_StoreIngredientID FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID),
	StoreLocationID INT NOT NULL,
	CONSTRAINT FK_StoreLocation_StoreIngredientID FOREIGN KEY (StoreLocationID) REFERENCES StoreLocation(StoreLocationID),
	IngredientQuantity INT NOT NULL,
	UnitCost DECIMAL (5,2) NOT NULL
);
GO

CREATE TABLE MenuItems
(
	MenuID INT IDENTITY PRIMARY KEY NOT NULL,
	StoreLocationID INT NOT NULL,
	CONSTRAINT FK_Menu_Location FOREIGN KEY (StoreLocationID) REFERENCES StoreLocation(StoreLocationID),
	Category VARCHAR(25) NOT NULL,
	ItemName VARCHAR(45) NOT NULL,
	ItemDescription VARCHAR(300),
	ItemPrice DECIMAL (5,2) NOT NULL
);
GO

CREATE TABLE MenuAndIngredient
(
	MenuID INT NOT NULL,
	CONSTRAINT FK_Menu_IngredientID FOREIGN KEY (MenuID) REFERENCES MenuItems(MenuID),
	StoreIngredientID INT NOT NULL,
	CONSTRAINT FK_StoreIngredient_MenuID FOREIGN KEY (StoreIngredientID) REFERENCES StoreIngredient(StoreIngredientID),
	AmountMakeable INT,
	PRIMARY KEY (MenuID, StoreIngredientID)
);
GO

CREATE TABLE CustomerCountry
(
	CustomerCountryID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerCountryName VARCHAR(100) NOT NULL
);
GO

CREATE TABLE CustomerTerritory
(
	CustomerTerritoryID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerTerritoryName VARCHAR(100) NOT NULL,
	CustomerCountryID INT NOT NULL,
	CONSTRAINT FK_CustomerCountryID FOREIGN KEY (CustomerCountryID) REFERENCES CustomerCountry(CustomerCountryID)
);
GO

CREATE TABLE CustomerZipcode
(
	CustomerZipcodeID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerZipcodeEntry VARCHAR(10) NOT NULL
);
GO

CREATE TABLE CustomerCity
(
	CustomerCityID INT IDENTITY PRIMARY KEY NOT NULL,
	CityName VARCHAR(60) NOT NULL,
	CustomerTerritoryID INT NOT NULL,
	CONSTRAINT FK_CustomerTerritoryID FOREIGN KEY (CustomerTerritoryID) REFERENCES CustomerTerritory(CustomerTerritoryID),
	CustomerZipcodeID INT NOT NULL,
	CONSTRAINT FK_CustomerZipcodeID FOREIGN KEY (CustomerZipcodeID) REFERENCES CustomerZipcode(CustomerZipcodeID)
);
GO

CREATE TABLE CustomerStreet
(
	CustomerStreetID INT IDENTITY PRIMARY KEY NOT NULL,
	StreetName VARCHAR(60) NOT NULL,
	CustomerCityID INT NOT NULL,
	CONSTRAINT FK_CustomerCityID FOREIGN KEY (CustomerCityID) REFERENCES CustomerCity(CustomerCityID)
);
GO

CREATE TABLE CustomerAddress
(
	CustomerAddressID INT IDENTITY NOT NULL,
	CustomerID INT NOT NULL,
	CustomerStreetID INT NOT NULL,
	AddressType VARCHAR(15) NOT NULL,
	CONSTRAINT FK_CustomerStreetID FOREIGN KEY (CustomerStreetID) REFERENCES CustomerStreet(CustomerStreetID),
	PRIMARY KEY(CustomerAddressID, CustomerID)
)
GO

CREATE TABLE CustomerPhone
(
	CustomerPhoneID INT IDENTITY NOT NULL,
	CustomerID INT NOT NULL,
	CustomerPhoneNumber VARCHAR(35),
	PRIMARY KEY(CustomerPhoneID, CustomerID)
);
GO

CREATE TABLE CustomerEmail
(
	CustomerEmailID INT IDENTITY NOT NULL,
	CustomerID INT NOT NULL,
	CustomerEmail VARCHAR(80),
	PRIMARY KEY(CustomerEmailID, CustomerID)
);
GO

CREATE TABLE CustomerContact
(
	CustomerID INT NOT NULL,
	CustomerContactID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerAddressID INT NOT NULL,
	CONSTRAINT FK_CustomerAddressID FOREIGN KEY (CustomerAddressID, CustomerID) REFERENCES CustomerAddress(CustomerAddressID, CustomerID),
	CustomerPhoneID INT NOT NULL,
	CONSTRAINT FK_CustomerPhoneID FOREIGN KEY (CustomerPhoneID, CustomerID) REFERENCES CustomerPhone(CustomerPhoneID, CustomerID),
	CustomerEmailID INT NOT NULL,
	CONSTRAINT FK_CustomerEmailID FOREIGN KEY (CustomerEmailID, CustomerID) REFERENCES CustomerEmail(CustomerEmailID, CustomerID),
);
GO

CREATE TABLE CustomerName
(
	CustomerNameID INT IDENTITY PRIMARY KEY NOT NULL,
	FirstName VARCHAR(35) NOT NULL,
	MiddleInital CHAR,
	LastName VARCHAR(45) NOT NULL
);
GO

CREATE TABLE Customer
(
	CustomerID INT IDENTITY PRIMARY KEY,
	CustomerNameID INT,
	CONSTRAINT FK_CustomerNameID FOREIGN KEY(CustomerNameID) REFERENCES CustomerName(CustomerNameID),
	CustomerContactID INT,
	CONSTRAINT FK_CustomerContactID FOREIGN KEY(CustomerContactID) REFERENCES CustomerContact(CustomerContactID)
);
GO

CREATE TABLE CardInfo
(
	CardInfoID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerID INT NOT NULL,
	CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CardNumber VARCHAR(25) NOT NULL,
	ExpirationDate DATE NOT NULL,
	CVV INT NOT NULL
);
GO

CREATE TABLE PaymentInfo
(
	PaymentInfoID INT IDENTITY PRIMARY KEY NOT NULL,
	CardInfoID INT,
	CONSTRAINT FK_CardInfoID FOREIGN KEY(CardInfoID) REFERENCES CardInfo(CardInfoID),
	PaidInCash BIT NOT NULL DEFAULT(0),
	AmountToPay DECIMAL(5,2),
	PaidWhen DATE,
	PaidTime TIME
);
GO

CREATE TABLE OrderType
(
	OrderTypeID INT IDENTITY PRIMARY KEY NOT NULL,
	TypeName VARCHAR(25) NOT NULL
);
GO

CREATE TABLE Orders
(
	OrderID INT IDENTITY PRIMARY KEY NOT NULL,
	CustomerID INT NOT NULL,
	CONSTRAINT FK_Customer_OrderID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	OrderTypeID INT NOT NULL,
	CONSTRAINT FK_OrderTypeID FOREIGN KEY(OrderTypeID) REFERENCES OrderType(OrderTypeID),
	StoreLocationID INT NOT NULL,
	CONSTRAINT FK_StoreLocation_OrderID FOREIGN KEY(StoreLocationID) REFERENCES StoreLocation(StoreLocationID)
);
GO

CREATE TABLE LineItem
(
	LineItemID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_Order_ItemID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	MenuID INT NOT NULL,
	CONSTRAINT FK_Menu_ItemID FOREIGN KEY(MenuID) REFERENCES MenuItems(MenuID),
	Quantity INT NOT NULL DEFAULT(1),
	TotalPrice DECIMAL(5,2)
);
GO

CREATE TABLE OnlineOrderType
(
	OnlineOrderTypeID INT IDENTITY PRIMARY KEY NOT NULL,
	MethodName VARCHAR(15) NOT NULL
);
GO

CREATE TABLE OnlineOrderTime
(
	OnlineOrderTimeID INT IDENTITY PRIMARY KEY NOT NULL,
	OnlineOrderDate DATE NOT NULL,
	OnlineTimeOfOrder TIME NOT NULL,
	TimeOfPickUp TIME
);
GO

CREATE TABLE OnlineOrder
(
	OnlineOrderID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_OrderOnlineID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	OnlineOrderTypeID INT NOT NULL,
	CONSTRAINT FK_OnlineOrderTypeID FOREIGN KEY(OnlineOrderTypeID) REFERENCES OnlineOrderType(OnlineOrderTypeID),
	OnlineOrderTimeID INT NOT NULL,
	CONSTRAINT FK_OnlineOrderTimeID FOREIGN KEY(OnlineOrderTimeID) REFERENCES OnlineOrderTime(OnlineOrderTimeID),
	PickedUp BIT NOT NULL DEFAULT(0)
);
GO

CREATE TABLE WalkIn
(
	WalkInID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_WalkInOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	ReadyToPickupTime TIME
);
GO

CREATE TABLE CurbSide
(
	CurbSideID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_CurbSideOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	ParkingSpotNumber INT NOT NULL
);
GO

CREATE TABLE Delivery
(
	DeliveryID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_DeliveryOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	DeliveryInstructions VARCHAR(200)
);
GO

CREATE TABLE Reservation
(
	ReservationID INT IDENTITY PRIMARY KEY NOT NULL,
	ReservedDate DATE NOT NULL,
	ReservedStartTime TIME NOT NULL,
	ReservedEndTime TIME,
	NumberInParty INT NOT NULL
);
GO

CREATE TABLE DineIn
(
	DineInID INT IDENTITY PRIMARY KEY NOT NULL,
	OrderID INT NOT NULL,
	CONSTRAINT FK_InHouseOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	ReservationID INT NOT NULL,
	CONSTRAINT FK_ReservationID FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);
GO

CREATE TABLE StaffRole
(
	StaffRoleID INT IDENTITY PRIMARY KEY NOT NULL,
	StoreLocationID INT NOT NULL,
	CONSTRAINT FK_StoreLocation_StaffRoleID FOREIGN KEY (StoreLocationID) REFERENCES StoreLocation(StoreLocationID),
	RoleName VARCHAR(30) NOT NULL,
	RoleDescription VARCHAR(255)
);
GO

CREATE TABLE StaffEmail
(
	StaffEmailID INT IDENTITY PRIMARY KEY NOT NULL,
	StaffEmail VARCHAR(45) NOT NULL
);
GO

CREATE TABLE StaffPhone
(
	StaffPhoneID INT IDENTITY PRIMARY KEY NOT NULL,
	StaffPhoneNumber VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Staff
(
	StaffID INT IDENTITY PRIMARY KEY NOT NULL,
	StaffRoleID INT NOT NULL,
	CONSTRAINT FK_Staff_Role FOREIGN KEY (StaffRoleID) REFERENCES StaffRole(StaffRoleID),
	StaffEmailID INT NOT NULL,
	CONSTRAINT FK_Staff_Email FOREIGN KEY (StaffEmailID) REFERENCES StaffEmail(StaffEmailID),
	StaffPhoneID INT NOT NULL,
	CONSTRAINT FK_Staff_Phone FOREIGN KEY (StaffPhoneID) REFERENCES StaffPhone(StaffPhoneID),
	StaffFirstName VARCHAR(50),
	StaffLastName VARCHAR (100),
	ShiftStartTime TIME NOT NULL,
	ShiftEndTime TIME NOT NULL,
	IsActive BIT NOT NULL DEFAULT(1)
);
GO

CREATE TABLE TableAssigned
(
	TableAssignedID INT IDENTITY PRIMARY KEY NOT NULL,
	ReservationID INT NOT NULL,
	CONSTRAINT FK_Reservation_TableAssigned FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
	StaffID INT NOT NULL,
	CONSTRAINT FK_StaffID_TableAssigned FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
	IsSeated BIT NOT NULL DEFAULT(1)
);
GO

CREATE TABLE TimeOfOrderDineIn
(
	DineInTimeOfOrderID INT IDENTITY PRIMARY KEY NOT NULL,
	ReservationID INT NOT NULL,
	CONSTRAINT FK_Reservation_TimeOfOrder FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
	StaffID INT NOT NULL,
	CONSTRAINT FK_StaffID_Served FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
	OrderDate DATE NOT NULL,
	TimeOfOrder TIME NOT NULL
);
GO

CREATE INDEX Index_LineItem_MenuID
ON LineItem(MenuID);

CREATE INDEX Index_LineItem_OrderID
ON LineItem(OrderID);

CREATE INDEX Index_MenuItems_ItemName
ON MenuItems(ItemName);

CREATE INDEX Index_Orders_StoreLocationID
ON Orders(StoreLocationID);

CREATE INDEX Index_TimeOfOrderDineIn_OrderDate
ON TimeOfOrderDineIn(OrderDate);

CREATE INDEX Index_Store_StoreName
ON Store(StoreName);

CREATE INDEX Index_CustomerName_FirstName
ON CustomerName(FirstName);

CREATE INDEX Index_CustomerName_LastName
ON CustomerName(LastName);

CREATE INDEX Index_OnlineOrderTime_TimeOfOrder
ON OnlineOrderTime(OnlineTimeOfOrder);

CREATE INDEX Index_OnlineOrderTime_TimeOfPickUp
ON OnlineOrderTime(TimeOfPickUp);