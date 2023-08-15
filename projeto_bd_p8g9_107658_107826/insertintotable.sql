-- Insert values Modalidade
INSERT INTO Modalidade([Nome],[Categoria])
VALUES
	('Basquetebol', 'Coletiva'),
	('Futebol', 'Coletiva'),
	('Rugby', 'Coletiva'),
	('Ténis', 'Mista'),
	('Hipismo', 'Mista');

select * from Modalidade

-- Insert values Instalacao
INSERT INTO dbo.Instalacao([Nome],[Morada],[FK_Num_identificacao_modalidade])
VALUES
	('Pavilhão desportivo Macaquinhos', 'Rua Gomes de Castro', '0'),
	('Pavilhão desportivo Nachos Picantes', 'Rua Doutor Engenheiro, nº77', '0'),
	('Campo Relva Seca', 'Rua Magalhães Primeiro', '1'),
	('Campo Mergulhinhos', 'Rua Taremi', '1'),
	('Campo das Relíquias', 'Rua São Paulo', '1'),
	('Campo de Rugby Anastasia', 'Rua Yuri, nº178', '2'),
	('Campo de Rugby das Aguadeiras', 'Rua Bermudes', '2'),
	('Court dos Betos', 'Rua do Mel das Abelhinhas, nº157', '3'),
	('Court Fake it till you make it', 'Rua do Mel das Abelhinhas, nº157', '3'),
	('Court TaskMaster', 'Rua do Mel das Abelhinhas, nº157', '3'),
	('Hipódromo dos Porquinhos', 'Rua do Tio Manel', '4'),
	('Centro de Treino - Estábulo Requeijão', 'Rua Queijaria Continente, nº 18', '4');

select * from Instalacao

-- Insert values Material
INSERT INTO Material([Nome],[FK_Num_identificacao_modalidade],[Quantidade])
VALUES
	('Cones Pequenos', '1', '225'),
	('Escada Quick Ladder', '1', '15'),
	('Barreira de treino', '1', '50'),
	('Cones 30 cm', '1', '150'),
	('Estaca de treino', '1', '200'),
	('Bola de futebol', '1', '75'),
	('Bola de Basquetebol', '0', '150'),
	('Cones médios', '0', '250'),
	('Coletes', '0', '100'),
	('Bola de Rugby', '2', '80'),
	('Varas', '2', '170'),
	('Sacos', '2', '35'),
	('Bola de Ténis', '3', '570'),
	('Raquetes', '3', '230'),
	('Máquina lança bolas', '3', '6'),
	('Cela', '4', '200'),
	('Barreiras', '4', '150'),
	('Anéis', '4', '90'),
	('Rédeas', '4', '270'),
	('Chicote', '4', '14'),
	('Escovas', '4', '170'),
	('Sacos de Ração', '4', '30');

select * from Material

