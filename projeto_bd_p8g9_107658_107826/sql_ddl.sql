-- DROPS

-- DROP TABLE IF EXISTS ClubeDesportivo; -- >> no
DROP TABLE IF EXISTS Modalidade; -- >> done
DROP TABLE IF EXISTS Instalacao; -- >> done
DROP TABLE IF EXISTS Material; -- >> done
DROP TABLE IF EXISTS Equipamento; -- >> done
DROP TABLE IF EXISTS Escalao; -- >> done
DROP TABLE IF EXISTS Equipa; -- >> done
DROP TABLE IF EXISTS Rel_Modalidade_Equipa; -- >> done 
DROP TABLE IF EXISTS Pessoa; -- >> done
DROP TABLE IF EXISTS Atleta; -- >> done falta
DROP TABLE IF EXISTS Adulto_Responsavel; -- >> done
DROP TABLE IF EXISTS Rel_Responsavel_Atleta; -- >> done
DROP TABLE IF EXISTS Equipa_Assis_Veterinaria; -- >> done
DROP TABLE IF EXISTS Funcionario; -- >> done
DROP TABLE IF EXISTS Prof_Saude; -- >> done
DROP TABLE IF EXISTS Rel_Escalao_Pro_Saude; -- >> done
DROP TABLE IF EXISTS Treinador; -- >> done
DROP TABLE IF EXISTS Diretor; -- >> done
DROP TABLE IF EXISTS Cavalo; -- >> done falta
DROP TABLE IF EXISTS Rel_Modalidade_Cavalo; -- >> done

--CRIAR TABELA DA MODALIDADE
CREATE TABLE Modalidade (
  [Nome] [varchar](25) NOT NULL,
  [Num_identificacao] [int] NOT NULL PRIMARY KEY identity(0,1),
  [Categoria] [varchar](25) NOT NULL,
)

--CRIAR TABELA INSTALACAO
CREATE TABLE Instalacao (
  [Nome] [varchar](124) NOT NULL,
  [Num_instalacao] [int] NOT NULL PRIMARY KEY identity(0,1),
  [Morada] [varchar](250) NOT NULL,
  [FK_Num_identificacao_modalidade] [int] REFERENCES Modalidade([Num_identificacao]),
)

--CRIAR TABLEA DO MATERIAL
CREATE TABLE Material (
  [Nome] [varchar](124) NOT NULL PRIMARY KEY,
  [FK_Num_identificacao_modalidade] [int] NOT NULL REFERENCES Modalidade([Num_identificacao]),
  [Quantidade] [int] default NULL,
)

--CRIAR TABELA DO EQUIPAMENTO
CREATE TABLE Equipamento (
  [Cor] [varchar](124) NOT NULL,
  [FK_Num_identificacao_modalidade] [int] NOT NULL REFERENCES Modalidade([Num_identificacao]),
  [Numero_id] [int] NOT NULL PRIMARY KEY identity(1,1),
  [Categoria] [varchar](125) NOT NULL,
  [Tamanho] [varchar](15) NOT NULL,
  [Material] [varchar](124) NOT NULL,
  [Quantidade] [int] default NULL,
)

--CRIAR TABELA ESCALÃO
CREATE TABLE Escalao (
  [FK_Num_identificacao_modalidade] [int] NOT NULL REFERENCES Modalidade([Num_identificacao]),
  [Nome] [varchar](124) NOT NULL PRIMARY KEY,
  [Idade] [varchar](7) NOT NULL,
)

--CRIAR TABELA DA EQUIPA
CREATE TABLE Equipa (
  [Num_identificacao] [int] NOT NULL PRIMARY KEY identity(1,1),
  [FK_Nome_escalao] [varchar](124) NOT NULL REFERENCES Escalao([Nome]),
  [Nome] [varchar](255) NOT NULL,
  [Genero] [varchar](5) NOT NULL,
  [Num_jogadores] [int],
)

