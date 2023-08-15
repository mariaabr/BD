CREATE VIEW Modalidade_Instalacao_VIEW AS
SELECT Modalidade.Nome AS Modalidade, Num_instalacao, Instalacao.Nome AS Instalacao, Morada
FROM Modalidade JOIN Instalacao ON Num_identificacao=FK_Num_identificacao_modalidade

SELECT * FROM Modalidade_Instalacao_VIEW

CREATE VIEW Modalidade_Material_VIEW AS
SELECT Material.Nome AS Material, Quantidade, Modalidade.Nome AS Modalidade
FROM Modalidade JOIN Material ON Num_identificacao=FK_Num_identificacao_modalidade

SELECT * FROM Modalidade_Material_VIEW

CREATE VIEW Modalidade_Equipamento_VIEW AS
SELECT Equipamento.Categoria AS Categoria_equipamento, Tamanho, Cor, Material, Quantidade, Modalidade.Nome AS Modalidade
FROM Modalidade JOIN Equipamento ON Num_identificacao=FK_Num_identificacao_modalidade

SELECT * FROM Modalidade_Equipamento_VIEW

CREATE VIEW Pessoas_VIEW AS
SELECT * FROM Pessoa

SELECT * FROM Pessoas_VIEW