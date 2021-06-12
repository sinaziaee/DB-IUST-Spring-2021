Use studentsInfo;
Go

/*select * from students;*/

/* 
Diffrent types of keys in SQL
Super Keys:
	Super Key is an attribute (or set of attributes) 
	that is used to uniquely identifies all attributes 
	in a relation

Candidate Key:
	Candidate Key is a proper subset of a super key

Difference between super keys and candidate keys:
	All super keys can’t be candidate keys,	But all candidate keys are super keys.
	Various super keys together makes the criteria to select the candidate keys.
	Various candidate keys together makes the criteria to select the primary keys.
	In a relation, number of super keys are more than number of candidate keys.

Primary Key:
	Is a minimal set of attribute (or set of attributes) that is used 
	to uniquely identifies all attributes in a relation.

Difference between primary keys and super keys and candidate keys:
	Super keys and candidate keys attributes can contain NULL values,
	while Primary keys attributes cannot contain NULL values.
	We can choose any of the minimal candidate key to be a primary key and
	various super keys together makes the criteria to select the candidate keys.

Alternate Key:
	Those candidate keys that are not selected as primary keys.

Foreign Key:
	Primary Keys of a table presented in another table, in which the second table calls them
	foreign keys and the first table calls them primary keys


Different Constraints:
	Not Null: 
		Ensures Null values cannot be stored in a column.
	Unique:
		Ensures that all values in a column are different.
	Check:
		Ensures that all the values in a column satisfy a specific condition.
	Default:
		Consists of a set of default values for a column when no value is specified.
	Index:
		Used to Create and retrieve data from the database very quickly.
*/
/*
Not null constraints for studentName and phoneNumber and unique constraint to studentName

Create table students(
	studentId int, 
	studentName varchar(100) unique not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100),
);
*/

/*
Altering a table to make some columns uniqe(adding constraints)
Alter Table students
	Add Constraint uniquness unique(studentName);
*/
/*
Altering a table's column to avoid getting null values
	Alter Table students
		Alter Column city varchar(100) Not null;
*/

/* 
Adding primary key consraint in two ways:

Drop table students;

Create table students(
	studentId int primary key, 
	studentName varchar(100) not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100),
);

Drop table students;

Create table students(
	studentId int, 
	studentName varchar(100) not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100),
	Primary Key(studentId),
);
*/
/*
Adding unique constraint to multiple columns:
Drop table students;
Create table students(
	studentId int, 
	studentName varchar(100) not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100),
	Primary Key(studentId),
	Constraint uniqenessOfStudents Unique(studentId, phoneNumber),
);
*/
/*
How to alter a table to add a unique constraint to a column
	Alter Table students Add Unique(studentId);
*/
/*
How to alter a table to drop a constraint 
	Alter Table students 
		Drop Constraint uniqenessOfStudents;
*/
/*
Adding check constraints while creating table:
*/
/*
Drop Table students;

Create table students(
	studentId int, 
	studentName varchar(100) not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100) Check (
		country = 'Iran'
	),
	Primary Key(studentId),
	Constraint uniqenessOfStudents Unique(studentId, phoneNumber),
);
*/
/*
Insert into students(studentId, studentName, parentName,
	phoneNumber, addressOfStudent, city, country) values
	(2, 'sina', 'hossein', 9151234567, 'Farhad Streen',
	'Tehran', 'US');
*/
/*
Adding Check constraint with alter operation
	Alter Table students
		Add Check(country = 'Iran');
*/
/* 
Adding Check constraint with alter operation, with giving constraint name
	Alter Table students
		Add constraint nameCheckConstraint Check (country = 'Iran');
*/
/*
now lets drop our constraint
Drop Constraint nameCheckConstraint;
*/

/*
Adding Default constraint
*/
/*
Drop table students;

Create table students(
	studentId int, 
	studentName varchar(100) not null,
	parentName varchar(100),
	phoneNumber bigInt not null,
	addressOfStudent varchar(256),
	city varchar(100),
	country varchar(100) Default 'Iran',
);
*/
/*
Adding default constraint with alter operation
Alter table students
	Add Default 'Tehran' for city;

Alter table students
	add constraint default_country
	Default 'Iran' for country;
	
Insert into students(studentId, studentName, parentName,
	phoneNumber, addressOfStudent, city) values
	(2, 'sina', 'hossein', 9151234567, 'Farhad Streen',
	'Tehran');
*/

/*
Adding index to columns for faster queries
	Create Index index_studentName
		On students (studentName);
*/
/*
Dropping index of a column
	Drop Index students.index_studentName;
*/
