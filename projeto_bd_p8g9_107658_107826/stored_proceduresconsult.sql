GO
DROP PROC AtletasList
CREATE PROC AtletasList AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email, Atleta.Fk_Nome_escalao AS Escalao, Modalidade.Nome AS Modalidade
FROM Pessoa JOIN Atleta ON Cartao_cidadao=FK_Cartao_cidadao JOIN Escalao ON Fk_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
GO

EXEC AtletasList

GO
DROP PROC EscalaoList
CREATE PROC EscalaoList AS
SELECT Escalao.Idade, Escalao.Nome AS Escalao, Modalidade.Nome AS Modalidade
FROM Escalao JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
ORDER BY Modalidade
GO

EXEC EscalaoList

--############################################################## CONSULTAR ####################################################################################--
--CONSULTAR INSTALACAO
--DROP PROC sp_consult_instalacao
GO
CREATE PROC sp_consult_instalacao AS
SELECT Instalacao.Nome, Instalacao.Morada, Modalidade.Nome AS Modalidade
FROM Instalacao JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
ORDER BY Modalidade
GO

--EXEC sp_consult_instalacao

--CONSULTAR MODALIDADE
--DROP PROC sp_consult_modalidade
GO
CREATE PROC sp_consult_modalidade AS
SELECT Modalidade.Nome AS Modalidade, Modalidade.Categoria
FROM Modalidade
GO

--EXEC sp_consult_modalidade

--CONSULTAR MATERIAL
--DROP PROC sp_consult_material
GO
CREATE PROC sp_consult_material AS
SELECT Material.Nome AS Nome, Material.Quantidade, Modalidade.Nome AS Modalidade
FROM Material JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
ORDER BY Modalidade
GO

--EXEC sp_consult_material

--CONSULTAR EQUIPAMENTO
--DROP PROC sp_consult_equipamento
GO
CREATE PROC sp_consult_equipamento AS
SELECT Equipamento.Numero_id, Equipamento.Categoria, Equipamento.Cor, Equipamento.Material, Equipamento.Tamanho, Equipamento.Quantidade, Modalidade.Nome AS Modalidade
FROM Equipamento JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
ORDER BY Modalidade
GO

--EXEC sp_consult_equipamento

--CONSULTAR EQUIPA
--DROP PROC sp_consult_equipa
GO
CREATE PROC sp_consult_equipa AS
SELECT Equipa.Num_identificacao, Equipa.Nome AS Equipa, Equipa.FK_Nome_escalao AS Escalao, Equipa.Genero, Equipa.Num_jogadores AS Jogadores, Modalidade.Nome AS Modalidade
FROM Equipa JOIN Escalao ON FK_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
ORDER BY Modalidade
GO

--EXEC sp_consult_equipa

--CONSULTAR ADULTO RESPONSAVEL
--DROP PROC sp_consult_adulto_responsavel
GO
CREATE PROC sp_consult_adulto_responsavel AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, TabelaAtleta.Atleta AS Dependente, Adulto_Responsavel.Grau_parentesco, Rel_Responsavel_Atleta.Data_in, Rel_Responsavel_Atleta.Data_out
FROM Pessoa JOIN Adulto_Responsavel ON Cartao_cidadao=FK_Cartao_cidadao JOIN Rel_Responsavel_Atleta ON Adulto_Responsavel.FK_Cartao_cidadao=Rel_Responsavel_Atleta.FK_Cartao_cidadao_responsavel JOIN
	(SELECT Pessoa.Nome AS Atleta, Atleta.FK_Cartao_cidadao FROM Rel_Responsavel_Atleta JOIN Atleta ON FK_Cartao_cidadao_atleta=Atleta.FK_Cartao_cidadao JOIN Pessoa ON FK_Cartao_cidadao=Cartao_cidadao)
	AS TabelaAtleta ON Rel_Responsavel_Atleta.FK_Cartao_cidadao_atleta=TabelaAtleta.FK_Cartao_cidadao
	--ORDER BY ASC
GO

--EXEC sp_consult_adulto_responsavel

--CONSULTAR FUNCIONARIO
--DROP PROC sp_consult_funcionario
GO
CREATE PROC sp_consult_funcionario AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Funcionario.Salario
FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao
GO

--EXEC sp_consult_funcionario

--CONSULTAR PROFISSIONAL DE SAUDE
--DROP PROC sp_consult_pro_saude
GO
CREATE PROC sp_consult_pro_saude AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Prof_Saude.Num_cedula_profissional AS Cedula_profissional, Prof_Saude.Cargo AS Especialidade, Funcionario.Salario
FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Prof_Saude ON Num_funcionario=FK_Num_funcionario
GO