-- Insert values Equipamento
INSERT INTO Equipamento([Cor],[FK_Num_identificacao_modalidade],[Categoria],[Tamanho],[Material],[Quantidade])
VALUES
	('Vermelho', '1','Treino', 'XS', 'Poliester', '20'),
	('Vermelho', '1','Treino', 'S', 'Poliester', '20'),
	('Vermelho', '1','Treino', 'M', 'Poliester', '20'),
	('Vermelho', '1','Treino', 'L', 'Poliester', '20'),
	('Vermelho', '1','Treino', 'XL', 'Poliester', '20'),
	('Vermelho', '1','Jogo casa', 'XS', 'Alogodão', '20'),
	('Vermelho', '1','Jogo casa', 'S', 'Alogodão', '20'),
	('Vermelho', '1','Jogo casa', 'M', 'Alogodão', '20'),
	('Vermelho', '1','Jogo casa', 'L', 'Alogodão', '20'),
	('Vermelho', '1','Jogo casa', 'XL', 'Alogodão', '20'),
	('Dourado', '1','Jogo fora', 'XS', 'Alogodão', '20'),
	('Dourado', '1','Jogo fora', 'S', 'Alogodão', '20'),
	('Dourado', '1','Jogo fora', 'M', 'Alogodão', '20'),
	('Dourado', '1','Jogo fora', 'L', 'Alogodão', '20'),
	('Dourado', '1','Jogo fora', 'XL', 'Alogodão', '20'),
	('Verde', '2','Jogo', 'XS', 'Alogodão', '20'),
	('Verde', '2','Jogo', 'S', 'Alogodão', '20'),
	('Verde', '2','Jogo', 'M', 'Alogodão', '20'),
	('Verde', '2','Jogo', 'L', 'Alogodão', '20'),
	('Verde', '2','Jogo', 'XL', 'Alogodão', '20'),
	('Castanho', '4','Competição', 'XS', 'Alogodão', '20'),
	('Castanho', '4','Competição', 'S', 'Alogodão', '20'),
	('Castanho', '4','Competição', 'M', 'Alogodão', '20'),
	('Castanho', '4','Competição', 'L', 'Alogodão', '20'),
	('Castanho', '4','Competição', 'XL', 'Alogodão', '5'),
	('Castanho', '4','Competição', 'XS', 'Couro', '20'),
	('Castanho', '4','Competição', 'S', 'Couro', '20'),
	('Castanho', '4','Competição', 'M', 'Couro', '20'),
	('Castanho', '4','Competição', 'L', 'Couro', '20'),
	('Castanho', '4','Competição', 'XL', 'Couro', '5'),
	('Azul escuro', '4','Competição', 'XS', 'Alogodão', '20'),
	('Azul escuro', '4','Competição', 'S', 'Alogodão', '20'),
	('Azul escuro', '4','Competição', 'M', 'Alogodão', '20'),
	('Azul escuro', '4','Competição', 'L', 'Alogodão', '20'),
	('Azul escuro', '4','Competição', 'XL', 'Alogodão', '5'),
	('Azul', '0','Jogo', 'XS', 'Poliester', '10'),
	('Azul', '0','Jogo', 'S', 'Poliester', '10'),
	('Azul', '0','Jogo', 'M', 'Poliester', '10'),
	('Azul', '0','Jogo', 'L', 'Poliester', '10'),
	('Azul', '0','Jogo', 'XL', 'Poliester', '10'),
	('Branco', '3','Competição', 'XS', 'Alogodão', '20'),
	('Branco', '3','Competição', 'S', 'Alogodão', '20'),
	('Branco', '3','Competição', 'M', 'Alogodão', '30'),
	('Branco', '3','Competição', 'L', 'Alogodão', '40'),
	('Branco', '3','Competição', 'XL', 'Alogodão', '20');

select * from Equipamento

-- Insert values Escalao
INSERT INTO Escalao([FK_Num_identificacao_modalidade],[Nome],[Idade])
VALUES
	-- basket
	('0', 'Baby Basket', '4-5'),
	('0', 'Mini 8 Basket', '6-7'),
	('0', 'Mini 10 Basket', '8-9'),
	('0', 'Mini 12 Basket', '10-11'),
	('0', 'Sub-14 Basket', '12-13'),
	('0', 'Sub-16 Basket', '14-15'),
	('0', 'Sub-18 Basket', '16-17'),
	('0', 'Seniores Basket', '18-19+'),
	('0', 'Masters Basket', '35+'),

	-- futebol
	('1', 'Sub-7', '5-6'),
	('1', 'Sub-9', '7-8'),
	('1', 'Sub-11', '9-10'),
	('1', 'Sub-13', '11-12'),
	('1', 'Sub-14', '12-13'),
	('1', 'Sub-15', '13-14'),
	('1', 'Sub-16', '14-15'),
	('1', 'Sub-17', '15-16'),
	('1', 'Sub-18', '16-17'),
	('1', 'Sub-19', '17-18'),
	('1', 'Sub-20', '18-19'),
	('1', 'Sub-21', '19-20'),
	('1', 'Sub-23', '21-22'),
	('1', 'Seniores Futebol', '23+'),
	('1', 'Veteranos Futebol', '40+'),

	-- rugby
	('2', 'Sub-8 Rugby', '6-7'),
	('2', 'Sub-10 Rugby', '8-9'),
	('2', 'Sub-12 Rugby', '10-11'),
	('2', 'Sub-14 Rugby', '12-13'),
	('2', 'Sub-15 Rugby', '13-14'),
	('2', 'Sub-16 Rugby', '14-15'),
	('2', 'Sub-18 Rugby', '16-17'),
	('2', 'Sub-21 Rugby', '19-20'),
	('2', 'Seniores Rugby', '21+'),
	('2', 'Veteranos Rugby', '35+'),

	-- tenis
	('3', 'Sub-11 Tenis', '9-10'),
	('3', 'Sub-13 Tenis', '11-12'),
	('3', 'Sub-15 Tenis', '13-14'),
	('3', 'Sub-17 Tenis', '15-16'),
	('3', 'Sub-19 Tenis', '17-18'),
	('3', 'Sub-21 Tenis', '19-20'),
	('3', 'Seniores Tenis', '20+'),
	('3', 'Veteranos Tenis', '40+'),

	-- hipismo
	('4', 'Iniciados', '8-12'),
	('4', 'Juvenis', '13-14'),
	('4', 'Juniores', '15-18'),
	('4', 'Seniores', '19+'),
	('4', 'Veteranos', '30+');

