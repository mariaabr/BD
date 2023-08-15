USE p8g9
GO

CREATE TABLE RentACar_Client (
	[Nome] [varchar](256) NOT NULL,
	[Endereco] [varchar](1024) NOT NULL,
	[Num] [int] NOT NULL,
	[NIF] [int] NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE RentACar_Balcao (
	[Nome] [varchar](256) NOT NULL,
	[Endereco] [varchar](1024) NOT NULL,
	[Num] [int] NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE RentACar_TipoVeiculo (
	[Codigo] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Designacao] [varchar](256) NOT NULL,
	[Arcondicionado] [varchar](256) NOT NULL,
)
GO

CREATE TABLE RentACar_Veiculo (
	[Matricula] [varchar](16) NOT NULL PRIMARY KEY,
	[Ano] [int] NOT NULL,
	[Marca] [varchar](256) NOT NULL,
	[TipoVeiculo_Codigo] [int] NOT NULL REFERENCES RentACar_TipoVeiculo ([Codigo]),
)
GO

CREATE TABLE RentACar_Similaridade (
	[Codigo1] [int] NOT NULL REFERENCES RentACar_TipoVeiculo ([Codigo]),
	[Codigo2] [int] NOT NULL REFERENCES RentACar_TipoVeiculo ([Codigo]),
	PRIMARY KEY ([Codigo1], [Codigo2]),
)
GO

CREATE TABLE RentACar_Ligeiro (
	[Num_lugares] [int] NOT NULL,
	[Portas] [int] NOT NULL,
	[Combustivel] [varchar](256) NOT NULL,
	[TipoVeiculo_Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_TipoVeiculo ([Codigo]),
)
GO

CREATE TABLE RentACar_Pesado (
	[Peso] [int] NOT NULL,
	[Passageiros] [int] NOT NULL,
	[TipoVeiculo_Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_TipoVeiculo ([Codigo]),
)
GO

CREATE TABLE RentACar_Aluguer (
	[Data] [varchar](32) NOT NULL,
	[Num_aluguer] [int] NOT NULL PRIMARY KEY,
	[Duracao] [int] NOT NULL,
	[Client_NIF] [int] NOT NULL REFERENCES RentACar_Client ([NIF]),
	[Balcao_Num] [int] NOT NULL REFERENCES RentACar_Balcao ([Num]),
	[Veiculo_Matricula] [varchar](16) NOT NULL REFERENCES RentACar_Veiculo ([Matricula]),
)
GO