--EXEC sp_consult_pro_saude

--CONSULTAR TREINADOR
--DROP PROC sp_consult_treinador
GO
CREATE PROC sp_consult_treinador AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Treinador.FK_Nome_escalao AS Escalao
FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Treinador ON Num_funcionario=FK_Num_funcionario
GO

--EXEC sp_consult_treinador

--CONSULTAR DIRETOR
--DROP PROC sp_consult_diretor
GO
CREATE PROC sp_consult_diretor AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Diretor.Gabinete
FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Diretor ON Num_funcionario=FK_Num_funcionario
GO

--EXEC sp_consult_diretor

--CONSULTAR PROFISSIONAL VETERINARIO
--DROP PROC sp_consult_pro_veterinario
GO
CREATE PROC sp_consult_pro_veterinario AS
SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Equipa_Assis_Veterinaria.Nome_clinica, Funcionario.FK_Num_registo_nacional_equipavet AS Registo_nacional_clinica, Equipa_Assis_Veterinaria.Morada AS Morada, Funcionario.Salario, Modalidade.Nome AS Modalidade
FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Equipa_Assis_Veterinaria ON FK_Num_registo_nacional_equipavet=Num_registo_nacional JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
GO

--EXEC sp_consult_pro_veterinario

--CONSULTAR EQUIPA ASSISTENCIA VETERINARIA
--DROP PROC sp_consult_equipa_assis_veterinaria
GO
CREATE PROC sp_consult_equipa_assis_veterinaria AS
SELECT Equipa_Assis_Veterinaria.Nome_clinica AS Clinica, Equipa_Assis_Veterinaria.Num_registo_nacional AS Registo_nacional, Equipa_Assis_Veterinaria.Morada, Modalidade.Nome AS Modalidade
FROM Equipa_Assis_Veterinaria JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
GO

--EXEC sp_consult_equipa_assis_veterinaria

--CONSULTAR CAVALO
--DROP PROC sp_consult_cavalo
GO
CREATE PROC sp_consult_cavalo AS
SELECT Cavalo.Nome, Cavalo.Num_identificacao_chip, Cavalo.Tamanho, Cavalo.Cor, Cavalo.Pedigree, Pessoa.Nome AS Nome_atleta, Atleta.Fk_Nome_escalao AS Escalao, Modalidade.Nome AS Modalidade
FROM Cavalo LEFT OUTER JOIN Atleta ON FK_Cartao_cidadao_atleta=FK_Cartao_cidadao LEFT JOIN Pessoa ON FK_Cartao_cidadao=Cartao_cidadao LEFT JOIN Escalao ON Fk_Nome_escalao=Escalao.Nome LEFT JOIN Modalidade ON Num_identificacao=FK_Num_identificacao_modalidade
GO

--EXEC sp_consult_cavalo

--############################################################## CONSULTAR COM RESTRIÇÕES ####################################################################--
--CONSULTAR INSTALACAO BY MODALIDADE
--DROP PROC sp_consult_instalacao_by_modalidade
GO
CREATE PROC sp_consult_instalacao_by_modalidade
@modalidade varchar(25) AS
	SELECT Instalacao.Nome, Instalacao.Morada, Modalidade.Nome AS Modalidade
	FROM Instalacao JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Modalidade.Nome=@modalidade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_instalacao_by_modalidade @modalidade='...'

--CONSULTAR MODALIDADE BY CATEGORIA
GO
CREATE PROC sp_consult_modalidade_by_categoria
@categoria varchar(25) AS
	SELECT Modalidade.Nome AS Modalidade, Modalidade.Categoria
	FROM Modalidade
	WHERE Modalidade.Categoria=@categoria
GO

--DECLARE @categoria varchar(25)
--EXEC sp_consult_modalidade_by_categoria @categoria='...'

--CONSULTAR MATERIAL BY MODALIDADE
GO
CREATE PROC sp_consult_material_by_modalidade
@modalidade varchar(25) AS
	SELECT Material.Nome AS Material, Material.Quantidade, Modalidade.Nome AS Modalidade
	FROM Material JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
	WHERE Modalidade.Nome=@modalidade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_material_by_modalidade @modalidade='...'

--CONSULTAR EQUIPAMENTO BY MODALIDADE
GO
CREATE PROC sp_consult_equipamento_by_modalidade
@modalidade varchar(25) AS
SELECT Equipamento.Categoria, Equipamento.Cor, Equipamento.Material, Equipamento.Tamanho, Equipamento.Quantidade, Modalidade.Nome AS Modalidade
FROM Equipamento JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
WHERE Modalidade.Nome=@modalidade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_equipamento_by_modalidade @modalidade='...'

