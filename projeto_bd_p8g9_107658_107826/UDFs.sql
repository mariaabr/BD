CREATE FUNCTION dbo.getNextNumInscricaoAtleta () RETURNS INT
AS
	BEGIN 
		declare @num_inscricao as int
		SELECT @num_inscricao = max(Num_inscricao) + 1 FROM  Atleta
		return @num_inscricao
	end
GO

CREATE FUNCTION dbo.getNextNumChipCavalo () RETURNS INT
AS
	BEGIN 
		declare @num_id_chip as int
		SELECT @num_id_chip = max(Num_identificacao_chip) + 1 FROM  Cavalo
		return @num_id_chip
	end
GO

CREATE FUNCTION dbo.getNumJogadoresAtualEquipa (@nome_escalao varchar(124)) RETURNS INT
AS
	BEGIN
		DECLARE @num_jogadores as int
		SELECT @num_jogadores = Num_jogadores FROM  Equipa WHERE @nome_escalao = FK_Nome_escalao
		RETURN @num_jogadores
	END
GO

SELECT dbo.getNumJogadoresAtualEquipa('Seniores Rugby')

CREATE FUNCTION GetAdultoResponsavelDataIn(@CartaoCidadao VARCHAR(15))
RETURNS VARCHAR(25)
AS
BEGIN
    DECLARE @DataIn VARCHAR(25);

    SELECT @DataIn = Data_in
    FROM Rel_Atleta_Responsavel
    WHERE Cartao_cidadao = @CartaoCidadao;

    RETURN @DataIn;
END
GO

CREATE FUNCTION GetAdultoResponsavelDataOut(@CartaoCidadao VARCHAR(15))
RETURNS VARCHAR(25)
AS
BEGIN
    DECLARE @DataOut VARCHAR(25);

    SELECT @DataOut = data_out
    FROM Rel_Atleta_Responsavel
    WHERE FK_Cartao_cidadao = @CartaoCidadao;

    RETURN @DataOut;
END
GO

CREATE FUNCTION dbo.getGeneroEquipa (@nome_escalao varchar(124)) RETURNS char(1)
AS
	BEGIN
		DECLARE @generoequipa as char(1)

		SELECT @generoequipa = Genero FROM  Equipa WHERE @nome_escalao=FK_Nome_escalao
		RETURN @generoequipa
	END
GO

CREATE FUNCTION dbo.getGeneroAtleta (@cartao_cidadao varchar(15)) RETURNS char(1)
AS
	BEGIN
		DECLARE @generoatleta as char(1)

		SELECT @generoatleta = Genero FROM Pessoa JOIN Atleta ON Cartao_cidadao=FK_Cartao_cidadao WHERE @cartao_cidadao=Cartao_cidadao
		RETURN @generoatleta
	END
GO

SELECT dbo.getGeneroAtleta('212577442')