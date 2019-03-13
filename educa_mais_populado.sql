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

INSERT INTO usuario VALUES
(1, 'Gabriel Neves', 'Gabriel@gmail.com', '25F9E794323B453885F5181F1B624D0B'),
(2, 'Adriana Neves', 'Adriana@gmail.com', '25F9E794323B453885F5181F1B624D0B'),
(3, 'Alana Neves', 'Alana@gmail.com', '25F9E794323B453885F5181F1B624D0B'),
(4, 'Matheus Pedro', 'Matheus@gmail.com', '25F9E794323B453885F5181F1B624D0B'),
(5, 'Renata Cristiane', 'Renata@gmail.com', '25F9E794323B453885F5181F1B624D0B'),
(6, 'Natália Raquel', 'Natalia@gmail.com', '25F9E794323B453885F5181F1B624D0B');

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

INSERT INTO postagem VALUES
(1, 1, '1Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(2, 1, '2Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(3, 1, '3Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(4, 1, '4Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(5, 1, '5Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(6, 1, '6Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(7, 1, '7Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(8, 1, '8Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(9, 1, '9Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(10, 1, '10Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(11, 1, '11Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(12, 1, '12Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(13, 1, '13Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(14, 1, '14Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(15, 1, '15Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(16, 1, '16Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(17, 1, '17Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(18, 1, '18Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(19, 1, '19Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(20, 1, '20Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(21, 1, '21Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(22, 1, '22Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(23, 1, '23Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(24, 1, '24Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(25, 1, '25Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(26, 1, '26Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(27, 1, '27Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(28, 1, '28Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(29, 1, '29Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(30, 1, '30Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(31, 1, '31Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17'),
(32, 1, '32Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-01-17');

CREATE TABLE atividade(
	id_atividade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_atividade VARCHAR(45) NOT NULL,
	data_atividade DATE NOT NULL,
	turma INT NOT NULL,
	CONSTRAINT fk_turma_atividade FOREIGN KEY (turma) REFERENCES turma(id_turma)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO atividade VALUES
(1, 'Atividade 1', '2019-01-17', 1),
(2, 'Atividade 2', '2019-02-15', 1),
(3, 'Atividade 3', '2019-03-05', 1),
(4, 'Atividade 4', '2019-04-27', 1),
(5, 'Prova 1', '2019-06-03', 1),
(6, 'Atividade 5', '2019-07-09', 1),
(7, 'Trabalho 1', '2019-08-17', 1),
(8, 'Projeto', '2019-09-21', 1),
(9, 'Trabalho 2', '2019-10-17', 1),
(10, 'Prova 2', '2019-11-12', 1);

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

INSERT INTO aluno_postagem VALUES

(1,2,1),
(2,3,1),
(3,4,1),
(4,5,1),
(5,6,1),

(6,2,2),
(7,3,2),
(8,4,2),
(9,5,2),
(10,6,2),

(11,2,3),
(12,3,3),
(13,4,3),
(14,5,3),
(15,6,3),

(16,2,4),
(17,3,4),
(18,4,4),
(19,5,4),
(20,6,4),

(21,2,5),
(22,3,5),
(23,4,5),
(24,5,5),
(25,6,5),

(26,2,6),
(27,3,6),
(28,4,6),
(29,5,6),
(30,6,6),

(31,2,7),
(32,3,7),
(33,4,7),
(34,5,7),
(35,6,7),

(36,2,8),
(37,3,8),
(38,4,8),
(39,5,8),
(40,6,8),

(41,2,9),
(42,3,9),
(43,4,9),
(44,5,9),
(45,6,9),

(46,2,10),
(47,3,10),
(48,4,10),
(49,5,10),
(50,6,10),

(51,2,11),
(52,3,11),
(53,4,11),
(54,5,11),
(55,6,11),

(56,2,12),
(57,3,12),
(58,4,12),
(59,5,12),
(60,6,12),

(61,2,13),
(62,3,13),
(63,4,13),
(64,5,13),
(65,6,13),

(66,2,14),
(67,3,14),
(68,4,14),
(69,5,14),
(70,6,14),

(71,2,15),
(72,3,15),
(73,4,15),
(74,5,15),
(75,6,15),

(76,2,16),
(77,3,16),
(78,4,16),
(79,5,16),
(80,6,16),

(81,2,17),
(82,3,17),
(83,4,17),
(84,5,17),
(85,6,17),

(86,2,18),
(87,3,18),
(88,4,18),
(89,5,18),
(90,6,18),

(91,2,19),
(92,3,19),
(93,4,19),
(94,5,19),
(95,6,19),

(96,2,20),
(97,3,20),
(98,4,20),
(99,5,20),
(100,6,20),

(101,2,21),
(102,3,21),
(103,4,21),
(104,5,21),
(105,6,21),

(106,2,22),
(107,3,22),
(108,4,22),
(109,5,22),
(110,6,22),

(111,2,23),
(112,3,23),
(113,4,23),
(114,5,23),
(115,6,23),

(116,2,24),
(117,3,24),
(118,4,24),
(119,5,24),
(120,6,24),

(121,2,25),
(122,3,25),
(123,4,25),
(124,5,25),
(125,6,25),

(126,2,26),
(127,3,26),
(128,4,26),
(129,5,26),
(130,6,26),

(131,2,27),
(132,3,27),
(133,4,27),
(134,5,27),
(135,6,27),

(136,2,28),
(137,3,28),
(138,4,28),
(139,5,28),
(140,6,28),

(141,2,29),
(142,3,29),
(143,4,29),
(144,5,29),
(145,6,29),

(146,2,30),
(147,3,30),
(148,4,30),
(149,5,30),
(150,6,30),

(151,2,31),
(152,3,31),
(153,4,31),
(154,5,31),
(155,6,31),

(156,2,32),
(157,3,32),
(158,4,32),
(159,5,32),
(160,6,32);

CREATE TABLE aluno_nota(
	id_aluno_nota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	aluno INT NOT NULL,
	atividade INT NOT NULL,
	nota INT DEFAULT 0,
	CONSTRAINT fk_aluno_aluno_nota FOREIGN KEY (aluno) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_atividade_aluno_nota FOREIGN KEY (atividade) REFERENCES atividade(id_atividade)
);

INSERT INTO aluno_nota VALUES

(1,2,1,2),
(2,3,1,5),
(3,4,1,5),
(4,5,1,6),
(5,6,1,5),

(6,2,2,3),
(7,3,2,0),
(8,4,2,5),
(9,5,2,4),
(10,6,2,9),

(11,2,3,3),
(12,3,3,2),
(13,4,3,0),
(14,5,3,7),
(15,6,3,2),

(16,2,4,3),
(17,3,4,8),
(18,4,4,9),
(19,5,4,6),
(20,6,4,0),

(21,2,5,5),
(22,3,5,5),
(23,4,5,3),
(24,5,5,1),
(25,6,5,9),

(26,2,6,5),
(27,3,6,1),
(28,4,6,8),
(29,5,6,7),
(30,6,6,5),

(31,2,7,0),
(32,3,7,3),
(33,4,7,9),
(34,5,7,6),
(35,6,7,3),

(36,2,8,6),
(37,3,8,3),
(38,4,8,4),
(39,5,8,6),
(40,6,8,2),

(41,2,9,8),
(42,3,9,0),
(43,4,9,2),
(44,5,9,1),
(45,6,9,1),

(46,2,10,9),
(47,3,10,0),
(48,4,10,5),
(49,5,10,3),
(50,6,10,0);

CREATE TABLE arquivo_postagem(
	id_arquivo_postagem INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	arquivo VARCHAR(100) NOT NULL,
	postagem INT NOT NULL,
	CONSTRAINT fk_postagem_arquivo_postagem FOREIGN KEY (postagem) REFERENCES postagem(id_postagem)
)CHARACTER SET utf8 COLLATE utf8_general_ci;