----CONSULTAR EQUIPA BY MODALIDADE
GO
CREATE PROC sp_consult_equipa_by_modalidade
@modalidade varchar(25) AS
	SELECT Equipa.Nome AS Equipa, Equipa.FK_Nome_escalao AS Escalao, Equipa.Genero, Equipa.Num_jogadores AS Jogadores, Modalidade.Nome AS Modalidade
	FROM Equipa JOIN Escalao ON FK_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Modalidade.Nome=@modalidade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_equipa_by_modalidade @modalidade='...'

--CONSULTAR EQUIPA BY MODALIDADE AND ESCALAO
GO
CREATE PROC sp_consult_equipa_by_modalidade_and_escalao
@modalidade varchar(25), @escalao varchar(124) AS
	SELECT Equipa.Nome AS Equipa, Equipa.FK_Nome_escalao AS Escalao, Equipa.Genero, Equipa.Num_jogadores AS Jogadores, Modalidade.Nome AS Modalidade
	FROM Equipa JOIN Escalao ON FK_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Modalidade.Nome=@modalidade AND Escalao.Nome=@escalao
GO

--DECLARE @modalidade varchar(25), @escalao varchar(124)
--EXEC sp_consult_equipa_by_modalidade_and_escalao @modalidade='...', @escalao='...'

--CONSULTAR EQUIPA BY GENERO
GO
CREATE PROC sp_consult_equipa_by_genero
@genero varchar(9) AS
	SELECT Equipa.Nome AS Equipa, Equipa.FK_Nome_escalao AS Escalao, Equipa.Genero, Equipa.Num_jogadores AS Jogadores, Modalidade.Nome AS Modalidade
	FROM Equipa JOIN Escalao ON FK_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Equipa.Genero=@genero
GO

--DECLARE @genero varchar(9)
--EXEC sp_consult_equipa_by_genero @genero='...'

--CONSULTAR ATLETA BY MODALIDADE
GO
CREATE PROC sp_consult_atleta_by_modalidade
@modalidade varchar(25) AS
	SELECT Pessoa.Nome, Pessoa.Contacto_telefonico, Atleta.Fk_Nome_escalao AS Escalao, Modalidade.Nome AS Modalidade
	FROM Pessoa JOIN Atleta ON Cartao_cidadao=FK_Cartao_cidadao JOIN Escalao ON Fk_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Modalidade.Nome=@modalidade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_atleta_by_modalidade @modalidade='...'

--CONSULTAR ESCALAO BY MODALIDADE
GO
CREATE PROC sp_consult_escalao_by_modalidade
@modalidade varchar(25) AS
	SELECT Escalao.Idade, Escalao.Nome AS Escalao, Modalidade.Nome AS Modalidade
	FROM Escalao JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Modalidade.Nome=@modalidade
	ORDER BY Escalao.Idade
GO

--DECLARE @modalidade varchar(25)
--EXEC sp_consult_escalao_by_modalidade @modalidade='...'

-- CONSULTAR ADULTO RESPONSAVEL BY NOME ATLETA
GO
CREATE PROC sp_consult_adulto_responsavel_by_atleta
@dependente varchar(250) AS
	SELECT Pessoa.Nome, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Adulto_Responsavel.Grau_parentesco, Rel_Responsavel_Atleta.Data_in, Rel_Responsavel_Atleta.Data_out,  TabelaAtleta.Atleta AS Dependente
	FROM Pessoa JOIN Adulto_Responsavel ON Cartao_cidadao=FK_Cartao_cidadao JOIN Rel_Responsavel_Atleta ON Adulto_Responsavel.FK_Cartao_cidadao=Rel_Responsavel_Atleta.FK_Cartao_cidadao_responsavel JOIN
		(SELECT Pessoa.Nome AS Atleta, Atleta.FK_Cartao_cidadao FROM Rel_Responsavel_Atleta JOIN Atleta ON FK_Cartao_cidadao_atleta=Atleta.FK_Cartao_cidadao JOIN Pessoa ON FK_Cartao_cidadao=Cartao_cidadao)
		AS TabelaAtleta ON Rel_Responsavel_Atleta.FK_Cartao_cidadao_atleta=TabelaAtleta.FK_Cartao_cidadao
	WHERE TabelaAtleta.Atleta=@dependente
GO

--DECLARE @dependente varchar(250)
--EXEC sp_consult_adulto_responsavel_by_atleta @dependente='...'

--CONSULTAR FUNCIONARIO BY SALARIO
GO
CREATE PROC sp_consult_funcionario_by_salario
@salariomin int, @salariomax int AS
	SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Funcionario.Salario
	FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao
	WHERE Funcionario.Salario > @salariomin AND Funcionario.Salario < @salariomax
