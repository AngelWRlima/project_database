-- Statement 17: Inserção de dados no país
INSERT INTO pais (nome, daimyo)
VALUES ('País do Fogo', 'Hiruzen Sarutobi');

-- Statement 18: Inserção de dados na única vila (Vila da Folha) no País do Fogo
INSERT INTO vila (id, nome, simbolo, nome_pais)
VALUES (1, 'Vila da Folha', 'Folha', 'País do Fogo');

-- Statement 19: Inserção de dados nos times (todos da Vila da Folha)
INSERT INTO time (numero, sensei, prota_1, prota_2, prota_3)
VALUES (1, 'Kakashi Hatake', 'Naruto Uzumaki', 'Sasuke Uchiha', 'Sakura Haruno');

INSERT INTO time (numero, sensei, prota_1, prota_2, prota_3)
VALUES (2, 'Asuma Sarutobi', 'Shikamaru Nara', 'Ino Yamanaka', 'Choji Akimichi');

-- Statement 20: Inserção de dados na tabela Kage
INSERT INTO kage (id_vila, numero, nome)
VALUES (1, 1, 'Hiruzen Sarutobi');

-- Statement 21: Inserção de dados na tabela Missão
INSERT INTO missao (id, nivel, recompensa, data)
VALUES (1, 'A', 1000.00, DATE '2023-09-13');

INSERT INTO missao (id, nivel, recompensa, data)
VALUES (2, 'B', 500.00, DATE '2023-09-14');

-- Statement 22: Inserção de dados na tabela Envia
INSERT INTO envia (id_missao, num_time, id_vila)
VALUES (1, 1, 1);

INSERT INTO envia (id_missao, num_time, id_vila)
VALUES (2, 2, 1);

-- Statement 23: Inserção de dados na tabela Torneio
INSERT INTO torneio (id, premio, data)
VALUES (1, 2000.00, DATE '2023-09-15');

INSERT INTO torneio (id, premio, data)
VALUES (2, 3000.00, DATE '2023-09-16');

-- Statement 24: Inserção de dados na tabela Podios
INSERT INTO podios (posicao)
VALUES (1);

INSERT INTO podios (posicao)
VALUES (2);

INSERT INTO podios (posicao)
VALUES (3);

-- Statement 25: Inserção de dados na tabela Participa
INSERT INTO participa (num_time, id_torneio, posicao)
VALUES (1, 1, 1);

INSERT INTO participa (num_time, id_torneio, posicao)
VALUES (2, 1, 2);

INSERT INTO participa (num_time, id_torneio, posicao)
VALUES (1, 2, 3);

INSERT INTO participa (num_time, id_torneio, posicao)
VALUES (2, 2, 1);

-- Statement 26: Inserção de dados na tabela Ninja
INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (1, 'Naruto Uzumaki', 1, '12345', 'Rua Hokage', 1);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (2, 'Sasuke Uchiha', 2, '54321', 'Rua Sharingan', 1);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (3, 'Sakura Haruno', 3, '67890', 'Rua Sakura', 1);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (4, 'Shikamaru Nara', 1, '98765', 'Rua Estratégia', 2);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (5, 'Ino Yamanaka', 2, '45678', 'Rua Floresta', 2);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (6, 'Choji Akimichi', 3, '23456', 'Rua Comilão', 2);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (7, 'Jiraiya', 2, '78901', 'Rua Sannin', 1);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (8, 'Kakashi Hatake', 1, '23456', 'Rua Copiadora', 1);

INSERT INTO ninja (id, nome, ranking, end_cep, end_logradouro, num_time)
VALUES (9, 'Asuma Sarutobi', 1, '34567', 'Rua Tabaco', 2);


-- Statement 27: Inserção de dados na tabela Jutsu
INSERT INTO jutsu (id, nome)
VALUES (1, 'Rasengan');

INSERT INTO jutsu (id, nome)
VALUES (2, 'Chidori');

INSERT INTO jutsu (id, nome)
VALUES (3, 'Kage Bunshin no Jutsu');

INSERT INTO jutsu(id, nome)
VALUES (4, 'Tsukuyomi');

INSERT INTO jutsu(id, nome)
VALUES(5, 'Correntes do Som Fantasma');

INSERT INTO jutsu(id, nome)
VALUES(6, 'Abertura Portão 6');

INSERT INTO jutsu(id, nome)
VALUES(7, 'Abertura Portão 7');


-- Statement 28: Inserção de dados na tabela Genjutsu
INSERT INTO genjutsu (id_jutsu, poder_ilusao)
VALUES (4, 90);

INSERT INTO genjutsu (id_jutsu, poder_ilusao)
VALUES (5, 70);

-- Statement 29: Inserção de dados na tabela Taijutsu
INSERT INTO taijutsu (id_jutsu, poder_fisico)
VALUES (6, 70);

INSERT INTO taijutsu (id_jutsu, poder_fisico)
VALUES (7, 80);

-- Statement 30: Inserção de dados na tabela Ninjutsu
INSERT INTO ninjutsu (id_jutsu, qtd_chacra, elemento)
VALUES (1, 50, 'Vento');

INSERT INTO ninjutsu (id_jutsu, qtd_chacra, elemento)
VALUES (2, 60, 'Raio');

INSERT INTO ninjutsu (id_jutsu, qtd_chacra, elemento)
VALUES (3, 30, 'Nenhum');


-- Statement 31: Inserção de dados na tabela Estilo Ninja
INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (1, 'Senjutsu');

INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (2, 'Ninjutsu');

INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (2, 'Genjutsu');

INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (4, 'Ninjutsu');

INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (4, 'Estratégia');

INSERT INTO estilo_ninja (id_ninja, estilo)
VALUES (6, 'Taijutsu');

-- Statement 32: Inserção de dados na tabela Treina
INSERT INTO treina (id_treinador, id_aluno)
VALUES (7, 1);

INSERT INTO treina (id_treinador, id_aluno)
VALUES (8, 2);

INSERT INTO treina (id_treinador, id_aluno)
VALUES (9, 4);

INSERT INTO treina (id_treinador, id_aluno)
VALUES (9, 6);
