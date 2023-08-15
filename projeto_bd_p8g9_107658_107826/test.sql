--test
-- VIEWS >> done
SELECT * FROM Modalidade_Instalacao_VIEW
SELECT * FROM Modalidade_Material_VIEW
SELECT * FROM Modalidade_Equipamento_VIEW

-- CONSULT >> done
EXEC AtletasList
EXEC EscalaoList

EXEC sp_consult_instalacao
EXEC sp_consult_modalidade
EXEC sp_consult_material
EXEC sp_consult_equipamento
EXEC sp_consult_equipa
EXEC sp_consult_adulto_responsavel
EXEC sp_consult_funcionario
EXEC sp_consult_pro_saude
EXEC sp_consult_treinador
EXEC sp_consult_diretor
EXEC sp_consult_pro_veterinario
EXEC sp_consult_equipa_assis_veterinaria
EXEC sp_consult_cavalo

-- CONSULT COM RESTRIÇÕES >> done
EXEC sp_consult_instalacao_by_modalidade @modalidade='Hipismo'
EXEC sp_consult_modalidade_by_categoria @categoria='Coletiva'
EXEC sp_consult_material_by_modalidade @modalidade='Futebol'
EXEC sp_consult_equipamento_by_modalidade @modalidade='Rugby'
EXEC sp_consult_equipa_by_modalidade @modalidade='Ténis'
EXEC sp_consult_equipa_by_modalidade_and_escalao @modalidade='Rugby', @escalao='Sub-21 Rugby'
EXEC sp_consult_equipa_by_genero @genero='M'
EXEC sp_consult_atleta_by_modalidade @modalidade='Basquetebol'
EXEC sp_consult_escalao_by_modalidade @modalidade='Rugby'
EXEC sp_consult_adulto_responsavel_by_atleta @dependente='Lucas Neves'
EXEC sp_consult_funcionario_by_salario @salariomin='1500', @salariomax='3700'
EXEC sp_consult_pro_saude_by_especialidade @especialidade='nutricionista'
EXEC sp_consult_treinador_by_escalao @escalao='Sub-19'
EXEC sp_consult_diretor_by_gabinete @gabinete='1'
EXEC sp_consult_pro_veterinario_by_clinica @clinica='PETites'
EXEC sp_consult_equipa_assis_veterinaria_by_clinica @clinica='Veterinário do Paço'
EXEC sp_consult_cavalo_by_pedigree @pedigree='Cavalo Árabe'

-- CREATE >> done
EXEC sp_createInstalacao 'Centro Hípico de treino', 'Rua Manuel Segundo', '4';
EXEC sp_createMaterial 'Toalhas', '3', '57';
EXEC sp_createEquipamento 'Rosa', '3', 'Jogo', 'S', 'Algodão', '7';
EXEC sp_createEquipa 'Baby Basket', 'Space Jam', 'M', '3';
EXEC sp_createPessoa @nome='Rodrigo Santos', @genero='M', @cartao_cidadao='213365122', @telemovel='917787744', @email='rodrigo_santos@gmail.com';
EXEC sp_createAtleta @nome='Manel Castro', @genero='M', @cartao_cidadao='212577322', @telemovel='913912987', @email='m_castro@gmail.com',
					 @declaracao_medica='2023', @ref_transacao_bancaria='551308851', @idade='21', @nome_escalao='Seniores Basket',
					 @nome_responsavel=null, @genero_responsavel=null, @cartao_cidadao_responsavel=null, @telemovel_responsavel=null, @email_responsavel=null,
					 @parentesco=null, @data_in=null, @data_out=null;
EXEC sp_createAtleta @nome='Inês Mamona', @genero='F', @cartao_cidadao='212577442', @telemovel='923915587', @email='imamona@gmail.com',
					 @declaracao_medica='2023', @ref_transacao_bancaria='551493851', @idade='21', @nome_escalao='Seniores Rugby',
					 @nome_responsavel=null, @genero_responsavel=null, @cartao_cidadao_responsavel=null, @telemovel_responsavel=null, @email_responsavel=null,
					 @parentesco=null, @data_in=null, @data_out=null;
