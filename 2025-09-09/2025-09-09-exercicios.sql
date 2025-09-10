-- Tenistas


CREATE TABLE PAIS
	(codpais int,
	nompais varchar (50),
	PRIMARY KEY (codpais));

CREATE TABLE CIDADE
	(codcidade int,
	nomcidade varchar (50),
	codpais int,
	PRIMARY KEY (codcidade),
	FOREIGN KEY (codpais) REFERENCES PAIS (codpais));

CREATE TABLE TORNEIO
	(codtorneio int,
	nomtorneio varchar (50),
	codcidade int,
	PRIMARY KEY (codtorneio),
	FOREIGN KEY (codcidade) REFERENCES CIDADE (codcidade));

CREATE TABLE TENISTA
	(codtenista int,
	nomtenista varchar (50), 
	datanascimento date,
	codpais int,
	PRIMARY KEY (codtenista),
	FOREIGN KEY (codpais) REFERENCES PAIS (codpais));

CREATE TABLE TORNEIO_TEM_TENISTA 
	(codtorneio int,
	codtenista int,
	ano int,
	classificacao int,
	PRIMARY KEY (ano,codtenista,codtorneio),
	FOREIGN KEY (codtenista) REFERENCES TENISTA (codtenista),
	FOREIGN KEY (codtorneio) REFERENCES TORNEIO (codtorneio));

CREATE TABLE PATROCINADOR
	(codpatro int,
	nompatro varchar (50),
	PRIMARY KEY (codpatro));

CREATE TABLE TENISTA_TEM_PATROCINADOR
	(codpatro int,
	codtenista int,
	PRIMARY KEY (codpatro,codtenista),
	FOREIGN KEY (codpatro) REFERENCES PATROCINADOR (codpatro),
	FOREIGN KEY (codtenista) REFERENCES TENISTA (codtenista));


-- Países
INSERT INTO PAIS (codpais, nompais) VALUES
(1, 'Brasil'),
(2, 'Espanha'),
(3, 'Estados Unidos');

-- Cidades
INSERT INTO CIDADE (codcidade, nomcidade, codpais) VALUES
(1, 'São Paulo', 1),
(2, 'Rio de Janeiro', 1),
(3, 'Madrid', 2),
(4, 'Nova York', 3);

-- Torneios
INSERT INTO TORNEIO (codtorneio, nomtorneio, codcidade) VALUES
(1, 'Aberto de São Paulo', 1),
(2, 'Copa Rio', 2),
(3, 'Masters Madrid', 3),
(4, 'US Open', 4);

-- Tenistas
INSERT INTO TENISTA (codtenista, nomtenista, datanascimento, codpais) VALUES
(1, 'Rafael Nadal', '1986-06-03', 2),
(2, 'Gustavo Kuerten', '1976-09-10', 1),
(3, 'Serena Williams', '1981-09-26', 3),
(4, 'Rogerio Silva', '1990-05-14', 1);

-- Participação de Tenistas em Torneios
INSERT INTO TORNEIO_TEM_TENISTA (codtorneio, codtenista, ano, classificacao) VALUES
(1, 2, 2000, 1),   -- Guga campeão em SP
(2, 2, 2001, 2),   -- Guga vice no Rio
(3, 1, 2010, 1),   -- Nadal campeão em Madrid
(4, 3, 2012, 1),   -- Serena campeã no US Open
(4, 1, 2012, 2),   -- Nadal vice no US Open
(1, 4, 2018, 3);   -- Rogerio semifinalista em SP

-- Patrocinadores
INSERT INTO PATROCINADOR (codpatro, nompatro) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Wilson'),
(4, 'Head');

-- Relação Tenista-Patrocinador
INSERT INTO TENISTA_TEM_PATROCINADOR (codpatro, codtenista) VALUES
(1, 1),  -- Nadal - Nike
(2, 2),  -- Guga - Adidas
(3, 3),  -- Serena - Wilson
(1, 4),  -- Rogerio - Nike
(4, 1);  -- Nadal também patrocinado pela Head


--1 Listar os nomes dos tenistas com os nomes dos seus países

SELECT nomtenista, nompais FROM TENISTA, PAIS
    WHERE TENISTA.codpais = PAIS.codpais;


