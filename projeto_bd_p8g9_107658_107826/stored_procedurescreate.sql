--###################### STORED PROCEDURE PARA ADICIONAR UMA INSTALACAO ############################
CREATE PROC sp_createInstalacao
  @Nome varchar(124),
  @Morada varchar(250),
  @FK_Num_identificacao_modalidade int
AS
BEGIN
  INSERT INTO Instalacao ([Nome], [Morada], [FK_Num_identificacao_modalidade])
  VALUES (@Nome, @Morada, @FK_Num_identificacao_modalidade)
END

CREATE PROC sp_updateEquipamento
  @Numero_id int,
  @Quantidade int
AS
BEGIN
  UPDATE Equipamento SET Quantidade=@Quantidade WHERE Numero_id=@Numero_id
END

EXEC sp_updateEquipamento @Numero_id='47', @Quantidade='25'
--EXEC sp_createInstalacao '...', '...', ...;

--##########################STORED PROCEDURE PARA ADICIONAR MATERIAL ################################
CREATE PROC sp_createMaterial
  @Nome varchar(124),
  @Num_identificacao_modalidade int,
  @Quantidade int
AS
BEGIN
  INSERT INTO Material ([Nome], [FK_Num_identificacao_modalidade], [Quantidade])
  VALUES (@Nome, @Num_identificacao_modalidade, @Quantidade)
END

CREATE PROC sp_updateMaterial
  @Nome varchar(124),
  @Quantidade int
AS
BEGIN
  UPDATE Material SET Quantidade=@Quantidade WHERE Nome=@Nome
END

EXEC sp_updateMaterial @Nome='Varas', @Quantidade='150'
--EXEC sp_createMaterial '...', ..., ...;

--##########################STORED PROCEDURE PARA ADICIONAR EQUIPAMENTO ###############################
CREATE PROC sp_createEquipamento
  @Cor varchar(124),
  @Num_identificacao_modalidade int,
  @Categoria varchar(125),
  @Tamanho varchar(15),
  @Material varchar(124),
  @Quantidade int
AS
BEGIN
  INSERT INTO Equipamento ([Cor], [FK_Num_identificacao_modalidade], [Categoria], [Tamanho], [Material], [Quantidade])
  VALUES (@Cor, @Num_identificacao_modalidade, @Categoria, @Tamanho, @Material, @Quantidade)
END

--EXEC sp_createEquipamento '...', ..., '...', '...', '...', ...;

--#############################STORED PROCEDURE PARA CRIAR UMA EQUIPA ################################
CREATE PROC sp_createEquipa
  @Nome_escalao varchar(124),
  @Nome varchar(255),
  @Genero varchar(255),
  @Num_jogadores int
AS
BEGIN
  DECLARE @Num_identificacao int

  --Get the next identity value for the Num_identificacao column
  SELECT @Num_identificacao = ISNULL(MAX(Num_identificacao), 0) + 1 FROM Equipa

  INSERT INTO Equipa ([FK_Nome_escalao], [Nome], [Genero], [Num_jogadores])
  VALUES (@Nome_escalao, @Nome, @Genero, @Num_jogadores)
END

--EXEC sp_createEquipa '...', '...', '...', ...;

--#############################STORED PROCEDURE PARA CRIAR UMA PESSOA ################################
CREATE PROC sp_createPessoa
	@nome varchar(250),
	@genero char(1),
	@cartao_cidadao varchar(15),
	@telemovel varchar(11),
	@email varchar(250)
AS
	BEGIN
		INSERT INTO Pessoa([Nome],[Genero],[Cartao_cidadao],[Contacto_telefonico],[email]) VALUES (@nome, @genero, @cartao_cidadao, @telemovel, @email);
	END
GO

--EXEC sp_createPessoa @nome='Rodrigo Santos', @cartao_cidadao='213365122', @telemovel='917787744', @email='rodrigo_santos@gmail.com'

--#############################STORED PROCEDURE PARA CRIAR UM ATLETA ################################
CREATE PROC sp_createAtleta
	@nome varchar(250),
	@genero char(1),
    @cartao_cidadao varchar(15),
	@telemovel varchar(11),
    @email varchar(250),
	@declaracao_medica varchar(25),
	@ref_transacao_bancaria varchar (34),
	@idade int,
	@nome_escalao varchar(124),
	@genero_responsavel char(1),
	@nome_responsavel varchar(250),
	@cartao_cidadao_responsavel varchar(15),
	@telemovel_responsavel varchar(11),
    @email_responsavel varchar(250),
	@parentesco varchar(15), 
	@data_in varchar(25),
	@data_out varchar(25)
