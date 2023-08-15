# BD: Guião 9


## ​9.1
 
### *a)*

```
... Write here your answer ...
CREATE PROC sp_delete_employee 
	@ssn varchar(9) --argumento de entrada ssn
AS
	BEGIN
		PRINT 'ssn value: ' + STR(@ssn)
		--declare @ssn varchar(9) = '21312332';
		DELETE FROM Company.[Dependent] WHERE Essn=@ssn
		DELETE FROM Company.Works_on WHERE Essn=@ssn

		DELETE FROM Company.Employee WHERE Ssn=@ssn

		UPDATE Company.Department SET Mgr_ssn=null WHERE Mgr_ssn=@ssn
		UPDATE Company.Employee SET Super_ssn=null WHERE Super_ssn=@ssn
	END
GO

DECLARE @ssn varchar(9)
EXEC sp_delete_employee @ssn='21312332'

Preocupações adicionais: Update do Mgr_ssn no Department e na tabela Employee
```

### *b)* 

```
... Write here your answer ...
CREATE PROC sp_dep_manager
	(@mgr_ssn varchar(9) OUTPUT, @mgr_years int OUTPUT)
AS 
	BEGIN
		SELECT Fname, Minit, Lname, Ssn, Salary, Dname, Dnumber FROM Company.Employee JOIN Company.Department ON Company.Employee.SSn=Company.Department.Mgr_Ssn;
		SELECT @mgr_ssn = Company.Department.Mgr_ssn, @mgr_years = DATEDIFF(year, Mgr_start_date, GETDATE()) FROM Company.Department
			WHERE Mgr_start_date = (SELECT MIN(Mgr_start_date) FROM Company.Department);
	END
GO
DECLARE @mgr_ssn varchar(9)
DECLARE @mgr_years int
EXEC sp_dep_manager @mgr_ssn OUTPUT,  @mgr_years OUTPUT
PRINT 'Mgr_ssn value: ' + STR(@mgr_ssn)
PRINT 'Mgr_years value: ' + STR(@mgr_years)
```

### *c)* 

```
... Write here your answer ...
GO
CREATE TRIGGER one_manager ON Company.Department
	AFTER INSERT, UPDATE 
AS
	BEGIN
		DECLARE @ssn varchar(9);
		SELECT @ssn = Mgr_ssn FROM inserted;
		if (exists (select * from Company.Department where Mgr_ssn=@ssn))
			BEGIN
				RAISERROR('This employee already manages one department', 16, 1);
				ROLLBACK TRAN;
			END
	END
GO
```

### *d)* 

```
... Write here your answer ...
GO
CREATE TRIGGER ssn_mgr_salary ON Company.Employee
	AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @e_ssn varchar(9);
		DECLARE @e_salary decimal(6,2);
		DECLARE @Dnumber int;
		DECLARE @m_salary decimal(6,2);

		SELECT @e_ssn = Ssn, @e_salary = Salary, @Dnumber = Dno FROM inserted;
		SELECT @m_salary = Salary FROM Company.Employee JOIN Company.Department ON Ssn=Mgr_ssn WHERE Dno=@Dnumber;

		IF(@e_salary > @m_salary)
			BEGIN
				UPDATE Company.Employee SET @e_salary = (@m_salary - 1) WHERE Ssn=@e_ssn
			END
	END
GO
```

### *e)* 

```
... Write here your answer ...
GO
CREATE FUNCTION Company.ssn_project (@ssn varchar(9)) RETURNS table
AS
	RETURN (SELECT Pname, Pnumber FROM Company.Works_on JOIN Company.Project ON Pno=Pnumber WHERE Essn=@ssn);
GO

select * from Company.ssn_project('342343434');
```

### *f)* 

```
... Write here your answer ...
```

### *g)* 

```
... Write here your answer ...
```

### *h)* 

```
... Write here your answer ...
```

### *i)* 

```
... Write here your answer ...
```
