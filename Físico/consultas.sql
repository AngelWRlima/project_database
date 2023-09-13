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


