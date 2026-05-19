-- READ ME:
-- Select Statements begin at Line 309 and onward.

IF DB_ID('SushiBar') IS NULL
THROW 50001, 'You did not run the DDL file yet and or correctly.', 1;
GO

IF DB_ID('SushiBar') IS NOT NULL
USE SushiBar;
GO

------------------------VIEWS-------------------------

CREATE VIEW CustomerInfo
AS
SELECT 
	c.CustomerID, cN.FirstName, cN.LastName, cPh.CustomerPhoneNumber, 
	cEm.CustomerEmail, cSt.StreetName, cCi.CityName, 
	cTe.CustomerTerritoryName, cZi.CustomerZipcodeEntry, cCo.CustomerCountryName
FROM Customer AS c 
	RIGHT JOIN CustomerName AS cN ON c.CustomerNameID = cN.CustomerNameID
	LEFT JOIN CustomerContact AS cC ON c.CustomerContactID = cC.CustomerContactID
	LEFT JOIN CustomerPhone AS cPh ON cC.CustomerPhoneID = cPh.CustomerPhoneID
	LEFT JOIN CustomerEmail AS cEm ON cC.CustomerEmailID = cEm.CustomerEmailID
	LEFT JOIN CustomerAddress AS cA ON cC.CustomerAddressID = cA.CustomerAddressID
	LEFT JOIN CustomerStreet AS cSt ON cA.CustomerStreetID = cSt.CustomerStreetID
	LEFT JOIN CustomerCity AS cCi ON cSt.CustomerCityID = cCi.CustomerCityID
	LEFT JOIN CustomerTerritory AS cTe ON cCi.CustomerTerritoryID = cTe.CustomerTerritoryID
	LEFT JOIN CustomerZipcode AS cZi ON cCi.CustomerZipcodeID = cZi.CustomerZipcodeID
	LEFT JOIN CustomerCountry AS cCo ON cTe.CustomerCountryID = cCo.CustomerCountryID;
GO

CREATE VIEW Store1_Menu
AS 
SELECT 
	mI.StoreLocationID, mI.MenuID, mI.Category, 
	mI.ItemName, mI.ItemDescription, mI.ItemPrice 
FROM MenuItems AS mI 
WHERE 
	StoreLocationID = 1;
GO

CREATE VIEW Store2_Menu
AS 
SELECT 
	mI.StoreLocationID, mI.MenuID, mI.Category, 
	mI.ItemName, mI.ItemDescription, mI.ItemPrice 
FROM MenuItems AS mI 
WHERE 
	StoreLocationID = 2;
GO

CREATE VIEW StoreLocations
AS
SELECT St.StoreID, St.StoreName, SSt.StreetName, SC.CityName, 
Ste.TerritoryName, Sz.ZipcodeEntry, StCo.CountryName,
FORMAT(CONVERT(datetime, St.OpenTime), 'hh:mm tt') AS [Restauraunt Open],
FORMAT(CONVERT(datetime, St.CloseTime), 'hh:mm tt') AS [Restauraunt Closed]
FROM StoreLocation AS SL
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
LEFT JOIN StoreStreet AS SSt ON SL.StoreStreetID = SSt.StoreStreetID
LEFT JOIN StoreCity AS SC ON SSt.StoreCityID = SC.StoreCityID
LEFT JOIN StoreTerritory AS Ste ON SC.StoreTerritoryID = Ste.StoreTerritoryID
LEFT JOIN StoreZipcode AS Sz ON SC.StoreZipcodeID = Sz.StoreZipcodeID
LEFT JOIN StoreCountry AS StCo ON Ste.StoreCountryID = StCo.StoreCountryID;
GO

CREATE VIEW Store1_Curbside_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Curbside' AND SL.StoreLocationID = 1;
GO

CREATE VIEW Store1_Delivery_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Delivery' AND SL.StoreLocationID = 1;
GO

CREATE VIEW Store1_WalkIn_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Walk-In' AND SL.StoreLocationID = 1;
GO

CREATE VIEW Store2_Curbside_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Curbside' AND SL.StoreLocationID = 2;
GO

CREATE VIEW Store2_Delivery_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Delivery' AND SL.StoreLocationID = 2;
GO

