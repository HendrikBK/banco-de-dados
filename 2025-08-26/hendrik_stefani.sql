/* Dupla: Hendrik e Stéfani */

CREATE TABLE doença (
    coddoença int,
    nomdoença varchar(60),
    descrição_doença varchar(100),
    primary key (coddoença)
);

CREATE TABLE cidade (
    codcidade int,
    nome_cidade varchar(30),
    num_habitantes int,
    primary key (codcidade)
);

CREATE TABLE relação (
    ano int,
    num_óbitos int,
    num_casos_cidade_doença int,
    coddoença int,
    codcidade int,
    primary key (ano),
    foreign key (coddoença) references doença(coddoença),
    foreign key (codcidade) references cidade(codcidade)
);