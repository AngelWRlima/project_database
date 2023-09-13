-- Selecione todos os ninjas e seus estilos ninja (se tiverem) na Vila da Folha.
SELECT n.nome, en.estilo
FROM ninja n
LEFT JOIN estilo_ninja en ON n.id = en.id_ninja
WHERE n.num_time = 1;

-- Encontre todos os ninjas que desenvolveram o jutsu 'Rasengan'.
SELECT n.nome
FROM ninja n
INNER JOIN desenvolve d ON n.id = d.id_ninja
INNER JOIN jutsu j ON d.id_jutsu = j.id
WHERE j.nome = 'Rasengan';

-- Listar todos os times e seus respectivos senseis na Vila da Folha, sem repetições
SELECT distinct(t.numero), t.sensei
FROM time t
LEFT JOIN ninja n ON t.numero = n.num_time
WHERE n.num_time IS NOT NULL;

-- Encontre todos os times que não participaram do torneio com prêmio de 3000.00.
SELECT numero, sensei
FROM time
WHERE numero NOT IN (
    SELECT num_time
    FROM participa
    WHERE id_torneio = (
        SELECT id
        FROM torneio
        WHERE premio = 3000.00
    )
);

-- Liste todas as missões e seus times correspondentes, incluindo times que não participaram de nenhuma missão.
SELECT m.id AS IDMissao, m.nivel AS NivelMissao, t.numero AS NumeroTime
FROM missao m
RIGHT JOIN envia e ON m.id = e.id_missao
RIGHT JOIN time t ON e.num_time = t.numero;


--Projetar o nível e a data das missões enviadas pela Vila da Folha;
SELECT NIVEL, DATA
FROM MISSAO
JOIN ENVIA ON MISSAO.id = envia.ID_MISSAO
JOIN VILA ON ENVIA.ID_VILA = VILA.ID
WHERE VILA.NOME = 'Vila da Folha';


-- Projetar o nome do Ninja Treinador que treinou mais de um Aluno;
SELECT NOME FROM NINJA WHERE ID IN 
    (SELECT ID_TREINADOR FROM TREINA 
    GROUP BY ID_TREINADOR 
    HAVING COUNT(*) > 1);


-- Projetar o número do time que fez apenas uma missão;
SELECT T.NUMERO
FROM TIME T INNER
JOIN ENVIA E ON T.NUMERO = E.NUM_TIME
GROUP BY T.NUMERO
HAVING COUNT(E.ID_MISSAO) = 1;


-- Projetar os ids das vilas que mais fizeram missões;
SELECT e.id_vila, COUNT(*) AS total_missões
FROM envia e
INNER JOIN missao m ON e.id_missao = m.id
GROUP BY e.id_vila


-- Projetar os ninjas e a quantidade de jutsus criados em ordem decrescente
SELECT n.nome, COUNT(d.id_jutsu) AS total_jutsus_criados
FROM ninja n
LEFT JOIN desenvolve d ON n.id = d.id_ninja
GROUP BY n.nome
ORDER BY total_jutsus_criados DESC;


-- Projetar todos os ninjas que participam de torneios e/ou que treinam outros ninjas
SELECT nome_ninja, acao
FROM (
    SELECT n.nome AS nome_ninja, 'Participa em Torneio' AS acao
    FROM ninja n
    INNER JOIN participa p ON n.num_time = p.num_time

    UNION

    SELECT n.nome AS nome_ninja, 'É Treinador' AS acao
    FROM ninja n
    INNER JOIN treina t ON n.id = t.id_treinador
);


-- Projetar todas as vilas que tem pelo menos 1 ninja
SELECT DISTINCT v.id, v.nome, v.simbolo
FROM vila v
WHERE EXISTS (
    SELECT 1
    FROM ninja n
    WHERE n.num_time = v.id
);


-- Projetar todas as vilas que não tem nenhum ninja
SELECT v.id, v.nome, v.simbolo
FROM vila v
LEFT JOIN ninja n ON v.id = n.num_time
WHERE n.num_time IS NULL;


--Projetar a quantidade de ninjas que estão no time 1
SELECT t.numero AS numero_time, t.sensei, (
    SELECT COUNT(*) 
    FROM ninja 
    WHERE num_time = 1
) AS total_ninjas_time_1
FROM time t
WHERE t.numero = 1;


--Projetar todas as missões que foram concluídas e os times que as concluíram
SELECT m.id AS IDMissao, m.nivel AS NivelMissao, t.numero AS NumeroTime
FROM missao m
LEFT JOIN envia e ON m.id = e.id_missao
LEFT JOIN time t ON e.num_time = t.numero
WHERE e.num_time IS NOT NULL;

