--INSERIR PESSOA -----------------------------------
CREATE TRIGGER createPessoa ON Pessoa
AFTER INSERT
AS
BEGIN
	DECLARE @total AS int;
	DECLARE @cartao_cidadao AS varchar(15);
	DECLARE @genero AS char(1);
	DECLARE @telemovel AS varchar(11);
	SELECT @cartao_cidadao = Cartao_cidadao FROM INSERTED;
	SELECT @genero = Genero FROM INSERTED;
	SELECT @telemovel = Contacto_telefonico FROM INSERTED;

	IF LEN(@cartao_cidadao) <> 9
	BEGIN
		RAISERROR('O cartão de cidadão tem de ter 9 números!' , 16, 1);
		ROLLBACK TRAN;
	END

	IF LEN(@telemovel) <> 9
	BEGIN
		RAISERROR('O número de telemóvel tem de ter 9 números!' , 16, 1);
		ROLLBACK TRAN;
	END

	SELECT @total = count(*) FROM Pessoa WHERE Cartao_cidadao = @cartao_cidadao;
	IF @total > 1
	BEGIN 
		RAISERROR('O cartão de cidadão apresentado já existe na base de dados!' , 16, 1);
		ROLLBACK TRAN;
	END

	IF @genero <> 'F' AND @genero <> 'M'
	BEGIN
		RAISERROR('O género introduzido não é válido!' , 16, 1);
		ROLLBACK TRAN;
	END
END
GO

--INSERIR FUNCION�RIO -----------------------------------
CREATE TRIGGER createFuncionario ON Funcionario
AFTER INSERT
AS
BEGIN
	DECLARE @total AS int;
	DECLARE @num_funcionario AS int;
	SELECT @num_funcionario = Num_funcionario FROM INSERTED;

	IF LEN(@num_funcionario) <> 6
	BEGIN
		RAISERROR('O n�mero de funcion�rio tem de ter 6 n�meros!' , 16, 1);
		ROLLBACK TRAN;
	END

	SELECT @total = count(*) FROM Funcionario WHERE Num_funcionario = @num_funcionario;
	IF @total > 1
	BEGIN 
		RAISERROR('O n�mero de funcion�rio apresentado j� existe na base de dados!' , 16, 1);
		ROLLBACK TRAN;
	END
END
GO

--INSERIR PROFISSIONAL SA�DE -----------------------------------
CREATE TRIGGER createProSaude ON Prof_Saude
AFTER INSERT
AS
BEGIN
	DECLARE @total AS int;
	DECLARE @num_cedula_profissional AS varchar(7);
	SELECT @num_cedula_profissional = Num_cedula_profissional FROM INSERTED;

	IF LEN(@num_cedula_profissional) <> 6 AND @num_cedula_profissional NOT LIKE '[A-Z][A-Z][0-9][0-9][0-9][0-9]'
	BEGIN
		RAISERROR('O n�mero de c�dula profissional n�o � v�lido!' , 16, 1);
		--ROLLBACK TRAN;
	END

	SELECT @total = count(*) FROM Prof_Saude WHERE Num_cedula_profissional = @num_cedula_profissional;
	IF @total > 1
	BEGIN 
		RAISERROR('O n�mero de c�dula profissional apresentado j� existe na base de dados!' , 16, 1);
		--ROLLBACK TRAN;
	END
END
GO

