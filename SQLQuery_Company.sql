--CREATE SCHEMA Company;
--GO
--CREATE DATABASE Company;

--CREATE TABLE Company.Department(
--	Dname			varchar(30)		not null,
--	Dnumber			int				CHECK(Dnumber>0),
--	Mgr_Ssn			varchar(9),
--	Mgr_start_date	date,

--	PRIMARY KEY(Dnumber)
--);

--CREATE TABLE Company.Dept_locations(
--	Dnumber							int,
--	Dlocation						varchar(15),

--	PRIMARY KEY(Dnumber, Dlocation),
--	FOREIGN KEY (Dnumber) REFERENCES Company.Department(Dnumber)
--);

--CREATE TABLE Company.Employee(
--	Fname			varchar(20)		not null,
--	Minit			char(1),
--	Lname			varchar(20)		not null,
--	Ssn				varchar(9),
--	Bdate			date,
--	[Address]		varchar(50),
--	Sex				char(1)			not null		CHECK(Sex='F' OR Sex='M'),
--	Salary			decimal(6,2)	not null		CHECK(Salary>=0),
--	Super_ssn		varchar(9),
--	Dno				int				not null,

--	PRIMARY KEY (Ssn),
--	FOREIGN KEY (Dno) REFERENCES Company.Department(Dnumber)
--);

--CREATE TABLE Company.Project(
--	Pname			varchar(30)		not null,
--	Pnumber			int				CHECK(Pnumber>0),
--	Plocation		varchar(15)		not null,
--	Dnum			int				not null,

--	PRIMARY KEY(Pnumber),
--	FOREIGN KEY(Dnum) REFERENCES Company.Department(Dnumber)
--);

--CREATE TABLE Company.Works_on(
--	Essn			varchar(9),
--	Pno				int,
--	[Hours]			decimal(4,2)	not null,

--	PRIMARY KEY(Essn, Pno),
--	FOREIGN KEY(Essn) REFERENCES Company.Employee(Ssn),
--	FOREIGN KEY(Pno) REFERENCES	Company.Project(Pnumber)
--);

--CREATE TABLE Company.[Dependent](
--	Essn			varchar(9),
--	Dependent_name	varchar(50),
--	Sex				char(1)			not null		CHECK(Sex='F' OR Sex='M'),
--	Bdate			date,
--	Relationship	varchar(15)		not null,

--	PRIMARY KEY(Essn, Dependent_name),
--	FOREIGN KEY(Essn) REFERENCES Company.Employee(Ssn)
--);

--ALTER TABLE Company.Employee ADD CONSTRAINT employeeSuper FOREIGN KEY (Super_ssn) REFERENCES Company.Employee (Ssn);


--INSERT INTO COMPANY.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Investigacao',1,21312332,'2010-08-02')
--INSERT INTO COMPANY.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Comercial',2,321233765,'2013-05-16')
--INSERT INTO COMPANY.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Logistica',3,41124234,'2013-05-16')
--INSERT INTO COMPANY.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Recursos Humanos',4,12652121,'2014-04-02')
--INSERT INTO COMPANY.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)VALUES('Desporto',5,NULL,NULL)

--INSERT INTO COMPANY.DEPT_LOCATIONS(Dnumber, Dlocation)VALUES(2, 'Aveiro')
--INSERT INTO COMPANY.DEPT_LOCATIONS(Dnumber, Dlocation)VALUES(3, 'Coimbra')

--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Paula','A','Sousa',183623612,'2001-08-11','Rua da FRENTE','F',1450.00,NULL,3)
--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Carlos','D','Gomes',21312332,'2000-01-01','Rua XPTO','M',1200.00,NULL,1)
--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Juliana','A','Amaral',321233765,'1980-08-11','Rua BZZZZ','F',1350.00,NULL,3)
--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Maria','I','Pereira',342343434,'2001-05-01','Rua JANOTA','F',1250.00,21312332,2)
--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Joao','G','Costa',41124234,'2001-01-01','Rua YGZ','M',1300.00,21312332,2)
--INSERT INTO COMPANY.EMPLOYEE(Fname,Minit,Lname,Ssn,Bdate,[Address],Sex,Salary,Super_ssn,Dno)VALUES('Ana','L','Silva',12652121,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,2)

--INSERT INTO COMPANY.PROJECT(Pname,Pnumber,Plocation,Dnum)VALUES('Aveiro Digital',1,'Aveiro',3)
--INSERT INTO COMPANY.PROJECT(Pname,Pnumber,Plocation,Dnum)VALUES('BD Open Day',2,'Espinho',2)
--INSERT INTO COMPANY.PROJECT(Pname,Pnumber,Plocation,Dnum)VALUES('Dicoogle',3,'Aveiro',3)
--INSERT INTO COMPANY.PROJECT(Pname,Pnumber,Plocation,Dnum)VALUES('GOPACS',4,'Aveiro',3)