AS
BEGIN
    BEGIN TRANSACTION; 
		DECLARE @num_inscricao int;
		SET @num_inscricao = (SELECT dbo.getNextNumInscricaoAtleta());

		DECLARE @jogadores int
		SET @jogadores = (select dbo.getNumJogadoresAtualEquipa (@nome_escalao)) + 1;

		IF @idade < 18
		BEGIN
			BEGIN TRY
				-- INSERT Athlete
				EXEC sp_createPessoa @nome=@nome, @genero=@genero, @cartao_cidadao=@cartao_cidadao, @telemovel=@telemovel, @email=@email;
				INSERT INTO Atleta([FK_Cartao_cidadao], num_inscricao, [Declaracao_medica], [Ref_transacao_bancaria], [Idade], [Fk_Nome_escalao]) VALUES(@cartao_cidadao, @num_inscricao, @declaracao_medica, @ref_transacao_bancaria, @idade, @nome_escalao);

				-- INSERT Responsible Adult
				EXEC sp_createPessoa @nome=@nome_responsavel, @genero=@genero_responsavel,  @cartao_cidadao=@cartao_cidadao_responsavel, @telemovel=@telemovel_responsavel, @email=@email_responsavel;
				INSERT INTO Adulto_Responsavel ([FK_Cartao_cidadao], [Grau_parentesco]) VALUES (@cartao_cidadao_responsavel, @parentesco);

				-- INSERT Relationship between Athlete and Responsible Adult
				INSERT INTO Rel_Responsavel_Atleta ([FK_Cartao_cidadao_atleta], [FK_Cartao_cidadao_responsavel], [Data_in], [Data_out]) VALUES (@cartao_cidadao, @cartao_cidadao_responsavel, @data_in, @data_out);

				UPDATE Equipa SET Num_jogadores = @jogadores WHERE FK_Nome_escalao=@nome_escalao
				COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
		END
		ELSE
		BEGIN
			BEGIN TRY
				-- INSERT Athlete
				EXEC sp_createPessoa @nome=@nome, @genero=@genero, @cartao_cidadao=@cartao_cidadao, @telemovel=@telemovel, @email=@email;
				INSERT INTO Atleta([FK_Cartao_cidadao], num_inscricao, [Declaracao_medica], [Ref_transacao_bancaria], [Idade], [Fk_Nome_escalao]) VALUES(@cartao_cidadao, @num_inscricao, @declaracao_medica, @ref_transacao_bancaria, @idade, @nome_escalao);

				UPDATE Equipa SET Num_jogadores = @jogadores WHERE FK_Nome_escalao=@nome_escalao
				COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
		END
END
GO

EXEC sp_createAtleta @nome='Manel Castro', @genero='M', @cartao_cidadao='212577322', @telemovel='913912987', @email='m_castro@gmail.com',
					 @declaracao_medica='2023', @ref_transacao_bancaria='551308851', @idade='21', @nome_escalao='Seniores Basket',
					 @nome_responsavel=null, @genero_responsavel=null, @cartao_cidadao_responsavel=null, @telemovel_responsavel=null, @email_responsavel=null,
					 @parentesco=null, @data_in=null, @data_out=null

select * from Escalao
select * from Equipa
select * from Pessoa
select * from Atleta
select * from Adulto_Responsavel

--#############################STORED PROCEDURE PARA CRIAR UM ADULTO RESPONSAVEL ################################
CREATE PROC sp_createAdultoResponsavel -- qual a utilidade? só é adicionado se um atleta for adicionado
	@cartao_cidadao varchar(15),
	@nome_responsavel varchar(250),
	@genero char(1),
    @cartao_cidadao_responsavel varchar(15),
	@telemovel_responsavel varchar(11),
    @email_responsavel varchar(250),
	@parentesco varchar(15),
	@data_in varchar(25),
	@data_out varchar(25)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			EXEC sp_createPessoa @nome=@nome_responsavel, @genero=genero, @cartao_cidadao=@cartao_cidadao_responsavel, @telemovel=@telemovel_responsavel, @email=@email_responsavel;
			INSERT INTO Adulto_Responsavel([FK_Cartao_cidadao],[Grau_parentesco]) VALUES (@cartao_cidadao_responsavel, @parentesco);

			IF @cartao_cidadao <> null
				INSERT INTO Rel_Responsavel_Atleta ([FK_Cartao_cidadao_atleta], [FK_Cartao_cidadao_responsavel], [Data_in], [Data_out]) VALUES (@cartao_cidadao, @cartao_cidadao_responsavel, @data_in, @data_out)
		COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
END
GO

select * from Atleta
select * from Pessoa
--select * from Adulto_Responsavel
--select * from Escalao
select * from Funcionario
select * from Treinador
select * from Prof_Saude
select * from Rel_Escalao_Pro_Saude
select * from Escalao

--#############################STORED PROCEDURE PARA CRIAR UM FUNCIONARIO ################################
CREATE PROC sp_createFuncionario
	@nome varchar(250),
	@genero char(1),
	@cartao_cidadao varchar(15),
	@telemovel varchar(11),
	@email varchar(250),
	@num_funcionario int,
	@equipavet varchar(15),
	@salario int
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			EXEC sp_createPessoa @nome=@nome, @genero=@genero, @cartao_cidadao=@cartao_cidadao, @telemovel=@telemovel, @email=@email;
			INSERT INTO Funcionario([FK_Cartao_cidadao],[Num_funcionario],[FK_Num_registo_nacional_equipavet],[Salario]) VALUES (@cartao_cidadao, @num_funcionario, @equipavet, @salario)
		COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
