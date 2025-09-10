create table cidade  
(codcid int,
nomcid varchar(50),
website varchar(200),
numhabitantes int,
primary key (codcid));

insert into cidade (codcid,nomcid) values (1,'Camaqua');

insert into cidade (codcid,nomcid) values (2,'Jaguarao');

insert into cidade (codcid,nomcid) values (3,'Herval');


create table especialidade
(codesp int,
nomesp varchar(50),
descesp varchar(200),
primary key (codesp));

insert into especialidade (codesp,nomesp) values (1,'Cozinha Italiana');
insert into especialidade (codesp,nomesp) values (2,'Cozinha Jamaicana');
insert into especialidade (codesp,nomesp) values (3,'Cozinha Uruguaia');

create table restaurante 
(codres int,
nomres varchar(50),
email varchar(200),
endereco varchar(100),
fone int,
codcid int,
primary key(codres),
foreign key (codcid) references cidade(codcid));

insert into restaurante (codres, nomres,codcid) values (1,'R. da Nona',2);
insert into restaurante (codres, nomres,codcid) values (2,'R. da Abuela',2);
insert into restaurante (codres, nomres,codcid) values (3,'R. do Nono',1);
insert into restaurante (codres, nomres,codcid) values (4,'R. do Dindo',1);
insert into restaurante (codres, nomres,codcid) values (5,'R. da Dinda',3);


create table restaurante_especialidade
(codesp int,
codres int,
primary key (codesp, codres),
foreign key (codesp) references especialidade (codesp),
foreign key (codres) references restaurante (codres));


insert into restaurante_especialidade(codesp,codres) values (1,3);
insert into restaurante_especialidade(codesp,codres) values (1,1);
insert into restaurante_especialidade(codesp,codres) values (1,2);
insert into restaurante_especialidade(codesp,codres) values (2,3);
insert into restaurante_especialidade(codesp,codres) values (3,3);
insert into restaurante_especialidade(codesp,codres) values (2,2);
insert into restaurante_especialidade(codesp,codres) values (2,1);
insert into restaurante_especialidade(codesp,codres) values (1,4);

-- 1) Listar os nomes dos restaurantes

SELECT nomres FROM restaurante;

-- 2) Listar os nomes dos restaurantes com os nomes das cidades onde eles estão localizados

SELECT nomres, nomcid FROM restaurante, cidade
    WHERE restaurante.codcid = cidade.codcid;

-- 3) Listar os nomes dos restaurantes que são da cidade denominada Herval (SQL)

SELECT nomres FROM restaurante, cidade
    WHERE restaurante.codcid = cidade.codcid AND cidade.nomcid = 'Herval';

-- 4) Listar os nomes dos restaurantes com os nomes de suas especialidades

SELECT nomres, nomesp FROM restaurante, especialidade, restaurante_especialidade
    WHERE especialidade.codesp = restaurante_especialidade.codesp AND restaurante_especialidade.codres = restaurante.codres;

-- 5) Listar os nomes dos restaurantes especializados em Cozinha Italiana (SQL)

SELECT nomres FROM restaurante, especialidade, restaurante_especialidade
    WHERE especialidade.nomesp = 'Cozinha Italiana' AND especialidade.codesp = restaurante_especialidade.codesp AND restaurante.codres = restaurante_especialidade.codres;

-- 6) Listar os nomes dos dos restaurantes com os nomes de suas especialidades e com os
-- nomes das cidades onde eles estão localizados (SQL)

SELECT nomres, nomcid, nomesp FROM restaurante, cidade, restaurante_especialidade, especialidade
    WHERE restaurante.codcid = cidade.codcid AND restaurante.codres = restaurante_especialidade.codres AND restaurante_especialidade.codesp = especialidade.codesp
	ORDER BY(nomcid);

-- 7) Listar quantos restaurantes estão cadastrados (SQL)

SELECT COUNT(codres) FROM restaurante
GROUP BY(codres);

-- 8) Listar quantos restaurantes especializados em Cozinha Italiana

SELECT nomesp, COUNT(restaurante.codres) FROM restaurante, restaurante_especialidade, especialidade
    WHERE especialidade.nomesp = 'Cozinha Italiana' AND especialidade.codesp = restaurante_especialidade.codesp AND restaurante_especialidade.codres = restaurante.codres
    GROUP BY(nomesp);