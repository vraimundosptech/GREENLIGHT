/* 
Gabriella Kailainy das Chagas Maris
Giovanna Beraldo Vieira
Guilherme Rodrigues Padovan Perez
Pedro Duarte Reis
Vinicius Alves Barrero
Vitor Machado Raimundo
*/

CREATE DATABASE greenlight;
USE greenlight;

CREATE TABLE empresa (
idEmpresa	INT				PRIMARY KEY		AUTO_INCREMENT,
nome		VARCHAR(50)		NOT NULL,	
CNPJ		VARCHAR(14)		NOT NULL,
email		VARCHAR(50)		NOT NULL,
senha		VARCHAR(20)		NOT NULL,
UF			CHAR(2)			NOT NULL,
cidade		VARCHAR(30)		NOT NULL,
Rua			VARCHAR(30)		NOT NULL,
numero		VARCHAR(4), 
dtCadastro	DATETIME		DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE estufa (
idEstufa		INT			PRIMARY KEY		AUTO_INCREMENT,
idEmpresa		INT,
nomenclatura	VARCHAR(10),
capacidade		INT
);

CREATE TABLE usuario (
    idUsuario 	INT AUTO_INCREMENT PRIMARY KEY,
    idEmpresa	INT,
    nome		VARCHAR(50) NOT NULL,
    email 		VARCHAR(50),
    senha 		VARCHAR(20),
    dtCadastro 	DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hortalica (
    idHortalica 	INT AUTO_INCREMENT PRIMARY KEY,
    idEstufa		INT,
    nome 			VARCHAR(50) NOT NULL,
    luminosidadeMin INT,
    luminosidadeMax INT,
    descricao 		VARCHAR(100)
);

CREATE TABLE registroLuminosidade (
    idDado 			INT AUTO_INCREMENT PRIMARY KEY,
    luminosidade 	INT NOT NULL,
    dataLeitura 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    idHortalica 	INT,
    idUsuario 		INT
);

CREATE TABLE producao (
    idProducao INT AUTO_INCREMENT PRIMARY KEY,
    idHortalica INT,
    quantidadeProduzida INT NOT NULL,
    quantidadePerdida INT NOT NULL,
    dtProducao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE financeiro (
    idFinanceiro INT AUTO_INCREMENT PRIMARY KEY,
    idHortalica INT,
    custoProducao DECIMAL(10,2) NOT NULL,
    precoVenda DECIMAL(10,2) NOT NULL,
    dtReferencia DATE NOT NULL
);

INSERT INTO empresa (nome, CNPJ, email, senha, UF, cidade, Rua, numero) VALUES
('Horta Verde LTDA', '12345678000101', 'contato@hortaverde.com', '123', 'SP', 'São Bernardo do Campo', 'Rua das Flores', '120'),
('Cultivo Solar ME', '98765432000155', 'financeiro@cultivosolar.com', '123', 'MG', 'Uberlândia', 'Av. do Agricultor', '450'),
('Estufas Primavera', '45678912000199', 'admin@primavera.com', '123', 'PR', 'Londrina', 'Rua Verde Vida', '89'),
('AgroLuz Tecnologia', '74125896000133', 'contato@agroluz.com', '123', 'SP', 'Campinas', 'Rua do Campo', '300'),
('Vida Verde Hidroponia', '85236974000177', 'suporte@vidaverde.com', '123', 'RS', 'Caxias do Sul', 'Av. das Hortas', '1020');

INSERT INTO estufa (idEmpresa, nomenclatura, capacidade) VALUES
(1, 'E1-A', 500),
(1, 'E1-B', 750),
(2, 'E2-A', 600),
(2, 'E2-B', 900),
(3, 'E3-A', 400),
(3, 'E3-B', 650),
(4, 'E4-A', 550),
(4, 'E4-B', 800),
(5, 'E5-A', 450),
(5, 'E5-B', 700);

INSERT INTO usuario (idEmpresa, nome, email, senha) VALUES
(1, 'João Silva', 'joao@email.com', '123'),
(2, 'Maria Souza', 'maria@email.com', '123'),
(3, 'Lucas Ferreira', 'lucas@email.com', '123'),
(4, 'Ana Costa', 'ana@email.com', '123'),
(5, 'Carlos Mendes', 'carlos@email.com', '123');

INSERT INTO hortalica (idEstufa, nome, luminosidadeMin, luminosidadeMax, descricao) VALUES
(1, 'Alface', 12000, 20000, 'Hortaliça sensível ao excesso de luz e temperatura'),
(2, 'Espinafre', 11000, 19000, 'Prefere clima mais ameno'),
(3, 'Couve', 13000, 22000, 'Alta resistência ao sol'),
(4, 'Agrião', 9000, 17000, 'Necessita boa hidratação'),
(5, 'Manjericão', 15000, 25000, 'Precisa de bastante luz');

INSERT INTO registroLuminosidade (luminosidade, idHortalica, idUsuario) VALUES
(8500, 1, 1),
(12000, 1, 1),
(14500, 1, 2),
(21000, 1, 2),
(25000, 1, 3),

(9800, 2, 2),
(16000, 2, 2),
(17500, 2, 3),
(19500, 2, 3),

(11000, 3, 3),
(14000, 3, 4),
(20000, 3, 4),

(13000, 4, 4),
(17000, 4, 5),
(23000, 4, 5),

(9000, 5, 5),
(15000, 5, 1),
(21000, 5, 1);

INSERT INTO producao (idHortalica, quantidadeProduzida, quantidadePerdida, dtProducao) VALUES
(1, 200, 20, '2026-01-15'),
(2, 150, 10, '2026-01-18'),
(3, 220, 18, '2026-01-20'),
(4, 140, 25, '2026-01-22'),
(5, 190, 30, '2026-01-25'),
(1, 180, 15, '2026-02-15'),
(2, 170, 12, '2026-02-18'),
(3, 210, 14, '2026-02-20'),
(4, 160, 20, '2026-02-22'),
(5, 175, 22, '2026-02-25');

INSERT INTO financeiro (idHortalica, custoProducao, precoVenda, dtReferencia) VALUES
(1, 420.00, 3.00, '2026-01-01'),
(2, 300.00, 3.20, '2026-01-01'),
(3, 520.00, 3.80, '2026-01-01'),
(4, 260.00, 2.80, '2026-01-01'),
(5, 480.00, 4.00, '2026-01-01'),
(1, 390.00, 2.90, '2026-02-01'),
(2, 330.00, 3.30, '2026-02-01'),
(3, 500.00, 3.90, '2026-02-01'),
(4, 280.00, 2.70, '2026-02-01'),
(5, 450.00, 4.20, '2026-02-01');

SELECT * FROM empresa;

SELECT * FROM empresa
WHERE UF = 'SP';

SELECT * FROM empresa
WHERE nome LIKE 'A%';

SELECT * FROM empresa
WHERE dtCadastro >= '2026-01-01';

SELECT * FROM empresa
ORDER BY nome ASC;


SELECT * FROM estufa;

SELECT * FROM estufa
WHERE capacidade > 600;

SELECT * FROM estufa
WHERE capacidade BETWEEN 500 AND 800;

SELECT * FROM estufa
WHERE nomenclatura LIKE '%A';

SELECT * FROM estufa
WHERE idEmpresa = 1;

SELECT * FROM estufa
ORDER BY capacidade DESC;


SELECT * FROM hortalica;

SELECT * FROM registroLuminosidade
WHERE luminosidade < 10000;

SELECT * FROM producao
WHERE dtProducao BETWEEN '2026-01-01' AND '2026-01-31';

SELECT * FROM financeiro
WHERE precoVenda > 3.00;

SELECT * FROM producao
WHERE quantidadePerdida > 20;

SELECT * FROM registroLuminosidade
WHERE luminosidade > 20000;

SELECT * FROM usuario;

SELECT * FROM financeiro
ORDER BY custoProducao DESC;

SELECT * FROM producao
WHERE dtProducao >= '2026-02-01';

SELECT * FROM financeiro
WHERE dtReferencia = '2026-02-01';
