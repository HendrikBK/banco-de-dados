CREATE TABLE UNIDADE (codunidade int,
					  nomunidade varchar(50),
					  email varchar(255),
					  telefone int,
					  PRIMARY KEY (codunidade));

CREATE TABLE CURSO (codcurso int,
					nomcurso varchar(50),
					data_criacao date,
					codunidade int,
					PRIMARY KEY (codcurso),
					FOREIGN KEY (codunidade) REFERENCES UNIDADE (codunidade));


CREATE TABLE ALUNO 	(codaluno int,
					nomaluno varchar(50),
					data_nascimento date,
					email varchar(255),
					codcurso int,
					PRIMARY KEY (codaluno),
					FOREIGN KEY (codcurso) REFERENCES CURSO (codcurso));

CREATE TABLE DISCIPLINA (coddisci int,
			nomdisci varchar(50),
			PRIMARY KEY (coddisci));

CREATE TABLE HISTORICO (semestre int,
			coddisci int,
			codaluno int,
			nota numeric (5,2),
			PRIMARY KEY (semestre, coddisci, codaluno),
			FOREIGN KEY (codaluno) REFERENCES ALUNO (codaluno),
			FOREIGN KEY (coddisci) REFERENCES DISCIPLINA (coddisci));

			


					 
INSERT INTO UNIDADE (codunidade, nomunidade, email, telefone)
VALUES
    (1, 'Unidade A', 'unidade_a@email.com', 123456789),
    (2, 'Unidade B', 'unidade_b@email.com', 987654321),
    (3, 'Unidade C', 'unidade_c@email.com', 555555555);


INSERT INTO CURSO (codcurso, nomcurso, data_criacao, codunidade)
VALUES
    (101, 'Curso 1', '2024-01-01', 1),
    (102, 'Curso 2', '2024-02-01', 1),
    (103, 'Curso 3', '2024-03-01', 2),
    (104, 'Curso 4', '2024-04-01', 2),
    (105, 'Curso 5', '2024-05-01', 3),
    (106, 'Curso 6', '2024-06-01', 3);

INSERT INTO ALUNO (codaluno, nomaluno, data_nascimento, email, codcurso)
VALUES
    (1, 'Aluno 1', '2000-01-01', 'aluno1@email.com', 101),
    (2, 'Aluno 2', '2000-02-01', 'aluno2@email.com', 101),
    (3, 'Aluno 3', '2000-03-01', 'aluno3@email.com', 101),
    (4, 'Aluno 4', '2000-04-01', 'aluno4@email.com', 102),
    (5, 'Aluno 5', '2000-05-01', 'aluno5@email.com', 102),
    (6, 'Aluno 6', '2000-06-01', 'aluno6@email.com', 102),
    (7, 'Aluno 7', '2000-07-01', 'aluno7@email.com', 103),
    (8, 'Aluno 8', '2000-08-01', 'aluno8@email.com', 103),
    (9, 'Aluno 9', '2000-09-01', 'aluno9@email.com', 103),
    (10, 'Aluno 10', '2000-10-01', 'aluno10@email.com', 104),
    (11, 'Aluno 11', '2000-11-01', 'aluno11@email.com', 104),
    (12, 'Aluno 12', '2000-12-01', 'aluno12@email.com', 104),
    (13, 'Aluno 13', '2001-01-01', 'aluno13@email.com', 105),
    (14, 'Aluno 14', '2001-02-01', 'aluno14@email.com', 105),
    (15, 'Aluno 15', '2001-03-01', 'aluno15@email.com', 105),
    (16, 'Aluno 16', '2001-04-01', 'aluno16@email.com', 106),
    (17, 'Aluno 17', '2001-05-01', 'aluno17@email.com', 106),
    (18, 'Aluno 18', '2001-06-01', 'aluno18@email.com', 106),
    (19, 'Aluno 19', '2001-07-01', 'aluno19@email.com', 106),
    (20, 'Aluno 20', '2001-08-01', 'aluno20@email.com', 106);



INSERT INTO DISCIPLINA (coddisci, nomdisci) VALUES
(1, 'Disciplina 1'),
(2, 'Disciplina 2'),
(3, 'Disciplina 3');

INSERT INTO HISTORICO (semestre, coddisci, codaluno, nota) VALUES
(20241, 1, 1, 7.9),
(20241, 2, 1, 8.5),
(20241, 3, 2, 6.7),
(20241, 1, 2, 9.0),
(20241, 2, 3, 5.5),
(20242, 3, 1, 7.0),
(20242, 2, 2, 8.3);


-- Rode as instruções SQL (no PG_Admin ou SQL online)

-- Após, execute as seguintes operações usando SQL

--1) Listar os nomes dos alunos

--2) Listar o código e os nomes dos cursos

--3) Listar quantos cursos são da unidade que tem o código 2

--4) Listar os nomes das unidades com os nomes dos cursos

--5) Listar os nomes dos cursos com os nomes dos alunos

--6) Listar os nomes das unidades, com os nomes dos cursos e os nomes dos alunos dos cursos

--7) Usando SQL, faça a inclusão de um aluno.

--Dados do aluno a ser incluído:
--Código: 1
--Nome: Fulano de Tal
--Data de nascimento: 11/11/1956
--Email: fulano@gmail.com
--O aluno deve estar vinculado ao Curso 5

--8) Listar os nomes dos alunos com os nomes das disciplinas que fizeram, o semestre em que cursaram cada disciplina e a nota que tiraram

--9) Listar a média das notas da disciplina 1 no semestre 20242