drop table if exists hospital;
drop table if exists especialidades;
drop table if exists pacientes;
drop table if exists medicos;
drop table if exists medicos_especialidades;
drop table if exists consultas;
drop table if exists exames;

CREATE TABLE hospital (
    cnpj varchar(14) not null,
    nome varchat(50) not null,
    endereco varchar(100) not null,
    primary key (cnpj)
);

INSERT INTO hospital (cnpj, nome, endereco) VALUES
    ('39159144000120', 'Hospital IFRS', 'Alfredo Huch, 475');

CREATE TABLE especialidades (
    id_especialidade int not null,
    nome varchar(50) not null,
    primary key (id_especialidade)
);

INSERT INTO especialidades (id_especialidade, nome) VALUES
    (1, 'Ortopedia'),
    (2, 'Pediatria'),
    (3, 'Oftalmologia'),
    (4, 'Geriatria'),
    (5, 'Cardiologia');

CREATE TABLE pacientes (
    cpf int not null,
    nome varchar(50) not null,
    primary key (cpf)
);

INSERT INTO pacientes (cpf, nome) VALUES
    (17658586072, 'Francisco Cunha'),
    (22358996072, 'Rosa da Silva'),
    (09856787652, 'Geraldo Otavio'),
    (12345678925, 'Andressa Machado');

CREATE TABLE medicos (
    crm int not null,
    nome varchar(50) not null,
    cnpj varchar(14) not null,
    FOREIGN KEY (cnpj) REFERENCES hospital(cnpj),
    primary key (crm)
);

INSERT INTO medicos (crm, nome, cnpj) VALUES
    (553810, 'João da Silva', '39159144000120'),
    (223810, 'Mariana Lima', '39159144000120'),
    (121169, 'Pedro Pereira', '39159144000120');

CREATE TABLE medicos_especialidades (
    crm int not null,
    id_especialidade int not null,
    FOREIGN KEY (crm) REFERENCES medicos(crm),
    FOREIGN KEY (id_especialidade) REFERENCES especialidades(id_especialidade),
    primary key (crm, id_especialidade)
);

INSERT INTO medicos_especialidades (crm, id_especialidade) VALUES
    (553810, 1),
    (553810, 4),
    (553810, 2),
    (121169, 2);

CREATE TABLE consultas (
    id_consulta integer not null,
    dt_consulta date not null,
    hora varchar(8) not null,
    diagnostico varchar(50) not null,
    crm integer not null,
    cpf integer not null,
    FOREIGN KEY (crm) REFERENCES medicos(crm),
    FOREIGN KEY (cpf) REFERENCES pacientes(cpf),
    primary key (id_consulta)
);

INSERT INTO consultas (id_consulta, dt_consulta, hora, diagnostico, crm, cpf) VALUES
    (1, '2013-08-10', '09:00:00', 'Olha o coração', 223810, 09856787652),
    (2, '2013-08-10', '10:00:00', 'Repetir os exames', 553810, 22358996072),
    (3, '2013-09-16', '09:00:00', 'Precisa rx', 553810, 09856787652);

CREATE TABLE exames (
    id_exame int not null,
    descricao varchar(50) not null,
    dt_exame date not null,
    valor numeric not null,
    id_consulta int not null,
    crm int not null,
    FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
    FOREIGN KEY (crm) REFERENCES medicos(crm),
    primary key (id_exame)
);

INSERT INTO exames (id_exame, descricao, dt_exame, valor, id_consulta, crm) VALUES
    (1, 'Exame1', '2013-09-11', 100, 1, 223810),
    (2, 'Exame2', '2013-09-10', 100, 2, 553810),
    (3, 'Exame3', '2013-01-01', 100, 2, 553810),
    (4, 'Exame4', '2013-04-02', 50, 3, 553810),
    (5, 'Exame5', '2013-02-07', 200, 1, 223810);

/*
exercicio2

SELECT descricao as Exames_Geraldo
FROM exames
where dt_exame LIKE '2013%' AND id_consulta = 1 OR id_consulta = 3;

exercicio3

SELECT espe.crm, med.nome
FROM medicos_especialidades as espe
LEFT JOIN medicos as med
    on espe.crm =consultas
exercicio4

SELECT crm as medico, count() as quant_exame
FROM exames
where dt_exame LIKE '2013%'
GROUP BY crm;

exercicio5

SELECT nome, sum(valor) as valor_total
FROM pacientes as pas 
JOIN consultas as con 
    on pas.cpf = con.cpf
    JOIN exames as ex
        on con.id_consulta = ex.id_consulta
GROUP BY nome;

exercicio6

SELECT nome
FROM pacientes as pas 
JOIN consultas as con 
    on pas.cpf = con.cpf
    JOIN exames as ex
        on con.crm = ex.crm
WHERE ex.crm = 223810
GROUP BY nome;

exercicio7

SELECT nome, count() as quant
FROM especialidades as espe
    JOIN medicos_especialidades as mees
        on espe.id_especialidade = mees.id_especialidade
        JOIN exames as ex 
            on mees.crm = ex.crm
GROUP BY nome;


exercicio8

SELECT *
FROM medicos
ORDER BY nome asc;

exercicio9

SELECT count() as quant_paci
FROM pacientes;

exercicio10

SELECT crm as medico
from consultas
where dt_consulta = '2013-08-10';

exercicio11

DELETE 
from medicos 
where crm = 223810;
*/