--CRIAR TABELA REL_MODALIDADE_EQUIPA
CREATE TABLE Rel_Modalidade_Equipa (
  [FK_Num_identificacao_equipa] [int] REFERENCES Equipa([Num_identificacao]),
  [FK_Num_identificacao_modalidade] [int] REFERENCES Modalidade([Num_identificacao]),
  PRIMARY KEY([FK_Num_identificacao_equipa],[FK_Num_identificacao_modalidade]),
)

--CRIAR TABELA PESSOA
CREATE TABLE Pessoa (
  [Nome] [varchar](250) NOT NULL,
  [Genero] [char](1) NOT NULL,
  [Cartao_cidadao] [varchar](15) NOT NULL PRIMARY KEY,
  [Contacto_telefonico] [varchar](11),
  [email] [varchar](250),
)

--CRIAR TABELA ATLETA
CREATE TABLE Atleta (
  [FK_Cartao_cidadao] [varchar](15) NOT NULL PRIMARY KEY REFERENCES Pessoa([Cartao_cidadao]),
  [Num_inscricao] [int], -- identity(1,1),
  [Declaracao_medica] [varchar](25) NOT NULL, --data do último 
  [Ref_transacao_bancaria] [varchar](34),
  [Idade] [int] NOT NULL, --mudar nos tipos dados introduzidos
  [Fk_Nome_escalao] [varchar](124) REFERENCES Escalao([Nome]),
)

--CRIAR TABELA ADULTO_RESPONSÁVEL
CREATE TABLE Adulto_Responsavel (
  [FK_Cartao_cidadao] [varchar](15) PRIMARY KEY REFERENCES Pessoa([Cartao_cidadao]),
  [Grau_parentesco] [varchar](15) NOT NULL,
)

--CRIAR TABELA RESPONSAVEL_ATLETA
CREATE TABLE Rel_Responsavel_Atleta (
  [FK_Cartao_cidadao_atleta] [varchar](15) REFERENCES Atleta([FK_Cartao_cidadao]),
  [FK_Cartao_cidadao_responsavel] [varchar] (15) NOT NULL REFERENCES Adulto_Responsavel([FK_Cartao_cidadao]),
  [Data_in] [varchar](25),
  [Data_out] [varchar](25),
  PRIMARY KEY ([FK_Cartao_cidadao_atleta],[FK_Cartao_cidadao_responsavel]),
)

--CRIAR TABELA EQUIPA_VETERINARIA
CREATE TABLE Equipa_Assis_Veterinaria (
  [FK_Num_identificacao_modalidade] [int] REFERENCES Modalidade([Num_identificacao]),
  [Morada] [varchar](250) NOT NULL,
  [Num_registo_nacional] [varchar](15) NOT NULL PRIMARY KEY,
  [Nome_clinica] [varchar](124) NOT NULL,
)

--CRIAR TABELA FUNCIONÁRIO
CREATE TABLE Funcionario (
  [FK_Cartao_cidadao] [varchar](15) NOT NULL REFERENCES Pessoa([Cartao_cidadao]),
  [Num_funcionario] [int] NOT NULL,
  [FK_Num_registo_nacional_equipavet] [varchar](15) default NUll REFERENCES Equipa_Assis_Veterinaria([Num_registo_nacional]),
  [Salario] [int] NOT NULL,
  PRIMARY KEY([FK_Cartao_cidadao],[Num_funcionario])
)

--CRIAR TABELA PROFISSIONAL DE SAUDE 
CREATE TABLE Prof_Saude (
  [FK_Cartao_cidadao] [varchar](15) NOT NULL,
  [FK_Num_funcionario] [int] NOT NULL,-- não sei porque fica assim
  [Num_cedula_profissional] [varchar](7),
  [Cargo] [varchar](50) NOT NULL,
  PRIMARY KEY ( [FK_Cartao_cidadao],[FK_Num_funcionario],[Num_cedula_profissional]),
  FOREIGN KEY ( [FK_Cartao_cidadao],[FK_Num_funcionario]) REFERENCES Funcionario([FK_Cartao_cidadao],[Num_funcionario]),
)

