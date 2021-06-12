/*
	SQL Server triggers are special stored procedures that are executed automatically in response
	to the database object, database, and server events. SQL Server provides three type of triggers:

	- Data manipulation language (DML) triggers which are invoked automatically in response to INSERT, UPDATE, and DELETE events against tables.
	- Data definition language (DDL) triggers which fire in response to CREATE, ALTER, and DROP statements. DDL triggers also fire in response to some system stored procedures that perform DDL-like operations.
	- Logon triggers which fire in response to LOGON events

*/

/*							CREATE TRIGGER								*/
/*					on Insert, delete, update							*/

/*		Syntax		

	CREATE TRIGGER [schema_name.]trigger_name
	ON table_name
	AFTER  {[INSERT],[UPDATE],[DELETE]}
	AS
	{sql_statements}


*/

Select * from production.products;

		
/*			Let's create a trigger on production.products	

	The following statement creates a table named production.product_audits
	to record information when an INSERT or DELETE event occurs against the production.products table:

*/
CREATE TABLE production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);

/*
The production.product_audits table has all the columns from the production.products table.
In addition, it has a few more columns to record the changes e.g., updated_at, operation, and the change_id
*/
/*
			Now let's create an after DML Trigger

*/

/*

	First, to create a new trigger, you specify the name of the trigger and schema
	to which the trigger belongs in the CREATE TRIGGER clause:

CREATE TRIGGER production.trg_product_audit

Next, you specify the name of the table, which the trigger will fire when an event occurs, in the ON clause:

ON production.products

Then, you list the one or more events which will call the trigger in the AFTER clause:

AFTER INSERT, DELETE

The body of the trigger begins with the AS keyword:

AS
BEGIN

After that, inside the body of the trigger, you set the SET NOCOUNT to ON to suppress the number
of rows affected messages from being returned whenever the trigger is fired.

SET NOCOUNT ON;

The trigger will insert a row into the production.product_audits table whenever
a row is inserted into or deleted from the production.products table.
The data for insert is fed from the INSERTED and DELETED tables via the UNION ALL operator:

INSERT INTO
    production.product_audits
        (
            product_id,
            product_name,
            brand_id,
            category_id,
            model_year,
            list_price,
            updated_at,
            operation
        )
SELECT
    i.product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    i.list_price,
    GETDATE(),
    'INS'
FROM
    inserted AS i
UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        getdate(),
        'DEL'
    FROM
        deleted AS d;
*/

CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production.product_audits(
        product_id, 
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END

/*								Testing the trigger								*/

/*
The following statement inserts a new row into the production.products table:
*/

INSERT INTO production.products(
    product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price
)
VALUES (
    'Test product',
    1,
    1,
    2018,
    599
);

/*

Because of the INSERT event, the production.trg_product_audit trigger of production.products table was fired.

Let’s examine the contents of the production.product_audits table:

*/

SELECT 
    * 
FROM 
    production.product_audits;

/*
The following statement deletes a row from the production.products table:
*/

DELETE FROM 
    production.products
WHERE 
    product_id = 322;

/*
As expected, the trigger was fired and inserted the deleted row into the production.product_audits table:
*/

SELECT 
    * 
FROM 
    production.product_audits;
