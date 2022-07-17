CREATE DATABASE banco_resilia;

USE banco_resilia;

CREATE TABLE cursos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(100)
  );
CREATE TABLE facilitadores (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
skills VARCHAR(50)
);
CREATE TABLE TURMAS (
id INT PRIMARY KEY AUTO_INCREMENT,
nomes VARCHAR (100),
numero INT,
cursos_id INT,
facilitadores_id INT,
FOREIGN KEY (cursos_id) REFERENCES cursos (id),
FOREIGN KEY (facilitadores_id) REFERENCES facilitadores (id) );

CREATE TABLE ALUNOS (
nome VARCHAR(100),
CPF VARCHAR(11) PRIMARY KEY,
IDADE INT,
turmas_id INT,
facilitadores_id INT,
FOREIGN KEY (turmas_id) REFERENCES TURMAS (id),
FOREIGN KEY (facilitadores_id) REFERENCES facilitadores (id));

CREATE TABLE entregas (
link VARCHAR(150),
modulo INT,
conceito VARCHAR(50),
alunos_cpf VARCHAR(11),
FOREIGN KEY (alunos_cpf) REFERENCES ALUNOS (CPF)
);

ALTER TABLE ALUNOS ADD email TEXT AFTER facilitadores_id;

DELETE FROM ALUNOS;

INSERT INTO ALUNOS (nome, CPF, IDADE, turmas_id, facilitadores_id, email)
VALUES ('Crysalis', '11111111111', 18,1,2,'crysalis@hotmail.com'),
('JOANA', '22222222222', 24,1,2,'joana@hotmail.com'),('JOELISON', '33333333333', 23,2,2,'joelison@hotmail.com'),('CONSTANCIA', '44444444444', 23,2,2,'Constancia@hotmail.com'),
('MARICREUZA', '55555555555', 22,1,2,'maricreuza@hotmail.com'),('ENZO', '66666666666', 23,2,2,'enzo@hotmail.com'),('MARIA EDUARDA', '77777777777', 24,1,2,'mariaeduarda@hotmail.com'),
('PESSEGO DO AZUL', '88888888888', 18,2,2,'PessegoAzul@hotmail.com'),('AMORA SILVA', '99999999999', 19,1,2,'amora@hotmail.com'),('BETERRABA ', '10110110111', 19,2,2,'beterraba@hotmail.com');


INSERT INTO entregas (modulo, conceito)
VALUES (18,'mais que pronto');  

DELETE FROM entregas WHERE modulo = 18;  

INSERT INTO facilitadores (nome, skills)
VALUES ('Leticia','SOFT'),('karlla', 'TECH');

INSERT INTO cursos (tipo)
VALUES ('DESENVOLVIMENTO WEB'),('DATA ANALITYCS');

INSERT INTO turmas (nomes, numero, cursos_id, facilitadores_id)
VALUES ('GERAÇÃO FUTURO',19,1,2);

INSERT INTO turmas (nomes, numero, cursos_id, facilitadores_id)
VALUES ('DATA ANALITYCS',18,2,2);

SELECT * FROM cursos;

SELECT * FROM entregas;

SELECT * FROM facilitadores;

SELECT * FROM turmas;

SELECT * FROM alunos;

INSERT INTO entregas (link, modulo, conceito, alunos_cpf)
VALUES 
('https://site.com.br',1,'Mais que pronto','11111111111'),
('https://site.com.br',1,'Mais que pronto','22222222222'),
('https://site.com.br',1,'pronto','33333333333'),
('https://site.com.br',1,'chegando lá','44444444444'),
('https://site.com.br',1,'pronto','55555555555'),
('https://site.com.br',1,'Mais que pronto','66666666666'),
('https://site.com.br',1,'Ainda não esta pronto','77777777777'),
('https://site.com.br',1,'pronto','88888888888'),
('https://site.com.br',1,'chegando lá','99999999999'),
('https://site.com.br',1,'Mais que pronto','10110110111');

SELECT * FROM entregas;

-- Query 1
SELECT * FROM entregas
	WHERE modulo = 1 AND conceito = 'Mais que pronto';
    
-- Query 2
SELECT turmas_id AS turma, COUNT(turmas_id) AS alunos_na_turma FROM alunos
	GROUP BY turmas_id;
    
-- Query 3
SELECT COUNT(conceito) AS quantidade_de_projetos FROM entregas
	WHERE conceito = 'Ainda não está pronto' OR conceito = 'chegando lá';

-- Query 4
SELECT turmas_id AS turma, nome AS Nome_dos_alunos FROM alunos
	INNER JOIN entregas ON alunos.cpf = entregas.alunos_cpf
    WHERE conceito = 'Mais que pronto';


