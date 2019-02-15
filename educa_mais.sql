CREATE DATABASE educa_mais;
USE educa_mais;
ALTER DATABASE educa_mais CHARSET = UTF8 COLLATE = utf8_general_ci;

CREATE TABLE usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	senha VARCHAR(16) NOT NULL
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO usuario VALUES
(1, 'Gabriel Neves', 'Gabriel@gmail.com', '123456789'),
(2, 'Adriana Neves', 'Adriana@gmail.com', '123456789'),
(3, 'Alana Neves', 'Alana@gmail.com', '123456789'),
(4, 'Matheus Pedro', 'Matheus@gmail.com', '123456789'),
(5, 'Renata Cristiane', 'Renata@gmail.com', '123456789'),
(6, 'Natália Raquel', 'Natalia@gmail.com', '123456789');

CREATE TABLE turma(
	id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_turma VARCHAR(45) NOT NULL,
	professor INT NOT NULL,
	codigo_turma VARCHAR(10) NOT NULL,
	CONSTRAINT fk_professor_turma FOREIGN KEY (professor) REFERENCES usuario(id_usuario)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO turma VALUES
(1, 'Turma Matemática', 1, 'b266e83c'),
(2, 'Turma Geografia', 1, 'f61f0703'),
(3, 'Turma Ciência', 2, '372b1cc6'),
(4, 'Turma Português', 2, '3fea5ef6'),
(5, 'Turma História', 3, 'bca4229a'),
(6, 'Turma Química', 3, 'b8fad962');

CREATE TABLE postagem(
	id_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	turma INT NOT NULL,
	titulo_postagem VARCHAR(45) NOT NULL,
	descricao_postagem VARCHAR(500) NOT NULL,
	data_postagem DATE NOT NULL,
	CONSTRAINT fk_turma_postagem FOREIGN KEY (turma) REFERENCES turma(id_turma)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE atividade(
	id_atividade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_atividade VARCHAR(45) NOT NULL,
	data_atividade DATE NOT NULL,
	turma INT NOT NULL,
	nota FLOAT NOT NULL
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE aluno_turma(
	id_aluno_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	turma INT NOT NULL,
	CONSTRAINT fk_aluno_aluno_turma FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_turma_aluno_turma FOREIGN KEY (turma) REFERENCES turma(id_turma)
);

INSERT INTO aluno_turma VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 2, 2),
(7, 3, 2),
(8, 4, 2),
(9, 5, 2),
(10, 6, 2),
(11, 1, 3),
(12, 3, 3),
(13, 4, 3);

CREATE TABLE aluno_postagem(
	id_aluno_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	postagem INT NOT NULL,
	CONSTRAINT fk_aluno_aluno_postagem FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_postagem_aluno_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem)
);

CREATE TABLE aluno_atividade(
	id_aluno_atividade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	atividade INT NOT NULL,
	CONSTRAINT fk_aluno_aluno_atividade FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_atividade_aluno_atividade FOREIGN KEY (atividade) REFERENCES atividade(id_atividade)
);

CREATE TABLE arquivo_postagem(
	id_arquivo_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	arquivo VARCHAR(100) NOT NULL,
	postagem INT NOT NULL,
	CONSTRAINT fk_postagem_arquivo_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem)
)CHARACTER SET utf8 COLLATE utf8_general_ci;