--INSERIR CAVALO -----------------------------------
CREATE TRIGGER createCavalo ON Cavalo
AFTER INSERT
AS
BEGIN
	DECLARE @total AS int;
	DECLARE @total_id_chip AS int;
	DECLARE @cartao_cidadao AS varchar(15);
	DECLARE @num_id_chip AS int;
	SELECT @cartao_cidadao = FK_Cartao_cidadao_atleta FROM INSERTED;
	SELECT @num_id_chip = Num_identificacao_chip FROM INSERTED;


	IF LEN(@num_id_chip) <> 5
	BEGIN
		RAISERROR('O n�mero de identifica��o do chip tem de ter 5 n�meros!' , 16, 1);
		ROLLBACK TRAN;
	END

	SELECT @total = count(*) FROM Cavalo WHERE Num_identificacao_chip = @num_id_chip;
	IF @total > 1
	BEGIN 
		RAISERROR('O n�mero de identifica��o do chip apresentado j� existe na base de dados!' , 16, 1);
		ROLLBACK TRAN;
	END

	SELECT @total = count(*) FROM Cavalo WHERE FK_Cartao_cidadao_atleta = @cartao_cidadao;
	--IF @total = 1 OR @cartao_cidadao=null
	IF @total = 0 AND @cartao_cidadao <> null
	BEGIN 
		RAISERROR('O atleta apresentado n�o existe na base de dados!' , 16, 1);
		ROLLBACK TRAN;
	END
END
GO

--INSERIR EQUIPA -----------------------------------
CREATE TRIGGER createEquipa ON Equipa
AFTER INSERT
AS
BEGIN
	DECLARE @total AS int;
	DECLARE @nome_escalao AS varchar(124);
	SELECT @nome_escalao = FK_Nome_escalao FROM INSERTED;

	SELECT @total = count(*) FROM Equipa WHERE FK_Nome_escalao = @nome_escalao;
	IF @total > 1
	BEGIN 
		RAISERROR('J� existe uma equipa deste escal�o na base de dados!' , 16, 1);
		ROLLBACK TRAN;
	END
END
GO

-- INSERIR ATLETA -----------------------------------
CREATE TRIGGER createAtleta ON Atleta
AFTER INSERT
AS
BEGIN
    DECLARE @cartao_cidadao AS varchar(15);
    DECLARE @idade AS int;
    DECLARE @nome_escalao AS varchar(124);
    SELECT @cartao_cidadao = FK_Cartao_cidadao FROM INSERTED;
	PRINT 'cc: ' + @cartao_cidadao
    SELECT @idade = Idade FROM INSERTED;
    SELECT @nome_escalao = FK_Nome_escalao FROM INSERTED;

    DECLARE @rangeAge varchar(7);
    SELECT @rangeAge = Idade FROM Escalao WHERE Nome=@nome_escalao;

    DECLARE @StartValue int, @EndValue INT;

    IF CHARINDEX('-', @rangeAge) > 0
    BEGIN
        SET @StartValue = CAST(PARSENAME(REPLACE(@rangeAge, '-', '.'), 2) AS int);
        SET @EndValue = CAST(PARSENAME(REPLACE(@rangeAge, '-', '.'), 1) AS int);
    END;

    IF CHARINDEX('+', @rangeAge) > 0
    BEGIN
        SET @StartValue = CAST(PARSENAME(REPLACE(@rangeAge, '+', '.'), 2) AS int);
        SET @EndValue = NULL;
    END;

    DECLARE @generoequipa char(1);
    SET @generoequipa = (SELECT dbo.getGeneroEquipa (@nome_escalao));
	PRINT 'generoequipa: ' + @generoequipa

    DECLARE @generoatleta char(1);
    SET @generoatleta = (SELECT dbo.getGeneroAtleta(@cartao_cidadao));
	PRINT 'generoatleta: ' + @generoatleta

	PRINT 'Idade: ' + str(@idade)
	PRINT 'Start: ' + str(@StartValue)
	PRINT 'End: ' + str(@EndValue)

    IF @idade < @StartValue OR @idade > @EndValue
    BEGIN
        RAISERROR ('A idade do atleta n�o � v�lida para o escal�o introduzido!', 16, 1);
		ROLLBACK TRAN;
    END;
    ELSE IF @generoequipa <> @generoatleta
    BEGIN
        RAISERROR ('O(A) atleta n�o pode ser introduzido(a) nesta equipa porque n�o corresponde ao g�nero da mesma!', 16, 1);
    END;
END;
GO

-- SELECTS ----------------------------------------------------
select * from Pessoa
select * from Atleta
select * from Equipa
--select * from Adulto_Responsavel
select * from Funcionario
select * from Prof_Saude
--select * from Treinador
select * from Cavalo