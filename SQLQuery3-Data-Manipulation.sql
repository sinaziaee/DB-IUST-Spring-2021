Use studentsInfo;
Go
/*
Drop Table students;

Create table students(
	studentId int Identity(1,1) primary key, 
	studentName varchar(100) unique,
	phoneNumber bigInt ,
	city varchar(100) not null,
	country varchar(100) Default 'Iran',
);
*/
/*
insert into students(studentName, phoneNumber, city, country)
	values ('Sina Ziaee', 9151234567, 'Mashhad', 'Iran'),
	('Mohsen Lotfali', 9151234567, 'Ghom', 'Iran'),
	('Mohammad Najafi', 9151234567, 'Birjand', 'Iran'),
	('Mina Safaee', 9151234567, 'Bojnord', 'Iran'),
	('Sarah Hashemi', 9151234567, 'Tehran', 'Iran'),
	('Ali Ziaee', 9151234567, 'Mashhad', 'Iran'),
	('Nima Abdi', 9151234567, 'Tehran', 'Iran'),
	('Maraym Sabahi', 9151234567, 'Yazd', 'Iran'),
	('Hassan Rohani', 9151234567, 'Isfahan', 'Iran'),
	('Saba Kamali', 9151234567, 'Tehran', 'Iran'),
	('Logan Paul', 9151234567, 'New York', 'US'),
	('David Dobrik', 9151234567, 'Los Angeleas', 'US');
*/
/*
Select city From students;
Select Distinct city From students;
*/
/*
Select Top 8 * From students Order by studentId;
Select Top 8 * From students Order by city;
*/

/* Group By 
Selecting with grouping by on city
*/ 
/*
Select Count(studentId) as NoStuentsFromEachCity, city From students Group by city;
Select Count(studentId) as NoStuentsFromEachCity, studentName, city 
	From students Group by city, studentName;
*/
