-- ---------------------------------------------------------- Criando Database ----------------------------------------------------------------------

CREATE DATABASE Dionysus;
-- DROP DATABASE Dionysus;
-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Selecionando Database -----------------------------------------------------------------

USE Dionysus;

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Mensagem ---------------------------------------------------------------

CREATE TABLE  Mensagem(
IdMensagem INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Email VARCHAR(264) NOT NULL, 
Mensagem VARCHAR(1000) NOT NULL
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Mildio ----------------------------------------------------------------

CREATE TABLE Mildio(
IdMildio INT PRIMARY KEY AUTO_INCREMENT,
Umidade_Max DOUBLE NOT NULL,
Temp_Max DOUBLE NOT NULL,
Temp_Min DOUBLE NOT NULL
);

-- -------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Empresa ---------------------------------------------------------------

CREATE TABLE Empresa(
Token CHAR(8) PRIMARY KEY,
Nome VARCHAR(75) NOT NULL,
CNPJ CHAR(14) NOT NULL,
Telefone VARCHAR(15) NOT NULL,
Email VARCHAR(264) NOT NULL
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------ Criando Tabela Nivel_Permissao -------------------------------------------------------------

CREATE TABLE Nivel_Permissao (
IdNivel_Permissao INT PRIMARY KEY AUTO_INCREMENT,
Posicao VARCHAR(45) NOT NULL,

CONSTRAINT ckPosicao CHECK (Posicao IN ('Dono', 'Administrador', 'Usuário'))
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------ Criando Tabela Tipo -----------------------------------------------------------------

CREATE TABLE Tipo (
IdTipo INT PRIMARY KEY AUTO_INCREMENT,
Tipo VARCHAR(45),

CONSTRAINT ckTipo CHECK (Tipo IN ('Vinifera', 'Não vinifera'))
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Usuario ----------------------------------------------------------------

CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Email VARCHAR(264) NOT NULL,
Senha VARCHAR(45) NOT NULL,
Telefone VARCHAR(15) NOT NULL,
fkToken CHAR(8) NOT NULL,
fkNivel_Permissao INT,

CONSTRAINT fkUsuarioEmpresa FOREIGN KEY(fkToken) REFERENCES Empresa(Token),
CONSTRAINT fkUsuarioNivel_Permissao FOREIGN KEY(fkNivel_Permissao) REFERENCES Nivel_Permissao(IdNivel_Permissao)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Uva --------------------------------------------------------------------

CREATE TABLE Uva(
IdUva INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(75),
fkTipo INT,
 
CONSTRAINT fkUvatipo FOREIGN KEY(fkTipo) REFERENCES Tipo(IdTipo)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Propriedade ------------------------------------------------------------

CREATE TABLE Propriedade(
IdPropriedade INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Area DECIMAL(10, 2) NOT NULL,
fkEmpresa CHAR(8) NOT NULL,

CONSTRAINT fkEmpresaPropriedade FOREIGN KEY(fkEmpresa) REFERENCES Empresa(Token)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Endereco ---------------------------------------------------------------

CREATE TABLE Endereco(
IdEndereco INT AUTO_INCREMENT,
Rua VARCHAR(100),
Numero VARCHAR(5),
CEP CHAR(8),
Complemento VARCHAR(100),
Estado VARCHAR(50),
Cidade VARCHAR(50),
fkToken CHAR(8),
fkPropriedade INT,

CONSTRAINT pkCompostaEndereçoPropriedadeEmpresa PRIMARY KEY(IdEndereco, fkToken),
CONSTRAINT fkEnderecoEmpresa FOREIGN KEY(fkToken) REFERENCES Empresa(Token),
CONSTRAINT fkEnderecoPropriedade FOREIGN KEY(fkPropriedade) REFERENCES Propriedade(IdPropriedade)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Hectare ----------------------------------------------------------------

CREATE TABLE Hectare(
IdHectare INT PRIMARY KEY AUTO_INCREMENT,
Status_Sensor VARCHAR(7) NOT NULL,
Longitude DECIMAL(11,8) NOT NULL,
Latitude DECIMAL(10,8) NOT NULL,
fkPropriedade INT NOT NULL,
fkUva INT,

CONSTRAINT chkStatusSensor CHECK (Status_Sensor = "Ok" OR Status_Sensor = "Parado"),
CONSTRAINT fkPropriedadeHectare FOREIGN KEY(fkPropriedade) REFERENCES Propriedade(IdPropriedade),
CONSTRAINT fkUvaHectare FOREIGN KEY(fkUva) REFERENCES Uva(IdUva)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Dado -------------------------------------------------------------------

CREATE TABLE Leitura(
IdDado INT AUTO_INCREMENT,
Umidade DOUBLE,
Temperatura DOUBLE,
DataLeitura DATETIME,
fkHectare INT NOT NULL,

CONSTRAINT pkCompostaDadoHectare PRIMARY KEY (IdDado, fkHectare),
CONSTRAINT fkDadoHectare FOREIGN KEY(fkHectare) REFERENCES Hectare(IdHectare)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------- DESCREVENDO A ESTRUTURA DAS TABELAS ----------------------------------------------------------

DESCRIBE Mensagem;            -- Descreve a estrutura da tabela Mensagem
DESCRIBE Uva;      	          -- Descreve a estrutura da tabela Uva
DESCRIBE Mildio;              -- Descreve a estrutura da tabela Mildio
DESCRIBE Empresa;             -- Descreve a estrutura da tabela Empresa
DESCRIBE Usuario;             -- Descreve a estrutura da tabela Usuario
DESCRIBE Propriedade;         -- Descreve a estrutura da tabela Propriedade
DESCRIBE Endereco;            -- Descreve a estrutura da tabela Endereco
DESCRIBE Hectare; 	          -- Descreve a estrutura da tabela Hectare
DESCRIBE Leitura; 	          -- Descreve a estrutura da tabela Leitura
DESCRIBE Nivel_Permissao; 	  -- Descreve a estrutura da tabela Nivel_Permissao
DESCRIBE Tipo; 	              -- Descreve a estrutura da tabela Tipo

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Mensagem  -------------------------------------------------------------

INSERT INTO Mensagem (Nome, Email, Mensagem) VALUES
('João', 'joao@example.com', 'Olá, gostaria de saber mais sobre o serviço.'),
('Maria', 'maria@example.com', 'Estou com um problema, poderia me ajudar?'),
('Carlos', 'carlos@example.com', 'Gostaria de fazer uma sugestão para melhorar o sistema.');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Mildio  -------------------------------------------------------------

INSERT INTO Mildio (Umidade_Max, Temp_Max, Temp_Min) VALUES
(60, 25.0, 18.0);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Empresa  ------------------------------------------------------------

INSERT INTO Empresa (Token, Nome, CNPJ, Telefone, Email) VALUES
('ABCDE123', 'Vinícola ABC', '12345678901234', '(00) 1234-5678', 'contato@vinicolaabc.com'),
('FGHIJ678', 'Vinícola FGHIJ', '56789012345678', '(00) 5678-1234', 'contato@vinicolafghij.com');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Nivel_Permissao  ----------------------------------------------------

INSERT INTO Nivel_Permissao (Posicao) VALUES
('Dono'),
('Administrador'),
('Usuário');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Nivel_Permissao  ----------------------------------------------------

INSERT INTO Tipo (Tipo) VALUES
('Vinifera'),
('Não vinifera');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Usuario  ------------------------------------------------------------

INSERT INTO Usuario (Nome, Email, Senha, Telefone, fkToken, fkNivel_Permissao) VALUES
('Ana', 'ana@example.com', 'senha123', '(00) 9876-5432', 'ABCDE123', 1),
('Pedro', 'pedro@example.com', '123senha', '(00) 5432-9876', 'FGHIJ678', 2);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Uva  ------------------------------------------------------------------

INSERT INTO Uva (Nome, fkTipo) VALUES
('Cabernet Sauvignon', 1),
('Chardonnay', 1),
('Merlot', 2);

-- ------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------ Inserindo dados na tabela Propriedade  --------------------------------------------------------

INSERT INTO Propriedade (Nome, Area, fkEmpresa) VALUES
('Fazenda XYZ', 100.0, 'ABCDE123'),
('Sítio ABC', 50.0, 'FGHIJ678');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Endereco  -----------------------------------------------------------

INSERT INTO Endereco (Rua, Numero, CEP, Complemento, Estado, Cidade, fkToken, fkPropriedade) VALUES
(NULL, NULL, '12345678', NULL, 'Estado X', 'Cidade A', "FGHIJ678", 1),
('Avenida Principal', '456', '56789012', 'Casa 2', 'Estado Y', 'Cidade B', "FGHIJ678", NULL),
(NULL, NULL, '90123456', NULL, 'Estado Z', 'Cidade C', "ABCDE123", 2),
('Avenida Secundária', '1011', '34567890', 'Casa 4', 'Estado W', 'Cidade D', "ABCDE123", NULL);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Hectare  ------------------------------------------------------------

INSERT INTO Hectare (Status_Sensor, Longitude, Latitude, fkPropriedade, fkUva) VALUES
('Ok', -20.000001, -40.000001, 1, 1),
('Parado', -20.000002, -40.000002, 1, 2),
('Ok', -20.000003, -40.000003, 2, 3),
('Parado', -20.000004, -40.000004, 1, 2),
('Ok', -20.000005, -40.000005, 2, 3),
('Parado', -20.000006, -40.000006, 2, 1);


-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Leitura  ------------------------------------------------------------

INSERT INTO Leitura (Umidade, Temperatura, DataLeitura, fkHectare) VALUES
(70.5, 25.0, NOW(), 1),
(75.5, 65.0, NOW(), 1),
(55.5, 45.0, NOW(), 1),
(68.0, 26.0, NOW(), 2),
(72.0, 27.0, NOW(), 3);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ----------------------------------------------------------- SELECTS ----------------------------------------------------------------------------

SELECT * FROM Mensagem;           -- Visualiza Todos os Dados da tabela Mensagem
SELECT * FROM Uva;      	      -- Visualiza Todos os Dados da tabela Uva
SELECT * FROM Mildio;             -- Visualiza Todos os Dados da tabela Mildio
SELECT * FROM Empresa;            -- Visualiza Todos os Dados da tabela Empresa
SELECT * FROM Usuario;            -- Visualiza Todos os Dados da tabela Usuario
SELECT * FROM Propriedade;        -- Visualiza Todos os Dados da tabela Propriedade
SELECT * FROM Endereco;           -- Visualiza Todos os Dados da tabela Endereco
SELECT * FROM Hectare; 	          -- Visualiza Todos os Dados da tabela Hectare
SELECT * FROM Leitura; 		      -- Visualiza Todos os Dados da tabela Leitura
SELECT * FROM Nivel_Permissao;    -- Visualiza Todos os Dados da tabela Nivel_Permissao
SELECT * FROM Tipo; 		      -- Visualiza Todos os Dados da tabela Tipo
-- TRUNCATE TABLE Propriedade;
-- DROP TABLE Hectare;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