CREATE VIEW Store2_WalkIn_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, OO.OrderID, MI.ItemName, 
LI.Quantity, LI.TotalPrice, OO.OnlineOrderID, OOT.MethodName, St.StoreName, OOTI.OnlineOrderDate, 
FORMAT(CONVERT(datetime, OOTi.OnlineTimeOfOrder), 'hh:mm tt') AS OrderedWhen,
FORMAT(CONVERT(datetime, OOTi.TimeOfPickUp), 'hh:mm tt') AS PickedUpWhen, OO.PickedUp
FROM OnlineOrder AS OO
LEFT JOIN OnlineOrderType AS OOT ON OO.OnlineOrderTypeID = OOT.OnlineOrderTypeID
LEFT JOIN OnlineOrderTime AS OOTi ON OO.OnlineOrderTimeID = OOTi.OnlineOrderTimeID
LEFT JOIN Orders AS Ord ON OO.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON Ord.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON Ord.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
WHERE OOT.MethodName = 'Walk-In' AND SL.StoreLocationID = 2;
GO

CREATE VIEW Store1_Reservations
AS 
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, 
Ord.StoreLocationID, Di.DineInID, Re.ReservedDate,
FORMAT(CONVERT(datetime, Re.ReservedStartTime), 'hh:mm tt') AS [Estimated Time of Arrival],
FORMAT(CONVERT(datetime, Re.ReservedEndTime), 'hh:mm tt') AS [Time of Departure],
Re.NumberInParty, TA.IsSeated, Sta.StaffFirstName AS [Seated By]
FROM Reservation AS Re
LEFT JOIN DineIn AS Di ON Re.ReservationID = Di.ReservationID
LEFT JOIN Orders AS Ord ON Di.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN TableAssigned AS TA ON Re.ReservationID = TA.ReservationID
LEFT JOIN Staff AS Sta ON TA.StaffID = Sta.StaffID
WHERE Ord.StoreLocationID = 1;
GO

CREATE VIEW Store2_Reservations
AS 
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, Re.ReservationID,
Sto.StoreName, Di.DineInID, Re.ReservedDate,
FORMAT(CONVERT(datetime, Re.ReservedStartTime), 'hh:mm tt') AS [Estimated Time of Arrival],
FORMAT(CONVERT(datetime, Re.ReservedEndTime), 'hh:mm tt') AS [Time of Departure],
Re.NumberInParty, TA.IsSeated, Sta.StaffFirstName AS [Seated By]
FROM Reservation AS Re
LEFT JOIN DineIn AS Di ON Re.ReservationID = Di.ReservationID
LEFT JOIN Orders AS Ord ON Di.OrderID = Ord.OrderID
LEFT JOIN Customer AS Cu ON Ord.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN TableAssigned AS TA ON Re.ReservationID = TA.ReservationID
LEFT JOIN Staff AS Sta ON TA.StaffID = Sta.StaffID
LEFT JOIN StoreLocation AS StL ON Ord.StoreLocationID = StL.StoreLocationID
LEFT JOIN Store AS Sto ON StL.StoreID = Sto.StoreID
WHERE Ord.StoreLocationID = 2;
GO

CREATE VIEW Store1_DineIn_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, 
O.OrderID, MI.ItemName, LI.Quantity, LI.TotalPrice, 
OT.TypeName AS [Order Type], TOODI.OrderDate, 
FORMAT(CONVERT(datetime, TOODI.TimeOfOrder), 'hh:mm tt') AS [Ordered At], 
St.StoreID, Sta.StaffFirstName AS [Served By], St.StoreName, Re.ReservationID
FROM Orders AS O
LEFT JOIN OrderType AS OT ON O.OrderTypeID = OT.OrderTypeID
LEFT JOIN Customer AS Cu ON O.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON O.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON O.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
LEFT JOIN DineIn AS DI ON O.OrderID = DI.OrderID
LEFT JOIN Reservation AS Re ON DI.ReservationID = RE.ReservationID
LEFT JOIN TimeOfOrderDineIn AS TOODI ON RE.ReservationID = TOODI.ReservationID
LEFT JOIN Staff AS Sta ON TOODI.StaffID = Sta.StaffID
WHERE OT.TypeName = 'Dine-In' AND SL.StoreLocationID = 1;
GO

