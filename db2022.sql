/*
.headers on
.mode column
PRAGMA foreign_keys = on;
*/
drop table if exists clientes;
drop table if exists fones_clientes;
drop table if EXISTS funcionarios;
drop table if EXISTS ordem_servico;
drop table if EXISTS vendas;
drop table if EXISTS contas_receber;
drop table if EXISTS itens;
drop table if EXISTS vendas_itens;
drop TABLE if EXISTS ordens_itens;
drop TABLE if EXISTS fornecedores;
drop TABLE if EXISTS compras;
drop TABLE IF EXISTS despesas;
drop TABLE if EXISTS compras_itens;
drop TABLE if EXISTS contas_pagar;



create table clientes(
    cod serial AUTO INCREMENT,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    tipo_cliente char(1) not null CHECK(tipo_cliente='F' OR tipo_cliente='J'),
    rg char(10),
    cpf char(11),
    cnpj char(14),
    obs text,
    primary key (cod)
);


INSERT INTO clientes (nome, endereco, tipo_cliente, rg, cpf, cnpj, obs) VALUES
    ('André', 'Av Brasil, 123', 'J', '1234567890', '12345678900', '12345657000123', NULL),
    ('Andressa', 'Av Uruguay, 456', 'F', '0987654321', '00987654321', NULL, NULL),
    ('Bernado', 'Av Bolivia, 789', 'J', '1565488852', '95546821678', NULL, 'não quis informar o cnpj'),
    ('Brenda', 'Av Paraguay, 159', 'F', '2589463781', '15475786443', '15348895836415', NULL),
    ('Carlos', 'Av Dinamarca, 753', 'J', '2502354781', '15458631643', '15325631536415', NULL),
    ('Coraline', 'Av Mexico, 953', 'F', '1659876786', '65482286443', '89654125836415', NULL),
    ('Dennis', 'Av Peru, 745', 'J', '1586463752', '15875786158', '15649841546414', NULL),
    ('Daniela', 'Av Chile, 964', 'F', NULL, NULL, NULL, NULL),
    ('Endriw', 'Av Guiana, 1235', 'J', '8689463158', NULL, '85648895831598', NULL),
    ('Eduarda', 'Av Equador, 125', 'F', '0236446258', '35126845960', '02135895831632', NULL),
    ('Fabricio', 'Av Colombia, 635', 'J', '6253512641', '15894475684', '58499656668954', NULL),
    ('Fabiane', 'Av Venezuela 135', 'F', '1889844886', '55557889645', '45486798746798', NULL),
    ('Gabriel', 'Av Argentina, 2546', 'J', '3568498928', '12364584654', '3219879843216', NULL),
    ('Gigele', 'Av Suriname, 717', 'F', '2658468274', NULL, NULL, NULL);


create table fones_clientes(
    num_telefone char(10),
    cod int not null,
    primary key (num_telefone, cod),
    FOREIGN key (cod) REFERENCES clientes(cod)
);


INSERT INTO fones_clientes (num_telefone, cod) VALUES
    ('5554148562', 1),
    ('5398764187', 1),
    ('4598721324',2),
    ('1789874656',2),
    ('1459847653',3),
    ('8546479794',4),
    ('1247898947',5),
    ('4564987465',6),
    ('0045133146',7),
    ('5603216505',8),
    ('1316540486',8),
    ('5474751212',9),
    ('2154079874',10),
    ('0216541587',10),
    ('1547810775',11),
    ('1127889878',12),
    ('4654987654',13),
    ('5658742546',14),
    ('1054782104',14);


create table funcionarios(
    cod_fun serial AUTO INCREMENT,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    cpf char(11) UNIQUE not null,
    tipo char(1) CHECK(tipo='1:vendedor' OR tipo='2:gerente' OR tipo='3:tecnico'),
    primary key (cod_fun)
);


INSERT INTO funcionarios (nome, endereco, cpf, tipo) VALUES
    ('Henrique','Rua Rio Grande, 156','15986526841','1:vendedor'),
    ('Helena', 'Rua Espirito Santo, 456', '13654874488', '2:gerente'),
    ('Ismael', 'Rua Paraná, 65', '12345685265', '3:tecnico'),
    ('Ingrid', 'Rua Santa Catarina, 16', '45823596481', '1:vendedor'),
    ('Julian', 'Rua Mato Grosso, 156', '02158436575', '3:tecnico'),
    ('Julieta', 'Rua Brasilia, 520', '02635485488', '1:vendedor'),
    ('Kaua', 'Rua Paraiba, 658', '56324541562', '3:tecnico'),
    ('Karina', 'Rua Rondonia, 102', '32150684420', '1:vendedor');


CREATE TABLE ordem_servico(
    num serial not null,
    data date not null,
    valor_total numeric(10, 2) not null,
    status char(1) not null CHECK (status='A' OR status='F'),
    cod_fun int not null,
    cod int not null,
    primary key (num),
    FOREIGN key (cod_fun) REFERENCES funcionarios(cod_fun),
    FOREIGN key (cod) REFERENCES clientes(cod)
);


