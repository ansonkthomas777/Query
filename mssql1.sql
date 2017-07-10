
/*1. Find the Territory names that contain the word ‘Santa’..*/
SELECT TerritoryDescription FROM Territories where TerritoryDescription LIKE '%Santa%'
/*2. Display the Territory names that begin with the letter ‘C’..*/
SELECT TerritoryDescription FROM Territories where TerritoryDescription LIKE 'C%'
/*..3. Display the territory names that contain ‘boro’.*/
SELECT TerritoryDescription FROM Territories where TerritoryDescription LIKE '%boro%'
/*..4. Display the names and job titles (ContactTitle) of contacts who are also owners..*/
SELECT ContactName,ContactTitle FROM Customers where ContactTitle LIKE '%Owner%'
/*...5. Display the company names and the URLs of those suppliers that have websites..*/
SELECT CompanyName,HomePage FROM Suppliers where HomePage LIKE '%#%'
/*...6. Display the company names and the URL column of those suppliers that don’t have websites. */
SELECT CompanyName,HomePage FROM Suppliers where HomePage NOT LIKE '%#%'
/*..7. Display the names and prices of those products with prices of $50 or more..*/
SELECT ProductName,UnitPrice FROM Products where UnitPrice>=50
/*...8. Display the names and prices of those products with prices less than $10...*/
SELECT ProductName,UnitPrice FROM Products where UnitPrice<10
/*...9. Display the names and prices of those products with prices of $10 or less...*/
SELECT ProductName,UnitPrice FROM Products where UnitPrice<=10
/*...10. Display the names and prices of those products with prices greater
 than or equal to $15 but less than or equal to $20...*/
 SELECT ProductName,UnitPrice FROM Products where (UnitPrice>=15 and UnitPrice<=20)
 /*..11. Display the product names and UnitsOnOrder of products
  with orders pending (UnitsOnOrder greater than zero)....*/
   SELECT ProductName,UnitsOnOrder FROM Products where UnitsOnOrder>0
   /*...12. Display the names and ages of all employees...*/
   SELECT FirstName,LastName,((year(GETDATE()))-(year(BirthDate))) as Age FROM Employees
   /*..13. Display the number of years each employee has been with Northwind...*/
    SELECT FirstName,LastName,((year(GETDATE()))-(year(HireDate))) as YearsWithNorthWind FROM Employees
	/*.14. Display the freight total..*/
	SELECT SUM(Freight) as [Freight Total] FROM Orders
	/*..15. Display the 1996 freight total...*/
	SELECT SUM(Freight) as [Freight Total] FROM Orders GROUP BY year(ShippedDate) having year(ShippedDate)=1996
	/*..16. Display the 1997 freight total...*/
	SELECT SUM(Freight) as [Freight Total] FROM Orders GROUP BY year(ShippedDate) having year(ShippedDate)=1997
	/*..17. Display the 1998 freight total...*/
	SELECT SUM(Freight) as [Freight Total] FROM Orders GROUP BY year(ShippedDate) having year(ShippedDate)=1998
	/*..18. Display the OrderID, and ShipCountry of orders to Switzerland, Venezuela, and Austria..*/
	SELECT OrderID,ShipCountry from Orders where ShipCountry in('Switzerland','Venezuela','Austria')
	/*..19. Display the names of cities, (just once for each city) in 
	Belgium, Mexico, and Sweden to which orders were shipped..*/
	SELECT distinct ShipCity from Orders where ShipCountry in('Belgium','Mexico','Sweden')
	/*...20. Display the names of all products in the
	 Dairy Products, Seafood, and Beverages categories....*/
	 SELECT CategoryName,ProductName FROM Categories inner join Products on Categories.CategoryID=Products.CategoryID
	  where CategoryName in('Dairy Products','Seafood','Beverages')