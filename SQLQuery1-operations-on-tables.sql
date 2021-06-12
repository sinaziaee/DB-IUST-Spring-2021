/*
	To create Database:
	create Database <databaseName>
*/

/* create Datbase studentsInfo; */

/* 
	to specify which database your gonna use:
	Use <databaseName>
*/
Use studentsInfo;
/*
To Drop a Database:
	Drop Database <databaseName>
** Just make sure you are not using the same database that you are dropping **
** If so, Use another database and then drop your desired database **
	Drop Database studentsInfo;
*/

/* 
	To create table:
	create table <tableName>(
		<fieldName> fieldType,
	);
*/
/*
Create table students(
	studentId int primary key, 
	studentName varchar(100),
	parentName varchar(100),
	phoneNumber bigInt,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100),
);
*/
/*
To Drop a Table 
	Drop Table <tableName>
*/
/* 
To Alter a Table
	Alter Table <tableName> operation;
Add a column to a table
	Alter Table students Add bloodGroup varchar(64);
Drop a column from a table
	Alter Table students Drop Column bloodGroup;
Change the type of a column of a table
	Alter Table students Add DOB date;   /* this is just to have the column*/
	Alter Table students Alter Column DOB dateTime;
*/	
/* 
to insert a row into a table
Insert Into students(studentId, studentName, parentName,
	phoneNumber, addressOfStudent, city, country, bloodGroup)
	values (1, 'sina', 'hossein', 9101234567, 'Farhad Street',
	'Mashhad', 'Iran', 'A+');
*/
/* 
to select all the data from a table
	Select * from Students;
*/
/*
to delete all the info stored inside a table(deleting all 
the rows but not the table itself)
	Truncate table Students;
*/

/* 
	from now on, in order to remove that red line below the 
	tables name we can use 
	Go and exec 
	or just remove the first line that says   
		Use Database <databaseName>

Go 
Exec Select * from students
	or even just use the    Go   phrase

*/
/*
to rename a table's name 
Go 
Exec sp_rename 'students', 'student';
*/
 