INSERT INTO ordem_servico (data, valor_total, status, cod_fun, cod) VALUES
    ('2022-02-15', 15.50, 'F', 1, 1),
    ('2022-03-10', 30.00, 'A', 1, 2),
    ('2022-01-20', 60.00, 'F', 1, 3),
    ('2022-01-25', 24.50, 'F', 1, 4),
    ('2022-03-30', 51.50, 'F', 4, 5),
    ('2022-05-16', 25.50, 'A', 4, 6),
    ('2022-06-15', 18.00, 'A', 4, 7),
    ('2022-07-02', 16.00, 'A', 6, 8),
    ('2022-08-21', 100.00, 'A', 6, 9),
    ('2022-02-08', 84.50, 'F', 6, 10),
    ('2022-04-01', 26.50, 'F', 8, 11),
    ('2022-05-26', 72.00, 'F', 8, 12),
    ('2022-06-05', 64.00, 'A', 8, 13),
    ('2022-07-10', 45.50, 'A', 8, 14),
    ('2022-01-28', 12.00, 'F', 6, 1);


create table vendas(
    cod_vendas int not null,
    valor_total_venda numehospitalric(10, 2) not null,
    dt_venda datetime not null,
    cod_fun int,
    cod int,
    cod_os int,
    primary key (cod_vendas),
    FOREIGN key (cod_fun) REFERENCES funcionarios(cod_fun),
    FOREIGN key (cod) REFERENCES clientes(cod),
    FOREIGN key (cod_os) REFERENCES ordem_servico(cod_os)
);


create table itens(
    cod_itens serial AUTO INCREMENT,
    valor numeric(10, 2) not null,
    custo numeric(10, 2) not null,
    descricao varchar(100),
    desconto numeric(4, 2),
    tipo char(1) not null CHECK(tipo='P' OR tipo='S'),
    estoque int,
    primary key (cod_itens)
);


create table contas_receber(
    cod_cr serial AUTO INCREMENTl,
    data_lancamento date not null,
    data_vencimento date not null,
    valor numeric (10, 2) not null,
    data_pagamento date not null,
    valor_pagamento numeric (10, 2),
    cod_vendas int not null,
    primary key (cod_cr),
    FOREIGN key (cod_vendas) REFERENCES vendas(cod_vendas)
);


create table vendas_itens(
    sequencial serial AUTO INCREMENT,
    quant real not null,
    valor numeric(10, 2) not null,
    cod_vendas int not null,
    cod_itens int not null,
    PRIMARY key (sequencial, cod_vendas),
    FOREIGN key (cod_vendas) REFERENCES vendas(cod_vendas),
    FOREIGN key (cod_itens) REFERENCES itens(cod_itens)
);


CREATE TABLE ordens_itens(
    sequencial serial AUTO INCREMENT,
    desconto numeric(4, 2) not null,
    cod_os int not null,
    cod_itens int not null,
    PRIMARY key (sequencial),
    FOREIGN key (cod_os) REFERENCES ordem_servico(cod_os),
    FOREIGN key (cod_itens) REFERENCES itens(cod_itens)
);


CREATE TABLE fornecedores(
    cod_fnc serial AUTO INCREMENT,
    descricao varchar(100),
    endereco varchar(50),
    contato varchar(50),
    CNPJ varchar(14) UNIQUE,
    PRIMARY key (cod_fnc)
);


CREATE TABLE compras(
    cod_com serial AUTO INCREMENT,
    data date not null,
    valor_total numeric(10, 2) not null,
    numero_nota int not null,
    cod_fnc int not null,
    PRIMARY key (cod_com),
    FOREIGN key (cod_fnc) REFERENCES fornecedores(cod_fnc)
);


CREATE TABLE despesas(
    cod_des serial AUTO INCREMENTl,
    descricao varchar(50) not null,
    PRIMARY key (cod_des)
);


CREATE TABLE compras_itens(
    sequencial serial AUTO INCREMENT,
    desconto numeric(4, 2) not null,
    quant real not null,
    valor numeric(10, 2) not null,
    valor_total numeric(10, 2) not null,
    cod_com int not null,
    cod_itens int not null,
    primary key (sequencial),
    FOREIGN key (cod_com) REFERENCES compras(cod_com),
    FOREIGN key (cod_itens) REFERENCES itens(cod_itens)
);


CREATE TABLE contas_pagar(
    numero serial AUTO INCREMENT,
    num_boleto varchar(30),
    tipo int not null CHECK(tipo='1' OR tipo='2'),
    data_venc date not null,
    dt_pgmto date not null,
    valor_pago numeric(10, 2) not null,
    valor numeric(10, 2) not null,
    data_lancamento date not null,
    desconto numeric(4, 2) not null,
    cod_com int not null,
    cod_des int not null,
    primary key (numero),
    FOREIGN key (cod_com) REFERENCES compras(cod_com),
    FOREIGN key (cod_des) REFERENCES despesas(cod_des)
);