--2 Listar os nomes dos tenistas com os nomes dos seus patrocinadores

SELECT nomtenista, nompatro FROM TENISTA, PATROCINADOR, TENISTA_TEM_PATROCINADOR
    WHERE TENISTA.codtenista = TENISTA_TEM_PATROCINADOR.codtenista AND TENISTA_TEM_PATROCINADOR.codpatro = PATROCINADOR.codpatro;

--3 Listar quantos patrocinadores possui o tenista de código 1

SELECT nomtenista, COUNT(codpatro) FROM TENISTA, TENISTA_TEM_PATROCINADOR
    WHERE TENISTA_TEM_PATROCINADOR.codtenista = 1 AND TENISTA.codtenista = 1
    GROUP BY(nomtenista);

--4 Listar os nomes dos patroninadores do tenista Gustavo Kuerten

SELECT nompatro FROM PATROCINADOR, TENISTA_TEM_PATROCINADOR
    WHERE TENISTA_TEM_PATROCINADOR.codtenista = 2 AND PATROCINADOR.codpatro = TENISTA_TEM_PATROCINADOR.codpatro;

--5 Listar os nomes dos tenistas com os nomes dos torneios disputados por cada tenista

SELECT nomtenista, nomtorneio FROM TENISTA, TORNEIO, TORNEIO_TEM_TENISTA
    WHERE TORNEIO_TEM_TENISTA.codtenista = TENISTA.codtenista AND TORNEIO_TEM_TENISTA.codtorneio = TORNEIO.codtorneio;

--6 Listar quantos torneios foram disputados pelo tenista Gustavo Kuerten

SELECT nomtenista, COUNT(codtorneio) FROM TENISTA, TORNEIO_TEM_TENISTA
    WHERE TENISTA.codtenista = 2 AND TORNEIO_TEM_TENISTA.codtenista = 2
    GROUP BY(nomtenista);

--7 Listar os nomes dos torneios vencidos pelo tenista Gustavo Kuerten

SELECT nomtorneio FROM TORNEIO, TORNEIO_TEM_TENISTA, TENISTA
    WHERE TORNEIO.codtorneio = TORNEIO_TEM_TENISTA.codtorneio AND TORNEIO_TEM_TENISTA.codtenista = TENISTA.codtenista AND TENISTA.nomtenista = 'Gustavo Kuerten' AND TORNEIO_TEM_TENISTA.classificacao = 1;

--8 Listar os nomes dos tenistas patrocinados pela Nike 

SELECT nomtenista FROM TENISTA, TENISTA_TEM_PATROCINADOR, PATROCINADOR
    WHERE TENISTA.codtenista = TENISTA_TEM_PATROCINADOR.codtenista AND TENISTA_TEM_PATROCINADOR.codpatro = PATROCINADOR.codpatro AND TENISTA_TEM_PATROCINADOR.codpatro = 1;

--9 Listar quantos patrocinadores tem o tenista Rafael Nadal

SELECT nomtenista, COUNT(codpatro) FROM TENISTA, TENISTA_TEM_PATROCINADOR
    WHERE TENISTA.nomtenista = 'Rafael Nadal' AND TENISTA_TEM_PATROCINADOR.codtenista = TENISTA.codtenista
    GROUP BY(nomtenista);

--10 Listar os nomes dos tenistas, com os nomes dos seus países, 
--  nomes dos seus patrocinadores e nomes dos torneios dispisputados por cada tenista

SELECT nomtenista, nompais, nompatro, nomtorneio FROM TENISTA, PAIS, PATROCINADOR, TORNEIO, TORNEIO_TEM_TENISTA, TENISTA_TEM_PATROCINADOR
    WHERE
        TENISTA.codtenista = TENISTA_TEM_PATROCINADOR.codtenista AND TENISTA_TEM_PATROCINADOR.codpatro = PATROCINADOR.codpatro AND
        TENISTA.codtenista = TORNEIO_TEM_TENISTA.codtenista AND TORNEIO_TEM_TENISTA.codtorneio = TORNEIO.codtorneio AND
        TENISTA.codpais = PAIS.codpais;


