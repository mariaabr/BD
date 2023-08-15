USE p8g9
GO

CREATE TABLE  Consulta_Farmacia(
	[NIF][varchar](32) NOT NULL PRIMARY KEY,
	[Nome][varchar](256) NOT NULL,
	[Endereço][varchar](256) NOT NULL,
	[Telefone][varchar](16) NOT NULL,
)
GO

CREATE TABLE  Consulta_Farmaco(
	[Fórmula][varchar](256) NOT NULL PRIMARY KEY,
	[Nome_Comercial][varchar](64) NOT NULL,
)
GO

CREATE TABLE  Consulta_Paciente(
	[Número_Utente][varchar](32) NOT NULL PRIMARY KEY,
	[Nome][varchar](256) NOT NULL,
	[Morada][varchar](256) NOT NULL,
	[Data_Nascimento][datetime] NOT NULL,
)
GO

CREATE TABLE  Consulta_Medico(
	[Número_SNS][varchar](32) NOT NULL PRIMARY KEY,
	[Nome][varchar](256) NOT NULL,
	[Especialidade][varchar](128) NOT NULL,
)
GO

CREATE TABLE  Consulta_Prescricao(
	[Número_Prescricao][varchar](64) NOT NULL PRIMARY KEY,
	[Data][datetime] NOT NULL,
	[No_SNS][varchar](32) NOT NULL REFERENCES Consulta_Medico([Número_SNS]),
	[No_Utente][varchar](32) NOT NULL REFERENCES Consulta_Paciente([Número_Utente]),
	[NIF][varchar](32) NOT NULL REFERENCES Consulta_Farmacia([NIF]),
	[Data_Processamento][datetime] NOT NULL,
)
GO

CREATE TABLE  Consulta_Tem(
	[No_Prescricao][varchar](64) NOT NULL REFERENCES Consulta_Prescricao([Número_Prescricao]),
	[Fórmula][varchar](256) NOT NULL REFERENCES Consulta_Farmaco([Fórmula]),
	PRIMARY KEY ([No_Prescricao],[Fórmula])
)
GO

CREATE TABLE  Consulta_Companhia_Farmaceutica(
	[No_Registo_Nacional][varchar](64) NOT NULL PRIMARY KEY,
	[Telefone][varchar](16) NOT NULL,
	[Nome][varchar](256) NOT NULL,
	[Endereço][varchar](256) NOT NULL,
	[Nome_Farmaco][varchar](64) NOT NULL,
	[Fórmula][varchar](256) NOT NULL REFERENCES Consulta_Farmaco([Fórmula]),
)
GO

CREATE TABLE  Consulta_Vende(
	[NIF][varchar](32) NOT NULL REFERENCES Consulta_Farmacia([NIF]),
	[Fórmula][varchar](256) NOT NULL REFERENCES Consulta_Farmaco([Fórmula]),
	PRIMARY KEY ([NIF],[Fórmula])
)
GO