--############################################################## ELIMINAR ####################################################################################--
--ELEMINAR	ESCALAO
--DROP PROC sp_delete_escalao
CREATE PROC sp_delete_escalao
@nome varchar(124)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			PRINT 'Nome: ' + @nome
			DELETE FROM Equipa WHERE FK_Nome_escalao=@nome
			UPDATE Atleta SET FK_Nome_escalao=null WHERE FK_Nome_escalao=@nome

			DELETE FROM Escalao WHERE Nome=@nome
			DELETE FROM Rel_Escalao_Pro_Saude WHERE FK_Nome_escalao=@nome

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		PRINT '(' + ERROR_MESSAGE() + ')'
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @nome varchar(124)
--EXEC sp_delete_escalao @nome='...'

----ELEMINAR	INSTALACAO
--DROP PROC sp_delete_instalacao
CREATE PROC sp_delete_instalacao
@nome varchar(124)
AS
BEGIN 
	PRINT 'Nome: ' + @nome
	DELETE FROM Instalacao WHERE Nome=@nome
END
GO

DECLARE @nome varchar(124)
EXEC sp_delete_instalacao @nome='...'

--ELIMINAR MATERIAL
--DROP PROC sp_delete_material
CREATE PROC sp_delete_material
@nome varchar(124)
AS
BEGIN 
	PRINT 'Nome: ' + @nome
	DELETE FROM Material WHERE Nome=@nome
END
GO

--DECLARE @nome varchar(124)
--EXEC sp_delete_material @nome='...'

--ELIMINAR EQUIPAMENTOS
--DROP PROC sp_delete_equipamento
CREATE PROC sp_delete_equipamento
@id int
AS
BEGIN 
	PRINT 'Numero_id: ' + STR(@id)
	DELETE FROM Equipamento WHERE Numero_id=@id
END
GO

--DECLARE @id int
--EXEC sp_delete_equipamento @id=...

--ELIMINAR EQUIPA
--DROP PROC sp_delete_equipa
CREATE PROC sp_delete_equipa
@id int
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			PRINT 'Número de identificação: ' + STR(@id)
			DELETE FROM Equipa WHERE Num_identificacao=@id
			DELETE FROM Rel_Modalidade_Equipa WHERE FK_Num_identificacao_equipa=@id

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @id int
--EXEC sp_delete_equipa @id=...

--ELIMINAR ATLETA
--DROP PROC sp_delete_atleta
CREATE PROC sp_delete_atleta
@cc varchar(15),
@nome_escalao varchar(124)
AS
BEGIN
	DECLARE @jogadores int
	SET @jogadores = (select dbo.getNumJogadoresAtualEquipa (@nome_escalao)) - 1;

	BEGIN TRY
		BEGIN TRAN

			PRINT 'Cartão cidadão: ' + STR(@cc)
			
			DELETE FROM Atleta WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Pessoa WHERE Cartao_cidadao=@cc
			DELETE FROM Rel_Responsavel_Atleta WHERE FK_Cartao_cidadao_atleta=@cc
	
			UPDATE Cavalo SET FK_Cartao_cidadao_atleta=null WHERE FK_Cartao_cidadao_atleta=@cc
			UPDATE Equipa SET Num_jogadores = @jogadores WHERE FK_Nome_escalao=@nome_escalao
		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @cc varchar(15), @nome_escalao varchar(124)
--EXEC sp_delete_atleta @cc=..., @nome_escalao=..., @deleteStatus=null, @deleteMessage=null

--ELIMINAR ADULTO RESPONSAVEL
--DROP PROC sp_delete_adulto_responsavel
CREATE PROC sp_delete_adulto_responsavel
@cc varchar(15)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN

			PRINT 'Cartão cidadão: ' + STR(@cc)

			DELETE FROM Adulto_Responsavel WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Pessoa WHERE Cartao_cidadao=@cc
			DELETE FROM Rel_Responsavel_Atleta WHERE FK_Cartao_cidadao_responsavel=@cc
			
		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @cc varchar(15)
--EXEC sp_delete_adulto_responsavel @cc=..., @deleteStatus=null, @deleteMessage=null

--ELIMINAR FUNCIONÁRIO
--DROP PROC sp_delete_funcionario
CREATE PROC sp_delete_funcionario
@cc varchar(15)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN

			--IF @cc != null
			--	PRINT 'Cartão cidadão: ' + STR(@cc)
			--ELSE
			--	PRINT 'Número de funcionário: ' + INT(@num_funcionario)
			--END

			DELETE FROM Funcionario WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Pessoa WHERE Cartao_cidadao=@cc 
			DELETE FROM Prof_Saude WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Rel_Escalao_Pro_Saude WHERE FK_Cartao_cidadao_saude=@cc

			DELETE FROM Diretor WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Treinador WHERE FK_Cartao_cidadao=@cc

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @cc varchar(15)
--EXEC sp_delete_funcionario @cc=..., @deleteStatus=null, @deleteMessage=null

--ELIMINAR TREINADOR
--DROP PROC sp_delete_treinador
CREATE PROC sp_delete_treinador
@cc varchar(15)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			--IF @cc != null
			--	PRINT 'Cartão cidadão: ' + STR(@cc)
			--ELSE
			--	PRINT 'Número de funcionário: ' + INT(@num_funcionario)
			--END

			DELETE FROM Treinador WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Funcionario WHERE FK_Cartao_cidadao=@cc
			DELETE FROM Pessoa WHERE Cartao_cidadao=@cc 

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
	END CATCH
END
GO

--DECLARE @cc varchar(15)
--EXEC sp_delete_treinador @cc=..., @deleteStatus=null, @deleteMessage=null