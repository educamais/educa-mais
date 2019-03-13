DROP DATABASE IF EXISTS educa_mais;

CREATE DATABASE educa_mais;
USE educa_mais;
ALTER DATABASE educa_mais CHARSET = UTF8 COLLATE = utf8_general_ci;

CREATE TABLE usuario(
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	senha VARCHAR(45) NOT NULL
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE turma(
	id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_turma VARCHAR(45) NOT NULL,
	professor INT NOT NULL,
	codigo_turma VARCHAR(10) NOT NULL,
	CONSTRAINT fk_professor_turma FOREIGN KEY (professor) REFERENCES usuario(id_usuario)
)CHARACTER SET utf8 COLLATE utf8_general_ci;


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
	CONSTRAINT fk_turma_atividade FOREIGN KEY (turma) REFERENCES turma(id_turma)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE aluno_turma(
	id_aluno_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	turma INT NOT NULL,
	CONSTRAINT fk_aluno_aluno_turma FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_turma_aluno_turma FOREIGN KEY (turma) REFERENCES turma(id_turma)
);

CREATE TABLE aluno_postagem(
	id_aluno_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	postagem INT NOT NULL,
	CONSTRAINT fk_aluno_aluno_postagem FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_postagem_aluno_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem)
);

CREATE TABLE aluno_nota(
	id_aluno_nota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	atividade INT NOT NULL,
	nota INT DEFAULT 0,
	CONSTRAINT fk_aluno_aluno_nota FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_atividade_aluno_nota FOREIGN KEY (atividade) REFERENCES atividade(id_atividade)
);

CREATE TABLE arquivo_postagem(
	id_arquivo_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	arquivo VARCHAR(100) NOT NULL,
	postagem INT NOT NULL,
	CONSTRAINT fk_postagem_arquivo_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem)
)CHARACTER SET utf8 COLLATE utf8_general_ci;
