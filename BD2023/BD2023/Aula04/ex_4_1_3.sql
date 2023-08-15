USE p8g9
GO

CREATE TABLE  GEmpresa_Armazem(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Armazem(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Condicoes_Pagamento(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Przao] [datetime]NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Tipo_Fornecedor(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
)
GO

CREATE TABLE  GEmpresa_Produto(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Preco] [int] NOT NULL,
	[IVA] [int] NOT NULL,
	[Arm_C�digo][varchar](16) NOT NULL REFERENCES GEmpresa_Armazem([C�digo]),
)
GO

CREATE TABLE  GEmpresa_Fornecedor(
	[C�digo][varchar](16) NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL,
	[NIF] [varchar](32) NOT NULL,
	[FAX] [varchar](32) NOT NULL,
	[TF_C�digo][varchar](16) NOT NULL REFERENCES GEmpresa_Tipo_Fornecedor([C�digo]),
	[CP_C�digo][varchar](16) NOT NULL REFERENCES GEmpresa_Condicoes_Pagamento([C�digo]),
)
GO

CREATE TABLE  GEmpresa_Encomenda(
	[N�mero][int] NOT NULL PRIMARY KEY,
	[Data][datetime] NOT NULL,
	[Quantidade][int] NOT NULL,
	[F_C�digo][varchar](16) NOT NULL REFERENCES GEmpresa_Fornecedor([C�digo]),
)
GO

CREATE TABLE  GEmpresa_Tem(
	[N�mero][int] NOT NULL REFERENCES GEmpresa_Encomenda([N�mero]),
	[C�digo][varchar](16) NOT NULL REFERENCES GEmpresa_Produto([C�digo]),
	PRIMARY KEY ([N�mero],[C�digo]),
)
GO