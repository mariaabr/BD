USE p8g9
GO

CREATE TABLE SGATL_Turma (
	[Designacao] [varchar](256) NOT NULL,
	[Identificador] [varchar](8) NOT NULL PRIMARY KEY,
	[Ano_letivo] [varchar](16) NOT NULL,
)
GO

CREATE TABLE SGATL_Atividades (
	[Designacao] [varchar](256) NOT NULL,
	[Identificador] [varchar](8) NOT NULL PRIMARY KEY,
	[Custo] [varchar](16) NOT NULL,
)
GO

CREATE TABLE SGATL_AtividadePorTurma (
	[Turma_Identificador] [varchar](8) NOT NULL REFERENCES SGATL_Turma ([Identificador]),
	[Atividade_Identificador] [varchar](8) NOT NULL REFERENCES SGATL_Atividades ([Identificador]),
	PRIMARY KEY ([Turma_Identificador], [Atividade_Identificador]),
)
GO

CREATE TABLE SGATL_Pessoa (
	[Nome] [varchar](256) NOT NULL,
	[Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY,
	[Morada] [varchar](1024) NOT NULL,
	[Data_nascimento] [varchar](16) NOT NULL,
)
GO

CREATE TABLE SGATL_Aluno (
	[Pessoa_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_Pessoa ([Cartao_cidadao]),
	[Turma_Identificador] [varchar](8) NOT NULL REFERENCES SGATL_Turma ([Identificador]),
	[Atividade_Identificador] [varchar](8) NOT NULL REFERENCES SGATL_Atividades ([Identificador]),
)
GO

CREATE TABLE SGATL_AdultoResponsavelAluno (
	[Pessoa_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_Pessoa ([Cartao_cidadao]),
	[Contacto_telefonico] [varchar](9) NOT NULL,
	[Mail] [varchar] (256) NOT NULL,
)
GO

CREATE TABLE SGATL_ResponsavelPor (
	[Aluno_Cartao_cidadao] [varchar](32) NOT NULL REFERENCES SGATL_Aluno ([Pessoa_Cartao_cidadao]),
	[Responsavel_Cartao_cidadao] [varchar](32) NOT NULL REFERENCES SGATL_AdultoResponsavelAluno ([Pessoa_Cartao_cidadao]),
	PRIMARY KEY ([Aluno_Cartao_cidadao], [Responsavel_Cartao_cidadao]),
)
GO

CREATE TABLE SGATL_Professor (
	[Professor_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_AdultoResponsavelAluno ([Pessoa_Cartao_cidadao]),
	[Num_funcionario] [varchar](16) NOT NULL,
)
GO

CREATE TABLE SGATL_ProfessorPorTurma (
	[Turma_Identificador] [varchar](8) NOT NULL REFERENCES SGATL_Turma ([Identificador]),
	[ProfessorTurma_Cartao_cidadao] [varchar](32) NOT NULL REFERENCES SGATL_Professor ([Professor_Cartao_cidadao]),
	PRIMARY KEY ([Turma_Identificador], [ProfessorTurma_Cartao_cidadao]),
)
GO

CREATE TABLE SGATL_AdultoResponsavelLista (
	[AdultoResponsavelLista_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_AdultoResponsavelAluno ([Pessoa_Cartao_cidadao]),
	[Parentesco] [varchar](16) NOT NULL,
)
GO

CREATE TABLE SGATL_EncarregadoEducacao (
	[EncarregadoEducacao_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_AdultoResponsavelLista ([AdultoResponsavelLista_Cartao_cidadao]),
)
GO

CREATE TABLE SGATL_AutorizadasLista (
	[AutorizadasLista_Cartao_cidadao] [varchar](32) NOT NULL PRIMARY KEY REFERENCES SGATL_AdultoResponsavelLista ([AdultoResponsavelLista_Cartao_cidadao]),
)
GO