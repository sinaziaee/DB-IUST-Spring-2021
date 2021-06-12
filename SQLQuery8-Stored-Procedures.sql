/*

SQL statements are used to perform tasks such as update data on a database, or retrieve data from a database

By grouping SQL statements, a stored procedure allows them to be executed with a single call. 
This minimizes the use of slow networks, reduces network traffic, and improves round-trip response time. 
OLTP applications, in particular, benefit because result set processing eliminates network bottlenecks.


SQL Server stored procedures are used to group one or more Transact-SQL statements into logical units.
The stored procedure is stored as a named object in the SQL Server Database Server.

When you call a stored procedure for the first time, SQL Server creates an execution plan and stores it
in the cache. In the subsequent executions of the stored procedure, SQL Server reuses
the plan to execute the stored procedure very fast with reliable performance.


The following SELECT statement returns a list of products from the products table in
	the BikeStores sample database:
*/

SELECT 
	product_name, 
	list_price
FROM 
	production.products
ORDER BY 
	product_name;

/*
To create a stored procedure that wraps this query, you use the CREATE PROCEDURE statement as follows:
*/

CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        production.products
    ORDER BY 
        product_name;
END;
/*
If the stored procedure has one statement, the BEGIN and END keywords surrounding the statement are optional

You can find the stored procedure in the Object Explorer, under Programmability > Stored
*/

/*
	Executing a stored procedure
*/

EXEC uspProductList;
EXECUTE uspProductList;

/*
	Modifying a stored procedure

To modify an existing stored procedure, you use the ALTER PROCEDURE statement.

*/

ALTER PROCEDURE uspProductList
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products
        ORDER BY 
            list_price 
    END;

/*
	Deleting a stored procedure
*/

DROP PROCEDURE uspProductList;


/*
	it can also be a list of statements inside a stored procedures
	like this:

	create procedure dbo.usp_3Queries
		(
			@Variable1 int,
			@Variable2 int,
			@Variable3 int
		)
		as
		begin
			update dbo.Table1 set Column1 = @Variable1 where Column2 = @Variable2

			update dbo.Table3 set Column3 = @Variable3 where Column2 = @Variable2

			update dbo.Table4 set Column3 = @Variable3 where Column2 = @Variable2
		end
*/

