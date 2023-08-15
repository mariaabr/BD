USE p8g9
GO

CREATE TABLE  GEmpresa_Armazem(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Armazem(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Condicoes_Pagamento(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Przao] [datetime]NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Tipo_Fornecedor(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Produto(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Preco] [int] NOT NULL,
	[IVA] [int] NOT NULL,
	[Arm_Código][varchar](16) NOT NULL REFERENCES GEmpresa_Armazem([Código]),
)
GO

CREATE TABLE  GEmpresa_Fornecedor(
	[Código][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
	[NIF] [varchar](32) NOT NULL,
	[FAX] [varchar](32) NOT NULL,
	[TF_Código][varchar](16) NOT NULL REFERENCES GEmpresa_Tipo_Fornecedor([Código]),
	[CP_Código][varchar](16) NOT NULL REFERENCES GEmpresa_Condicoes_Pagamento([Código]),
)
GO

CREATE TABLE  GEmpresa_Encomenda(
	[Número][int] NOT NULL PRIMARY KEY,
	[Data][datetime] NOT NULL,
	[Quantidade][int] NOT NULL,
	[F_Código][varchar](16) NOT NULL REFERENCES GEmpresa_Fornecedor([Código]),
)
GO

CREATE TABLE  GEmpresa_Tem(
	[Número][int] NOT NULL REFERENCES GEmpresa_Encomenda([Número]),
	[Código][varchar](16) NOT NULL REFERENCES GEmpresa_Produto([Código]),
	PRIMARY KEY ([Número],[Código]),
)
GO