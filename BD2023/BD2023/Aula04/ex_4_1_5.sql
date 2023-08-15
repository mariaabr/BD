USE p8g9
GO

CREATE TABLE SGC_Conferencia (
	[Nome] [varchar](256) NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE  SGC_ArtigoCientifico (
	[Titulo] [varchar](1024) NOT NULL,
	[Num_registo] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Conferencia_Nome] [varchar](256) NOT NULL REFERENCES SGC_Conferencia ([Nome]),
)
GO

CREATE TABLE  SGC_Inscricao (
	[Data] [varchar](32) NOT NULL PRIMARY KEY,
	[Custo] [varchar](16) NOT NULL,
)
GO

CREATE TABLE  SGC_Instituicao (
	[Endereco] [varchar](1024) NOT NULL,
	[Nome] [varchar](256) NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE  SGC_Comprovativo (
	[Localizacao_eletronica] [varchar](1024) NOT NULL PRIMARY KEY,
	[Estudante_Mail] [varchar](256) NOT NULL REFERENCES SGC_Estudante ([Participante_Mail]),
)
GO

CREATE TABLE  SGC_EmissaoComprovativo (
	[Instituicao_Nome] [varchar](256) NOT NULL REFERENCES SGC_Instituicao ([Nome]),
	[Localizacao_eletronica_Comprovativo] [varchar](1024) NOT NULL REFERENCES SGC_Comprovativo ([Localizacao_eletronica]),
	PRIMARY KEY ([Instituicao_Nome], [Localizacao_eletronica_Comprovativo]),
)
GO

CREATE TABLE  SGC_Pessoa (
	[Nome] [varchar](256) NOT NULL,
	[Mail] [varchar](256) NOT NULL PRIMARY KEY,
	[Instituicao_Nome] [varchar](256) NOT NULL REFERENCES SGC_Instituicao ([Nome]),
)
GO

CREATE TABLE  SGC_Autor (
	[Pessoa_Mail] [varchar](256) NOT NULL PRIMARY KEY REFERENCES SGC_Pessoa ([Mail]),
)
GO

CREATE TABLE  SGC_EscritoPor (
	[Artigo_NumRegisto] [int] NOT NULL REFERENCES SGC_ArtigoCientifico ([Num_registo]),
	[Autor_Mail] [varchar](256) NOT NULL REFERENCES SGC_Autor ([Pessoa_Mail]),
	PRIMARY KEY ([Artigo_NumRegisto], [Autor_Mail]),
)
GO

CREATE TABLE  SGC_Participante (
	[Morada] [varchar](1024) NOT NULL,
	[Pessoa_Mail] [varchar](256) NOT NULL PRIMARY KEY REFERENCES SGC_Pessoa ([Mail]),
)
GO

CREATE TABLE  SGC_Estudante (
	[Participante_Mail] [varchar](256) NOT NULL PRIMARY KEY REFERENCES SGC_Participante ([Pessoa_Mail]),
)
GO

CREATE TABLE  SGC_NaoEstudante (
	[Participante_Mail] [varchar](256) NOT NULL PRIMARY KEY REFERENCES SGC_Participante ([Pessoa_Mail]),
	[Referencia_bancaria] [varchar](256) NOT NULL,
)
GO