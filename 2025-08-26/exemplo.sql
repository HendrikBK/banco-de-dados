CREATE TABLE curso (
	codcurso int,
	nomecurso varchar(50),
	primary key (codcurso)
);

CREATE TABLE aluno (
	codaluno int,
	nomealuno varchar(50),
	codcurso int,
	primary key (codaluno),
	foreign key (codcurso) references curso(codcurso));

INSERT INTO curso (
	codcurso, nomecurso
	) values (1,'Direito');

INSERT INTO curso (
	codcurso, nomecurso
	) values (2,'Medicina');

INSERT INTO aluno (
	codaluno, nomealuno, codcurso
) values (1, 'Maria', 1);

INSERT INTO aluno (
	codaluno, nomealuno, codcurso
) values (2, 'João', 2);




SELECT * FROM aluno, curso
	WHERE aluno.codcurso = curso.codcurso;