-- Name: Tyra Oberholzer
-- File: TSQL-Ex05-Tyra.sql
-- Date: August 02, 2020

---------------------------------------------------------------------------------------------------------------------

--You must use SQL Server to complete this exercise. Complete the following tasks. Look at the csv le
--named \data\USPresidents.csv in the data directory. Invoke SSMS, and complete the following steps.
--Your deliverable should be a plain text le (.txt) that contains a header showing your name, the name of
--the assignment, and the date. The body of the text le should echo the SQL statement you use to complete
--each step of the exercise and the results of the query.

----------------------------------------------------------------------------------------------------------------------

--1. Create an appropriate table schema.
--2. Insert the CSV data into the table you just created.
--3. Delete the column that contains the path to the images.
--4. Delete the rst record from your table using the output clause. This is the header.
--	You may combine the following two steps.
--	Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is
--	NOT NULL and UNIQUE.
--	Alter the presidents table by adding the column you created as a primary key column with a new
--	constraint.
--5. Bring the data up to date by updating the last row. Use the output clause.
--6. Bring the data up to date by adding a new row. Use the output clause.
--7. How many presidents from each state belonged to the various political parties? Aggregate by party
--and state. Note that this will in eect be a pivot table.
--8. Create a report showing the number of days each president was in office.
 --9. Create a report showing the age (in years) of each present when he took oce.
--10. See if there is any correlation between a president's party and reported religion, or lack of reported
--religion.


-------------------------------------------------------------------------------------------------------------------------

use TSQLV4;

CREATE TABLE Presidents(
	ID varchar(20),
	Last_Name varchar(50), 
	First_Name varchar(50),
	Middle_Name varchar(50),
	Order_of_Presidency varchar(50),
	Date_of_Birth varchar(50),
	Date_of_Death varchar(50),
	Town_Or_County_of_Birth varchar(50),
	State_of_Birth varchar(50),
	Home_State varchar(50),
	Party_Affliliation varchar(50),
	Date_Took_Office varchar(50),
	Date_Left_Office varchar(50),
	Assassination_Attempt varchar(50),
	Assassinated varchar(50),
	Religous_Afflilation varchar(50),
	Image_Path varchar(50)
);

BULK INSERT Presidents FROM 'C:\Users\Tyra\quantico06\ISTA420\USP.csv'
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

ALTER TABLE dbo.Presidents DROP COLUMN Image_Path;

select * from Presidents where ID = 'ID';
delete from Presidents where ID = 'ID';

alter table dbo.Presidents
	add IntColumn int identity not null
Constraint pk_dbo Primary Key (IntColumn);

insert into Presidents values(45, 'Trump', 'Donald', 'John', '45', '1946-06-14', ' ', 'Queens', 'New York', 'New York', 
'Republican', '2017-01-20', ' ', 'False', 'False', 'Presbyterian');
go
;

update dbo.Presidents set Date_Left_Office = '1/20/2009', Assassination_Attempt = 'False', Assassinated = 'False' where Last_Name = 'Obama';

select Home_State, Party_Affliliation, count(*) as counttotal
from dbo.Presidents
group by Home_State, Party_Affliliation
order by counttotal;

select Last_name, First_Name,  datediff(day, Date_Took_Office, Date_Left_Office) as TotNumDays from dbo.Presidents order by ID;

select Last_Name, First_Name, DATEDIFF(year, Date_of_Birth, Date_Took_Office) as NumYears from dbo.Presidents order by ID;

select Religous_Afflilation, Party_Affliliation, count(*) as counttotal
from dbo.Presidents
group by Religous_Afflilation, Party_Affliliation
order by Party_Affliliation;