END
GO
--EXEC sp_createFuncionario @nome='José Mendes', @cartao_cidadao='674472229', @telemovel='933986241', @email='jmendes@gmail.com', @num_funcionario='122137', @equipavet=null, @salario='950'

--#############################STORED PROCEDURE PARA CRIAR UM PROFISSIONAL DE SAUDE ################################
CREATE PROC sp_createProSaude
	@nome varchar(250),
	@genero char(1),
	@cartao_cidadao varchar(15),
	@telemovel varchar(11),
	@email varchar(250),
	@num_funcionario int,
	@equipavet varchar(15),
	@salario int,
	@num_cedula_profissional varchar(7),
	@cargo varchar(50),
	@nome_escalao varchar(124)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			EXEC sp_createPessoa @nome=@nome, @genero=@genero,  @cartao_cidadao=@cartao_cidadao, @telemovel=@telemovel, @email=@email;
			INSERT INTO Funcionario([FK_Cartao_cidadao],[Num_funcionario],[FK_Num_registo_nacional_equipavet],[Salario]) VALUES (@cartao_cidadao, @num_funcionario, @equipavet, @salario);
			INSERT INTO Prof_Saude([FK_Cartao_cidadao],[FK_Num_funcionario],[Num_cedula_profissional],[Cargo]) VALUES (@cartao_cidadao, @num_funcionario, @num_cedula_profissional, @cargo);

			INSERT INTO Rel_Escalao_Pro_Saude([FK_Cartao_cidadao_saude],[FK_Num_funcionario_saude],[FK_Num_cedula_profissional_saude],[FK_Nome_escalao]) VALUES (@cartao_cidadao, @num_funcionario, @num_cedula_profissional, @nome_escalao)
		COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
END
GO

--EXEC sp_createProSaude @nome='Jéssica Rodrigues', @cartao_cidadao='266735992', @telemovel='927721901', @email='jesrods@gmail.com', @num_funcionario='168213', @equipavet=null, @salario='2350', @num_cedula_profissional='JM8841', @cargo='medico', @nome_escalao='Sub-18 Basket'

--#############################STORED PROCEDURE PARA CRIAR UM TREINADOR #####################################
CREATE PROC sp_createTreinador
	@nome varchar(250),
	@genero char(1),
	@cartao_cidadao varchar(15),
	@telemovel varchar(11),
	@email varchar(250),
	@num_funcionario int,
	@equipavet varchar(15),
	@salario int,
	@nome_escalao varchar(124)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			EXEC sp_createPessoa @nome=@nome, @genero=genero,  @cartao_cidadao=@cartao_cidadao, @telemovel=@telemovel, @email=@email;
			INSERT INTO Funcionario([FK_Cartao_cidadao],[Num_funcionario],[FK_Num_registo_nacional_equipavet],[Salario]) VALUES (@cartao_cidadao, @num_funcionario, @equipavet, @salario);
			INSERT INTO Treinador ([FK_Cartao_cidadao],[FK_Num_funcionario],[FK_Nome_escalao]) VALUES (@cartao_cidadao, @num_funcionario, @nome_escalao)
		COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
END
GO

--EXEC sp_createTreinador @nome='Cândido Costa', @cartao_cidadao='300177351', @telemovel='911908472', @email='cc@gmail.com', @num_funcionario='172653', @equipavet=null, @salario='2500', @num_equipas='1', @nome_escalao='Veteranos Futebol'

--#############################STORED PROCEDURE PARA CRIAR UM CAVALO ########################################
CREATE PROC sp_createCavalo
	@cartao_cidadao varchar(15),
	-- @num_id_chip int,
	@nome_cavalo varchar(255),
	@tamanho varchar(255),
	@cor varchar(255),
	@pedigree varchar(255),
	@modalidade int=4 -- admitir que é sempre 4
AS
BEGIN
	DECLARE @num_id_chip int;
    SET @num_id_chip = (SELECT dbo.getNextNumChipCavalo());
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Cavalo ([FK_Cartao_cidadao_atleta],[Num_identificacao_chip],[Nome],[Tamanho],[Cor],[Pedigree]) VALUES (@cartao_cidadao, @num_id_chip, @nome_cavalo, @tamanho, @cor, @pedigree);
			INSERT INTO Rel_Modalidade_Cavalo ([FK_Num_identificacao_chip],[FK_Num_identificacao_modalidade]) VALUES (@num_id_chip, @modalidade)
		COMMIT TRANSACTION;
				PRINT 'Sucesso na criação';
			END TRY
			BEGIN CATCH
				-- Rollback the transaction if any error occurs
				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;

				-- Return error message or code
				PRINT 'Error:' + ERROR_MESSAGE();
			END CATCH
END
GO