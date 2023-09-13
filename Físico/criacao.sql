-- Criar tabela de Pais
CREATE TABLE pais (
    nome VARCHAR(255),
    daimyo VARCHAR(255),
    constraint pk_pais primary key (nome)
);

-- Criar tabela da Vila
CREATE TABLE vila (	
    id INT,
    nome VARCHAR(255),
    simbolo VARCHAR(255),
    nome_pais VARCHAR(255),
    constraint pk_vila primary key (id),
    constraint fk_vila foreign key (nome_pais) references pais(nome)
);

-- Criar tabela de Kage
CREATE TABLE kage (
    id_vila INT,
    numero INT,
    nome VARCHAR(255),
    titulo VARCHAR(20),
    constraint pk_kage primary key (id_vila),
    constraint fk_kage foreign key (id_vila) references vila(id)
);

-- Criar tabela de missao
CREATE TABLE missao (
    id INT,
    nivel VARCHAR(2), -- 2 porque pode ser A+, S-, etc
    recompensa DECIMAL(10, 2), -- DECIMAL para valores monetarios
    data DATE,
    constraint pk_missao primary key (id)
);

-- Criar tabela Time
CREATE TABLE time (
    numero INT,
    sensei VARCHAR(255),
    constraint pk_time primary key (numero)
);

-- Criar tabela Envia
CREATE TABLE envia (
    id_missao INT,
    num_time INT,
    id_vila INT NOT NULL,
    constraint pk_envia primary key (id_missao, num_time),
    constraint fk_envia_mis foreign key (id_missao) references missao(id),
    constraint fk_envia_tim foreign key (num_time) references time(numero),
    constraint fk_envia_vil foreign key (id_vila) references vila(id)
);

-- Criar tabela Torneio
CREATE TABLE torneio (
    id INT,
    premio DECIMAL(10, 2), -- DECIMAL para valores monetarios
    data DATE,
    constraint pk_torneio primary key (id)
);

-- Criar tabela podios
CREATE TABLE podios (
    posicao INT primary key
);

-- Criar tabela Participa
CREATE TABLE participa (
    num_time INT,
    id_torneio INT,
    posicao INT,
    constraint pk_participa primary key (num_time, id_torneio),
    constraint fk_participa_num foreign key (num_time) references time(numero),
    constraint fk_participa_id_torneio foreign key (id_torneio) references torneio(id),
    constraint fk_participa_pos foreign key (posicao) references podios(posicao)
);

-- Criar tabela de Ninja
CREATE TABLE ninja (
    id INT,
    nome VARCHAR(255),
    ranking INT,
    end_cep VARCHAR(20),
    end_logradouro VARCHAR(100),
    num_time INT, -- Verificar ao inserir, modificar e deletar elemento
    constraint pk_ninja primary key (id),
    constraint fk_ninja foreign key (num_time) references time(numero)
);

-- Criar tabela Estilo Ninja
CREATE TABLE estilo_ninja (
    id_ninja INT,
    estilo VARCHAR(255),
    constraint pk_estilo primary key (id_ninja, estilo),
    constraint fk_estilo foreign key (id_ninja) references ninja(id)
);

-- Criar tabela de Treina
CREATE TABLE treina (
    id_treinador INT,
    id_aluno INT,
    constraint pk_treina primary key (id_treinador, id_aluno),
    constraint fk_treina_treinador foreign key (id_treinador) references ninja(id),
    constraint fk_treina_aluno foreign key (id_aluno) references ninja(id)
);

-- Criar tabela Jutsu
CREATE TABLE jutsu (
    id INT primary key,
    nome VARCHAR(255)
);


-- Criar tabela desenvolve
CREATE TABLE desenvolve(
    id_ninja INT,
    id_jutsu INT,
    data DATE,
    constraint pk_desenvolve primary key (id_ninja, id_jutsu, data),
    constraint fk_desenvolve_ninja foreign key (id_ninja) references ninja(id),
    constraint fk_desenvolve_jutsu foreign key (id_jutsu) references jutsu(id)
);

-- Ninjutsu
CREATE TABLE ninjutsu (
    id_jutsu INT,
    qtd_chacra INT,
    elemento VARCHAR(25),
    constraint pk_ninjutsu primary key (id_jutsu),
    constraint fk_ninjutsu foreign key (id_jutsu) references jutsu(id)
);

-- Taijutsu
CREATE TABLE taijutsu (
    id_jutsu INT,
    poder_fisico INT,
    constraint pk_taijutsu primary key (id_jutsu),
    constraint fk_taijutsu foreign key (id_jutsu) references jutsu(id)
);

-- Genjutsu
CREATE TABLE genjutsu (
    id_jutsu INT,
    poder_ilusao INT,
    constraint pk_genjutsu primary key (id_jutsu),
    constraint fk_genjutsu foreign key (id_jutsu) references jutsu(id)
);