select * from Escalao

-- Insert values Equipa
INSERT INTO Equipa([FK_Nome_escalao],[Nome],[Genero],[Num_jogadores])
VALUES
	('Sub-14 Basket', 'Bolinhos', 'M', 10),
	('Sub-16 Basket', 'The Bulls', 'M', 10),
	('Seniores Basket', 'Equipa A', 'M', 10),
	('Sub-13', 'Siiiuuuiii', 'M', 20),
	('Sub-19', 'SC Arcozelo', 'M', 20),
	('Veteranos Futebol', 'Candido Costa FC', 'M', 20),
	('Sub-21 Rugby', 'Bairrada meets Tondela', 'F', 15),
	('Seniores Rugby', 'Beast Tondela', 'F', 15),
	('Veteranos Tenis', 'João Rodrigues & António Figueiredo', 'M', 2),
	('Juniores', 'Simão Garrido & Pedro Silva - Campeonato pré-junior', 'M', 2);

select * from Equipa

-- Insert values Rel_Modalidade_Equipa
INSERT INTO Rel_Modalidade_Equipa ([FK_Num_identificacao_equipa],[FK_Num_identificacao_modalidade])
VALUES
	('1', '0'),
	('2', '0'),
	('3', '0'),
	('4', '1'),
	('5', '1'),
	('6', '1'),
	('7', '2'),
	('8', '2'),
	('9', '3'),
	('10', '4');

select * from Rel_Modalidade_Equipa

-- Insert values Pessoa
INSERT INTO Pessoa([Nome],[Genero],[Cartao_cidadao],[Contacto_telefonico],[email])			
VALUES
	--('','F','111111111','222222222','');
	-- atletas
	('Lucas Neves', 'M', '223023739', '969330761', 'lucaneves@gmail.com'),
	('Camila Mota', 'F', '152092799', ' 935849568', 'camilota@gmail.com'),
	('Bernardo Peixoto', 'M', '910045304', '928262646', 'bernasxoto@gmail.com'),
	('Pedro Teixeira', 'M', '729848817', '921066981', 'p_teixeira@gmail.com'),
	('David Loureiro', 'M', '365784028', '961360582', 'david.lourenco@gmail.com'),

	-- adulto responsavel
	('Ana Júlia Pires', 'F', '406419522', '912226067', 'ana.julia.pires@hotmail.com'),
	('Danilo Costa', 'M', '390475751', '939782724', 'danilo_costa@gmail.com'),

	-- funcionarios - pro saude
	('Daniel Gomes', 'M', '834843295', '926836741', 'dani_gomes@gmail.com'), -- fisioterapeuta
	('Carolina Barros', 'F', '165323730', '961360934', 'carolina_barros@gmail.com'), -- medico
	('Filipe Castro', 'M', '709477679', '917308510', 'filipe.castro@hotmail.com'), -- nutricionista
	('Catarina Batista', 'F', '701328549', '963928042', 'catarina_batista@gmail.com'), -- vet

	-- funcionarios - treinador
	('João Roldão', 'M', '645251018', '928525629', 'joao.roldao@gmail.com'),
	('Renato Gonçalves', 'M', '267465378', '968222764', 'renatogoncalves@gmail.com'),
	('Roberto Fernandes', 'M', '276546892', '938276542', 'roberto_fernandes@gmail.com'),
	('Miguel Araújo', 'M', '274580360', '916073492', 'miguel.araujo@gmail.com'), -- vet

	-- funcionarios - diretor
	('Vitor Hugo Mota', 'M', '325593034', '930849900', 'hugo.vitor.mota@hotmail.com'),

	-- funcionarios - outros
	('Cecília Domingues', 'F', '537634541', '930776144', 'cecilia.gomes@gmail.com'),
	('José da Mata', 'M', '409286211', '961723905', 'jose_mata@gmail.com');