CREATE VIEW Store2_DineIn_Orders
AS
SELECT Cu.CustomerID, CuN.FirstName, CuN.LastName, 
O.OrderID, MI.ItemName, LI.Quantity, LI.TotalPrice, 
OT.TypeName AS [Order Type], TOODI.OrderDate, 
FORMAT(CONVERT(datetime, TOODI.TimeOfOrder), 'hh:mm tt') AS [Ordered At], 
St.StoreID, Sta.StaffFirstName AS [Served By], St.StoreName, Re.ReservationID
FROM Orders AS O
LEFT JOIN OrderType AS OT ON O.OrderTypeID = OT.OrderTypeID
LEFT JOIN Customer AS Cu ON O.CustomerID = Cu.CustomerID
LEFT JOIN CustomerName AS CuN ON Cu.CustomerNameID = CuN.CustomerNameID
LEFT JOIN LineItem AS LI ON O.OrderID = LI.OrderID
LEFT JOIN MenuItems AS MI ON LI.MenuID = MI.MenuID
LEFT JOIN StoreLocation AS SL ON O.StoreLocationID = SL.StoreLocationID
LEFT JOIN Store AS St ON SL.StoreID = St.StoreID
LEFT JOIN DineIn AS DI ON O.OrderID = DI.OrderID
LEFT JOIN Reservation AS Re ON DI.ReservationID = RE.ReservationID
LEFT JOIN TimeOfOrderDineIn AS TOODI ON RE.ReservationID = TOODI.ReservationID
LEFT JOIN Staff AS Sta ON TOODI.StaffID = Sta.StaffID
WHERE OT.TypeName = 'Dine-In' AND SL.StoreLocationID = 2;
GO

CREATE VIEW Top10_MostCommonMenuItems_AllStores
AS
SELECT TOP 10
    mi.ItemName,
    mi.Category,
    SUM(li.Quantity) AS TotalTimesBought,
    SUM(li.Quantity * mi.ItemPrice) AS TotalRevenue
FROM LineItem li
JOIN MenuItems mi
    ON li.MenuID = mi.MenuID
GROUP BY mi.ItemName, mi.Category
ORDER BY SUM(li.Quantity) DESC;
GO

CREATE VIEW Top10_MostCommonMenuItems_Store1
AS
SELECT TOP 10
	o.StoreLocationID,
    mi.ItemName,
    mi.Category,
    SUM(li.Quantity) AS TotalTimesBought,
    SUM(li.Quantity * mi.ItemPrice) AS TotalRevenue
FROM LineItem li
JOIN Orders o
    ON li.OrderID = o.OrderID
JOIN MenuItems mi
    ON li.MenuID = mi.MenuID
WHERE o.StoreLocationID = 1
GROUP BY o.StoreLocationID, mi.ItemName, mi.Category
ORDER BY SUM(li.Quantity * mi.ItemPrice) DESC;
GO

CREATE VIEW Top10_MostCommonMenuItems_Store2
AS
SELECT TOP 10
	o.StoreLocationID,
    mi.ItemName,
    mi.Category,
    SUM(li.Quantity) AS TotalTimesBought,
    SUM(li.Quantity * mi.ItemPrice) AS TotalRevenue
FROM LineItem li
JOIN Orders o
    ON li.OrderID = o.OrderID
JOIN MenuItems mi
    ON li.MenuID = mi.MenuID
WHERE o.StoreLocationID = 2
GROUP BY o.StoreLocationID, mi.ItemName, mi.Category
ORDER BY SUM(li.Quantity * mi.ItemPrice) DESC;
GO

--------------------------SELECTS---------------------------

-- General Info
SELECT * FROM CustomerInfo;
SELECT * FROM StoreLocations;
SELECT * FROM Top10_MostCommonMenuItems_AllStores;
SELECT * FROM Top10_MostCommonMenuItems_Store1;
SELECT * FROM Top10_MostCommonMenuItems_Store2;

SELECT * FROM Store1_Menu;
-- SELECT BY Store 1 and OnlineOrder Method
SELECT * FROM Store1_Delivery_Orders;
SELECT * FROM Store1_Curbside_Orders;
SELECT * FROM Store1_WalkIn_Orders;
SELECT * FROM Store1_Reservations;
SELECT * FROM Store1_DineIn_Orders;

SELECT * FROM Store2_Menu;
-- SELECT BY Store 2 and OnlineOrder Method
SELECT * FROM Store2_Delivery_Orders;
SELECT * FROM Store2_Curbside_Orders;
SELECT * FROM Store2_WalkIn_Orders;
SELECT * FROM Store2_Reservations;
SELECT * FROM Store2_DineIn_Orders;