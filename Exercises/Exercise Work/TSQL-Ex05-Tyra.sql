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
--8. Create a report showing the number of days each president was in oce.
--9. Create a report showing the age (in years) of each present when he took oce.
--10. See if there is any correlation between a president's party and reported religion, or lack of reported
--religion.

-------------------------------------------------------------------------------------------------------------------------