select * from Pessoa

-- Insert values Atleta
INSERT INTO Atleta ([FK_Cartao_cidadao],[Num_inscricao],[Declaracao_medica],[Ref_transacao_bancaria],[Idade],[Fk_Nome_escalao])
VALUES
	('223023739', '1', '2022', '580273439', '12', 'Sub-14 Basket'),
	('152092799', '2', '2022', '944667192', '18', 'Sub-21 Rugby'),
	('910045304', '3', '2023', '312143457', '18', 'Sub-19'),
	('729848817', '4', '2023', '794936743', '23', 'Seniores Basket'),
	('365784028', '5', '2022', '147150247', '45', 'Veteranos Tenis');

select * from Equipa
select * from Atleta
select * from Pessoa
-- Insert values Adulto_Responsavel
INSERT INTO Adulto_Responsavel ([FK_Cartao_cidadao],[Grau_parentesco])
VALUES
	('406419522', 'Mãe'),
	('390475751', 'Avô');

select * from Adulto_Responsavel

-- Insert values Rel_Responsavel_Atleta
INSERT INTO Rel_Responsavel_Atleta ([FK_Cartao_cidadao_atleta],[FK_Cartao_cidadao_responsavel],[Data_in],[Data_out])
VALUES
	('223023739', '406419522', '22-01-2011', '22-01-2024');

select * from Rel_Responsavel_Atleta

-- Insert values Equipa_Assis_Veterinaria
INSERT INTO Equipa_Assis_Veterinaria ([FK_Num_identificacao_modalidade],[Morada],[Num_registo_nacional],[Nome_clinica])
VALUES
	('4', 'Rua Adriano dos Santos', '8462988284738', 'PETites'),
	('4', 'Rua do Paço', '1836382482746', 'Veterinário do Paço');

select * from Equipa_Assis_Veterinaria

-- Insert values Funcionario
INSERT INTO Funcionario ([FK_Cartao_cidadao],[Num_funcionario],[FK_Num_registo_nacional_equipavet],[Salario])
VALUES
	('834843295', '109758', null, '2300'),
	('165323730', '176453', null, '2800'),
	('709477679', '184765', null, '2000'),
	('701328549', '173645', '8462988284738', '2500'),
	('645251018', '164532', null, '2000'),
	('274580360', '134562', '1836382482746', '2400'),
	('325593034', '153427', null, '3200'),
	('537634541', '115625', null, '800'),
	('409286211', '185243', null, '850'),
	('267465378', '193746', null, '2350'),
	('276546892', '133422', null, '2550');

select * from Funcionario

-- Insert values Prof_Saude
INSERT INTO Prof_Saude ([FK_Cartao_cidadao],[FK_Num_funcionario],[Num_cedula_profissional],[Cargo])
VALUES
	('834843295', '109758', 'AJ7263', 'fisioterapeuta'),
	('165323730', '176453', 'NF9283', 'medico'),
	('709477679', '184765', 'RM6325', 'nutricionista');

