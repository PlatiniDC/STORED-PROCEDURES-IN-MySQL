-- STORED PROCEDURES

-- A stored procedure is a set of precompiled sql statements
-- saved in the data base server, instead of sending multiple individual queries. 
-- you can execute a single stored procedure to perform complex tasks. 

SELECT *
FROM employee_salary
WHERE salary >= 50000
;
-- the above only displays a column of employees whose salaries are 50k and above

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000
;
-- the above shows a procedure has been created and it is saved in the database
-- under the stored ptocedures as the name large_salaries. 

-- just as you created a ptocedure. it can also be called
-- see below

CALL large_salaries();

-- if the above runs, it gives the exact same return. 

-- using a store procedure, you can store multiple queries with the aid of a delimiter
-- a delimiter is used to signal the end of a statement in mysql to the client program
-- delimeter by default is (;)
-- you can temporarily change the delimiter by using the delimeter command
-- followed by chosen symbol. common symbol includes (// or $$). 

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$

-- BY DOING THIS YOU HAVE CHANGED THE DEFAULT DELIMITER SO YOU HAVE TO
-- CHANGE THE DELIMITER AGAIN. SEE BELOW

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

-- THE ABOVE CHANGES THE DELIMITER. 
-- TO SEE YOUR STORE PROCEDURE ROUTINE. YOU HAVE TO RIGHT CLICK ON IT AND SELECT
-- ALTER STORED PROCEDURE.

CALL large_salaries3();

-- IF WE CALL THIS, WE HAVE TWO TABLES. FIRST ONE SHOWS WHERE THE SALARY IS 50K AND ABOVE
-- THE SECOND ONE SHOWS THE ENTIRE TABLE CAUSE ALL EMPLOYEES EARN ABOVE 10K

-- WE CAN CREATE A PROCEDURE AUTOMATICALLY BY RIGHT CLICKING ON STORED PROCEDURE
-- THEN CLICK CREATE NEW PROCEDURES AND INPUT YOUR CODES. INSTEAD OF TYPING IT OUT MANUALLY. 
-- SEE WHAT IT LOOKS LIKE BELOW

USE `parks_and_recreation`;
DROP procedure IF EXISTS `new_procedure`;

DELIMITER $$
USE `parks_and_recreation`$$
CREATE PROCEDURE `new_procedure` ()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END$$

DELIMITER ;

-- IF I RUN THE ABOVE CODE, IT WONT WORK CAUSE I ALREADY CREATED A PROCEDURE UNDER THIS NAME (new_procedure)
-- so it will drop the procedure cause it already exists. so it is always advsable to do it the automatic way. 

-- PARAMETERS
-- Parameters are variables that are passed as an input into a store procedure
-- and it allows the store procedure to accept an input value and place it into the code.

DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id_param INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id_param
	;
	END $$
DELIMITER ;

CALL large_salaries4(1)

-- THE parameters does not work in the actual code of the stored procedure, it only
-- works when calling the stored procedure.
-- for the call to work you must have given the parameter a name of your choice 
-- and make sure the param is equal to where you are calling from using a WHERE CLAUSE. 
-- employee_id_param is a parameter telling you that the parameter needed for calling is the employee_id on
-- the salary table. n:b you can name your parameter as anything.

-- the above only retunrs the salry row for the employee with employee_id (1)