EXEC sp_createAtleta @nome='Afonso Lourenço', @genero='M', @cartao_cidadao='212388421', @telemovel='9368468774', @email='af_lou@gmail.com',
					 @declaracao_medica='2023', @ref_transacao_bancaria='533817449', @idade='8', @nome_escalao='Iniciados', -- >> nao fez o trigger do escalao/idade
					 @nome_responsavel='Anabela Lourenço', @genero_responsavel='F', @cartao_cidadao_responsavel='227364383', @telemovel_responsavel='922954033', @email_responsavel='belourenco@gmail.com',
					 @parentesco='Mãe', @data_in='22-01-2023', @data_out=null;
--EXEC sp_createAtleta @nome='Afonso Lourenço', @genero='M', @cartao_cidadao='212388421', @telemovel=null, @email=null,
--					 @declaracao_medica='2023', @ref_transacao_bancaria='533817449', @idade='4', @nome_escalao='Seniores Basket', -- >> nao fez o trigger do escalao/idade
--					 @nome_responsavel='Anabela Lourenço', @genero_responsavel='F', @cartao_cidadao_responsavel='227364383', @telemovel_responsavel='922954033', @email_responsavel='belourenco@gmail.com',
--					 @parentesco='Mãe', @data_in='22-01-2023', @data_out=null;
EXEC sp_createAdultoResponsavel @cartao_cidadao=null, @nome_responsavel='Mariana Torres', @genero='F', @cartao_cidadao_responsavel='437674393', @telemovel_responsavel='931115739', @email_responsavel='m_torres@gmail.com',
					 @parentesco='Mãe', @data_in='14-03-2023', @data_out=null;
EXEC sp_createFuncionario @nome='José Mendes',  @genero='M', @cartao_cidadao='674472229', @telemovel='933986241', @email='jmendes@gmail.com', @num_funcionario='122137', @equipavet=null, @salario='950';
EXEC sp_createProSaude @nome='Jéssica Rodrigues',  @genero='F', @cartao_cidadao='266735992', @telemovel='927721901', @email='jesrods@gmail.com', @num_funcionario='168213', @equipavet=null, @salario='2350', @num_cedula_profissional='JM8841', @cargo='medico', @nome_escalao='Sub-18 Basket';
EXEC sp_createProSaude @nome='Francisco Silva',  @genero='M', @cartao_cidadao='248798992', @telemovel='917661941', @email='f_silva@gmail.com', @num_funcionario='148953', @equipavet=null, @salario='2200', @num_cedula_profissional='RG8371', @cargo='fisioterapeuta', @nome_escalao='Sub-23';
EXEC sp_createTreinador @nome='Cândido Costa', @genero='M', @cartao_cidadao='300177351', @telemovel='911908472', @email='cc@gmail.com', @num_funcionario='172653', @equipavet=null, @salario='2500', @nome_escalao='Veteranos Futebol';
EXEC sp_createCavalo @cartao_cidadao=null, @nome_cavalo='Zeus', @tamanho='1,4 - 1,6 m', @cor='Beje', @pedigree='Cavalo Árabe';

-- DELETE >> done
EXEC sp_delete_escalao @nome='...'; -- >> done
EXEC sp_delete_instalacao @nome='...'; -- >> done
EXEC sp_delete_material @nome='...'; -- >> done
EXEC sp_delete_equipamento @id='...'; -- >> done
EXEC sp_delete_equipa @id='...'; -- >> done
EXEC sp_delete_atleta @cc='212577442', @nome_escalao='Seniores Rugby'; -- >> done
EXEC sp_delete_adulto_responsavel @cc='...'; -- >> done
EXEC sp_delete_funcionario @cc='...'; -- >> done
EXEC sp_delete_treinador @cc='...'; -- >> done


-- SELECTS
select * from Escalao
select * from Equipamento
select * from Instalacao
select * from Material
select * from Pessoa
select * from Atleta
select * from Adulto_Responsavel
select * from Rel_Responsavel_Atleta
select * from Funcionario
select * from Treinador
select * from Equipa
select * from Cavalo
select * from Prof_Saude