--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(183623612,1,20.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(183623612,3,10.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(21312332 ,1,20.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(321233765,1,25.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(342343434,1,20.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(342343434,4,25.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(41124234,2,20.0)
--INSERT INTO COMPANY.WORKS_ON(Essn,Pno,[Hours])VALUES(41124234,3,30.0)

--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Joana Costa','F','2008-04-01','Filho')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Maria Costa','F','1990-10-05','Neto')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(21312332,'Rui Costa','M','2000-08-04','Neto')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(321233765,'Filho Lindo','M','2001-02-22','Filho')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(342343434,'Rosa Lima','F','2006-03-11','Filho')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(41124234,'Ana Sousa','F','2007-04-13','Neto')
--INSERT INTO COMPANY.[DEPENDENT](Essn,Dependent_name,Sex,Bdate,Relationship)VALUES(41124234,'Gaspar Pinto','M','2006-02-08','Sobrinho')


--select * from Company.Project

-- a)
--CREATE PROC sp_delete_employee 
--	@ssn varchar(9) --argumento de entrada ssn
--AS
--	BEGIN
--		PRINT 'ssn value: ' + STR(@ssn)
--		--declare @ssn varchar(9) = '21312332';
--		DELETE FROM Company.[Dependent] WHERE Essn=@ssn
--		DELETE FROM Company.Works_on WHERE Essn=@ssn

--		DELETE FROM Company.Employee WHERE Ssn=@ssn

--		UPDATE Company.Department SET Mgr_ssn=null WHERE Mgr_ssn=@ssn
--		UPDATE Company.Employee SET Super_ssn=null WHERE Super_ssn=@ssn
--	END
--GO

--DECLARE @ssn varchar(9)
--EXEC sp_delete_employee @ssn='21312332'

--DROP PROCEDURE sp_delete_employee



--b)
--CREATE PROC sp_dep_manager
--	(@mgr_ssn varchar(9) OUTPUT, @mgr_years int OUTPUT)
--AS 
--	BEGIN
--		SELECT Fname, Minit, Lname, Ssn, Salary, Dname, Dnumber FROM Company.Employee JOIN Company.Department ON Company.Employee.SSn=Company.Department.Mgr_Ssn;
--		SELECT @mgr_ssn = Company.Department.Mgr_ssn, @mgr_years = DATEDIFF(year, Mgr_start_date, GETDATE()) FROM Company.Department
--			WHERE Mgr_start_date = (SELECT MIN(Mgr_start_date) FROM Company.Department);
--	END
--GO
--DECLARE @mgr_ssn varchar(9)
--DECLARE @mgr_years int
--EXEC sp_dep_manager @mgr_ssn OUTPUT,  @mgr_years OUTPUT
--PRINT 'Mgr_ssn value: ' + STR(@mgr_ssn)
--PRINT 'Mgr_years value: ' + STR(@mgr_years)

--DROP PROCEDURE sp_dep_manager



--c)
--GO
--CREATE TRIGGER one_manager ON Company.Department
--	AFTER INSERT, UPDATE 
--AS
--	BEGIN
--		DECLARE @ssn varchar(9);
--		SELECT @ssn = Mgr_ssn FROM inserted;
--		--IF(SELECT COUNT(*) FROM Company.Department WHERE Mgr_ssn=@ssn) >=1
--		if (exists (select * from Company.Department where Mgr_ssn=@ssn))
--			BEGIN
--				RAISERROR('This employee already manages one department', 16, 1);
--				ROLLBACK TRAN;
--			END
--	END
--GO

--DROP TRIGGER one_manager

--INSERT INTO Company.Department VALUES ('DEPT1', 8, 21312332, '2023-05-11');
--INSERT INTO Company.Department VALUES ('DEPT2', 6, NULL, '2023-05-12');
--INSERT INTO Company.Department VALUES ('DEPT3', 7, 123456789, '2023-05-13');
--update Company.Department set Mgr_Ssn='21312332' where Dnumber=5


--d)
--GO
--CREATE TRIGGER ssn_mgr_salary ON Company.Employee
--	AFTER INSERT, UPDATE
--AS
--	BEGIN
--		DECLARE @e_ssn varchar(9);
--		DECLARE @e_salary decimal(6,2);
--		DECLARE @Dnumber int;
--		DECLARE @m_salary decimal(6,2);

--		SELECT @e_ssn = Ssn, @e_salary = Salary, @Dnumber = Dno FROM inserted;
--		SELECT @m_salary = Salary FROM Company.Employee JOIN Company.Department ON Ssn=Mgr_ssn WHERE Dno=@Dnumber;

--		IF(@e_salary > @m_salary)
--			BEGIN
--				UPDATE Company.Employee SET @e_salary = (@m_salary - 1) WHERE Ssn=@e_ssn
--			END
--	END
--GO

--insert into Company.Employee values ('Vasco', 'L', 'Ramos', '123445678', '1999-07-08', null, 'M', 1201 , null, 1);

--e)
--GO
--CREATE FUNCTION Company.ssn_project (@ssn varchar(9)) RETURNS table
--AS
--	RETURN (SELECT Pname, Pnumber FROM Company.Works_on JOIN Company.Project ON Pno=Pnumber WHERE Essn=@ssn);
--GO

--select * from Company.ssn_project('342343434');


select * from Company.Employee
Select * from Company.Department
Select * from Company.[Dependent]
Select * from Company.Project
Select * from Company.Works_on