select * from Prof_Saude

-- Insert values Rel_Escalao_Pro_Saude
INSERT INTO  Rel_Escalao_Pro_Saude ([FK_Cartao_cidadao_saude],[FK_Num_funcionario_saude],[FK_Num_cedula_profissional_saude],[FK_Nome_escalao])
VALUES
	('834843295', '109758', 'AJ7263', 'Seniores Futebol'),
	('165323730', '176453', 'NF9283', 'Seniores Rugby'),
	('709477679', '184765', 'RM6325', 'Sub-21 Tenis');

select * from Rel_Escalao_Pro_Saude

-- Insert values Treinador
INSERT INTO Treinador ([FK_Cartao_cidadao],[FK_Num_funcionario],[FK_Nome_escalao])
VALUES
	('645251018', '164532', 'Sub-19'),
	('267465378', '193746', 'Sub-14 Basket'),
	('276546892', '133422', 'Veteranos Tenis');

select * from Treinador

-- Insert values Diretor
INSERT INTO Diretor ([FK_Cartao_cidadao],[FK_Num_funcionario],[Gabinete])
VALUES
	('325593034', '153427', '1');

select * from Diretor

-- Insert values Cavalo
INSERT INTO Cavalo ([FK_Cartao_cidadao_atleta],[Num_identificacao_chip],[Nome],[Tamanho],[Cor],[Pedigree])
VALUES
	('212388421', '10000', 'Leal', '1,4 - 1,6 m', 'Branco', 'Cavalo Árabe'),
	(null, '10001', 'Royal', '1,5 - 1,6 m', 'Beje', 'Akhal-Teke'),
	(null, '10002', 'Vampiro', '1,6 - 1,7 m', 'Preto', 'Hanoveriano');

select * from Cavalo

-- Insert values Rel_Modalidade_Cavalo
INSERT INTO Rel_Modalidade_Cavalo ([FK_Num_identificacao_chip],[FK_Num_identificacao_modalidade])
VALUES
	('10000', '4'),
	('10001', '4'),
	('10002', '4');

select * from Rel_Modalidade_Cavalo

-----------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Escalao_Basket([nome])
VALUES
	('Baby Basket'),
	('Mini 8 Basket'),
	('Mini 10 Basket'),
	('Mini 12 Basket'),
	('Sub-14 Basket'),
	('Sub-16 Basket'),
	('Sub-18 Basket'),
	('Seniores Basket'),
	('Masters Basket');

INSERT INTO Escalao_Futebol([nome])
VALUES
	('Sub-7'),
	('Sub-9'),
	('Sub-11'),
	('Sub-13'),
	('Sub-14'),
	('Sub-15'),
	('Sub-16'),
	('Sub-17'),
	('Sub-18'),
	('Sub-19'),
	('Sub-20'),
	('Sub-21'),
	('Sub-23'),
	('Seniores Futebol'),
	('Veteranos Futebol');

INSERT INTO Escalao_Rugby([nome])
VALUES
	('Sub-8 Rugby'), 
	('Sub-10 Rugby'),
	('Sub-12 Rugby'),
	('Sub-14 Rugby'),
	('Sub-15 Rugby'),
	('Sub-16 Rugby'),
	('Sub-18 Rugby'),
	('Sub-21 Rugby'),
	('Seniores Rugby'), 
	('Veteranos Rugby');

INSERT INTO Escalao_Tenis([nome])
VALUES
	('Sub-11 Tenis'), 
	('Sub-13 Tenis'), 
	('Sub-15 Tenis'), 
	('Sub-19 Tenis'), 
	('Sub-21 Tenis'), 
	('Seniores Tenis'),
	('Veteranos Tenis');

INSERT INTO Escalao_Hipismo([nome])
VALUES
	('Iniciados'),
	('Juvenis'),
	('Juniores'), 
	('Seniores'), 
	('Veteranos');

select * from Escalao_Basket
select * from Escalao_Futebol
select * from Escalao_Rugby
select * from Escalao_Tenis
select * from Escalao_Hipismo