GO

--DECLARE @salariomin int, @salariomax int
--EXEC sp_consult_funcionario_by_salario @salariomin='...', @salariomax='...'

--CONSULTAR PROFISSIONAL DE SAUDE BY ESPECIALIDADE
GO
CREATE PROC sp_consult_pro_saude_by_especialidade
@especialidade varchar(50) AS
	SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Prof_Saude.Num_cedula_profissional AS Cedula_profissional, Prof_Saude.Cargo AS Especialidade
	FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Prof_Saude ON Num_funcionario=FK_Num_funcionario
	WHERE Prof_Saude.Cargo=@especialidade
GO

--DECLARE @especialidade varchar(50)
--EXEC sp_consult_pro_saude_by_especialidade @especialidade='...'

--CONSULTAR TREINADOR BY ESCALAO
GO
CREATE PROC sp_consult_treinador_by_escalao
@escalao varchar(124) AS
	SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Treinador.FK_Nome_escalao AS Escalao, Modalidade.Nome AS Modalidade
	FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Treinador ON Num_funcionario=FK_Num_funcionario JOIN Escalao ON FK_Nome_escalao=Escalao.Nome JOIN Modalidade ON FK_Num_identificacao_modalidade=Modalidade.Num_identificacao
	WHERE Treinador.FK_Nome_escalao=@escalao
GO

--DECLARE @escalao varchar(124)
--EXEC sp_consult_treinador_by_escalao @escalao='...'

--CONSULTAR DIRETOR BY GABINETE
GO
CREATE PROC sp_consult_diretor_by_gabinete
@gabinete int AS
	SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Diretor.Gabinete
	FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Diretor ON Num_funcionario=FK_Num_funcionario
	WHERE Diretor.Gabinete=@gabinete
GO

--DECLARE @gabinete int
--EXEC sp_consult_diretor_by_gabinete @gabinete='...'

--CONSULTAR PROFISSIONAL VETERINARIO BY NOME CLINICA
GO
CREATE PROC sp_consult_pro_veterinario_by_clinica
@clinica varchar(124) AS
	SELECT Pessoa.Nome, Pessoa.Cartao_cidadao, Pessoa.Contacto_telefonico, Pessoa.email AS Endereço_mail, Funcionario.Num_funcionario, Equipa_Assis_Veterinaria.Nome_clinica, Funcionario.FK_Num_registo_nacional_equipavet AS Registo_nacional_clinica, Equipa_Assis_Veterinaria.Morada AS Morada, Funcionario.Salario
	FROM Pessoa JOIN Funcionario ON Cartao_cidadao=FK_Cartao_cidadao JOIN Equipa_Assis_Veterinaria ON FK_Num_registo_nacional_equipavet=Num_registo_nacional JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
	WHERE Equipa_Assis_Veterinaria.Nome_clinica=@clinica
GO

--DECLARE @clinica varchar(124)
--EXEC sp_consult_pro_veterinario_by_clinica @clinica='...'

--CONSULTAR EQUIPA ASSISTENCIA VETERINARIA
--GO
CREATE PROC sp_consult_equipa_assis_veterinaria_by_clinica
@clinica varchar(124) AS
	SELECT Equipa_Assis_Veterinaria.Nome_clinica AS Clinica, Equipa_Assis_Veterinaria.Num_registo_nacional AS Registo_nacional, Equipa_Assis_Veterinaria.Morada
	FROM Equipa_Assis_Veterinaria JOIN Modalidade ON FK_Num_identificacao_modalidade=Num_identificacao
	WHERE Equipa_Assis_Veterinaria.Nome_clinica=@clinica
GO

--DECLARE @clinica varchar(124)
--EXEC sp_consult_equipa_assis_veterinaria_by_clinica @clinica='...'

--CONSULTAR CAVALO BY PEDIGREE
GO
CREATE PROC sp_consult_cavalo_by_pedigree
@pedigree varchar(255) AS
	SELECT Cavalo.Nome, Cavalo.Num_identificacao_chip, Cavalo.Tamanho, Cavalo.Cor, Cavalo.Pedigree
	FROM Cavalo LEFT OUTER JOIN Atleta ON FK_Cartao_cidadao_atleta=FK_Cartao_cidadao LEFT JOIN Pessoa ON FK_Cartao_cidadao=Cartao_cidadao LEFT JOIN Escalao ON Fk_Nome_escalao=Escalao.Nome LEFT JOIN Modalidade ON Num_identificacao=FK_Num_identificacao_modalidade
	WHERE Cavalo.Pedigree=@pedigree
--GO

--DECLARE @pedigree varchar(255)
--EXEC sp_consult_cavalo_by_pedigree @pedigree='...'