--CRIAR TABELA REL_ESCALAO_PRO_SAUDE
CREATE TABLE  Rel_Escalao_Pro_Saude (
  [FK_Cartao_cidadao_saude] [varchar](15) NOT NULL,
  [FK_Num_funcionario_saude] [int] NOT NULL,
  [FK_Num_cedula_profissional_saude] [varchar](7) NOT NULL,
  [FK_Nome_escalao] [varchar](124) NOT NULL REFERENCES Escalao([Nome]),
  PRIMARY KEY([FK_Cartao_cidadao_saude],[FK_Num_funcionario_saude],[FK_Num_cedula_profissional_saude],[FK_Nome_escalao]),
  FOREIGN KEY([FK_Cartao_cidadao_saude],[FK_Num_funcionario_saude],[FK_Num_cedula_profissional_saude]) REFERENCES Prof_Saude([Fk_Cartao_cidadao],[FK_Num_funcionario],[Num_cedula_profissional]),
)

--CRIAR TABELA TREINADOR
CREATE TABLE Treinador (
  [FK_Cartao_cidadao] [varchar](15) NOT NULL,
  [FK_Num_funcionario] [int] NOT NULL,
  [FK_Nome_escalao] [varchar](124) NOT NULL REFERENCES Escalao([Nome]),
  PRIMARY KEY([FK_Cartao_cidadao],[FK_Num_funcionario]),
  FOREIGN KEY ([FK_Cartao_cidadao],[FK_Num_funcionario]) REFERENCES Funcionario([FK_Cartao_cidadao],[Num_funcionario]),
)

--CRIAR TABELA DIRETOR
CREATE TABLE Diretor (
  [FK_Cartao_cidadao] [varchar](15) NOT NULL,
  [FK_Num_funcionario] [int] NOT NULL,
  [Gabinete] [int] default NULL,
  PRIMARY KEY([FK_Cartao_cidadao],[FK_Num_funcionario]),
  FOREIGN KEY ([FK_Cartao_cidadao],[FK_Num_funcionario]) REFERENCES Funcionario([FK_Cartao_cidadao],[Num_funcionario]),
)

--CRIAR TABELA CAVALO
CREATE TABLE Cavalo (
  [FK_Cartao_cidadao_atleta] [varchar](15) REFERENCES Atleta([FK_Cartao_cidadao]),
  [Num_identificacao_chip] [int] NOT NULL PRIMARY KEY,
  [Nome] [varchar](255) NOT NULL,
  [Tamanho] [varchar](255) NOT NULL,
  [Cor] [varchar](255) NOT NULL,
  [Pedigree] [varchar](255) NOT NULL,
)

--CRIAR TABELA  REL-MODALIDADE_CAVALO
CREATE TABLE Rel_Modalidade_Cavalo (
  [FK_Num_identificacao_chip] [int] REFERENCES Cavalo([Num_identificacao_chip]),
  [FK_Num_identificacao_modalidade] [int] REFERENCES Modalidade([Num_identificacao]),
  PRIMARY KEY ([FK_Num_identificacao_chip],[FK_Num_identificacao_modalidade])
)

---------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Escalao_Basket(
	[id] [int] PRIMARY KEY identity(0,1),
	[nome] [varchar](25),
)

CREATE TABLE Escalao_Futebol(
	[id] [int] PRIMARY KEY identity(0,1),
	[nome] [varchar](25),
)

CREATE TABLE Escalao_Rugby(
	[id] [int] PRIMARY KEY identity(0,1),
	[nome] [varchar](25),
)

CREATE TABLE Escalao_Tenis(
	[id] [int] PRIMARY KEY identity(0,1),
	[nome] [varchar](25),
)

CREATE TABLE Escalao_Hipismo(
	[id] [int] PRIMARY KEY identity(0,1),
	[nome] [varchar](25),
)
