/*

	Threre are two common types of functions in sql server

	1) SQL Server scalar function takes one or more parameters and returns a single value.

	2) Table-valued functions – introduce you to inline table-valued function and 
	multi-statement table-valued function to develop user-defined functions that return data of table types.


	The scalar functions help you simplify your code. For example, you may have a complex 
	calculation that appears in many queries. Instead of including the formula in every query,
	you can create a scalar function that encapsulates the formula and uses it in each query.
*/

/*
		Creating a scalar function

	CREATE FUNCTION [schema_name.]function_name (parameter_list)
	RETURNS data_type AS
	BEGIN
		statements
		RETURN value
	END

- First, specify the name of the function after the CREATE FUNCTION keywords. 
   The schema name is optional. If you don’t explicitly specify it, SQL Server uses dbo by default.
- Second, specify a list of parameters surrounded by parentheses after the function name.
- Third, specify the data type of the return value in the RETURNS statement.
- Finally, include a RETURN statement to return a value inside the body of the function.

*/

/*
	The following example creates a function that calculates the net sales based on the quantity,
	list price, and discount:
*/

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

/*
After creating the scalar function, you can find it under Programmability > Functions > Scalar-valued Functions
*/

/*
	Calling a scalar function

	You call a scalar function like a built-in function. For example, the following statement 
	demonstrates how to call the udfNetSale function:
*/

SELECT 
    sales.udfNetSale(10,100,0.1) net_sale;

/*
	The following example illustrates how to use the sales.udfNetSale function to get the net sales
	of the sales orders in the order_items table:
*/

SELECT 
    order_id, 
    SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount
FROM 
    sales.order_items
GROUP BY 
    order_id
ORDER BY
    net_amount DESC;

/*

	Modifying a scalar function

To modify a scalar function, you use the ALTER instead of the CREATE keyword. 
The rest statements remain the same:

ALTER FUNCTION [schema_name.]function_name (parameter_list)
    RETURN data_type AS
    BEGIN
        statements
        RETURN value
    END

	Note that you can use the CREATE OR ALTER statement to create a user-defined function
	if it does not exist or to modify an existing scalar function:

	CREATE OR ALTER FUNCTION [schema_name.]function_name (parameter_list)
        RETURN data_type AS
        BEGIN
            statements
            RETURN value
        END
*/

/*
	Removing a scalar function

	To remove an existing scalar function, you use the DROP FUNCTION statement:
*/

DROP FUNCTION sales.udfNetSale;

/*
	Some further notes about scaler functions

- Scalar functions can be used almost anywhere in T-SQL statements.
- Scalar functions accept one or more parameters but return only one value, therefore, they must include a RETURN statement.
- Scalar functions can use logic such as IF blocks or WHILE loops.
- Scalar functions cannot update data. They can access data but this is not a good practice.
- Scalar functions can call other functions.

*/