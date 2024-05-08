-- ---------------------------------------------------------- Criando Database ----------------------------------------------------------------------

CREATE DATABASE Dionysus;

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


-- ---------------------------------------------------------- Criando Tabela Uva --------------------------------------------------------------------

CREATE TABLE Uva(
IdUva INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(75),
Tipo VARCHAR(45)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Mildio ----------------------------------------------------------------

CREATE TABLE Mildio(
IdMildio INT PRIMARY KEY AUTO_INCREMENT,
Umidade_Max DOUBLE NOT NULL,
Temp_Max DECIMAL(3, 1) NOT NULL,
Temp_Min DECIMAL(3, 1) NOT NULL
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


-- ---------------------------------------------------------- Criando Tabela Usuario ----------------------------------------------------------------

CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Email VARCHAR(264) NOT NULL,
Senha VARCHAR(45) NOT NULL,
Telefone VARCHAR(15) NOT NULL,
fkToken CHAR(8) NOT NULL,

CONSTRAINT fkUsuarioEmpresa FOREIGN KEY(fkToken) REFERENCES Empresa(Token)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Ticket_Suporte ---------------------------------------------------------

CREATE TABLE Ticket_Suporte(
IdTicket INT AUTO_INCREMENT,
Assunto VARCHAR(100),
Mensagem VARCHAR(500),
fkUsuario INT,

CONSTRAINT pkCompostaTicketUsuario PRIMARY KEY(IdTicket, fkUsuario),
CONSTRAINT fkUsuarioTicket FOREIGN KEY(fkUsuario) REFERENCES Usuario(IdUsuario)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------- Criando Tabela Propriedade ------------------------------------------------------------

CREATE TABLE Propriedade(
IdPropriedade INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Qnt_Hectare DECIMAL(10, 2) NOT NULL,
fkEmpresa CHAR(8),

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

CREATE TABLE Dado(
IdDado INT AUTO_INCREMENT,
Umidade DOUBLE,
Temperatura DECIMAL(3, 1),
DataLeitura DATETIME,
fkHectare INT NOT NULL,

CONSTRAINT pkCompostaDadoHectare PRIMARY KEY (IdDado, fkHectare),
CONSTRAINT fkDadoHectare FOREIGN KEY(fkHectare) REFERENCES Hectare(IdHectare)
);

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Descrevendo Estrutura das Tabelas ---------------------------------------------------------------

DESCRIBE Mensagem;
DESCRIBE Uva;
DESCRIBE Mildio;
DESCRIBE Empresa;
DESCRIBE Usuario;
DESCRIBE Ticket_Suporte;
DESCRIBE Propriedade;
DESCRIBE Endereco;
DESCRIBE Hectare;
DESCRIBE Dado;

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Mensagem  -------------------------------------------------------------

INSERT INTO Mensagem (Nome, Email, Mensagem) VALUES
('João', 'joao@example.com', 'Olá, gostaria de saber mais sobre o serviço.'),
('Maria', 'maria@example.com', 'Estou com um problema, poderia me ajudar?'),
('Carlos', 'carlos@example.com', 'Gostaria de fazer uma sugestão para melhorar o sistema.');

-- --------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Uva  ------------------------------------------------------------------

INSERT INTO Uva (Nome, Tipo) VALUES
('Cabernet Sauvignon', 'Tinto'),
('Chardonnay', 'Branco'),
('Merlot', 'Tinto');

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


-- ------------------------------------------------ Inserindo dados na tabela Usuario  ------------------------------------------------------------

INSERT INTO Usuario (Nome, Email, Senha, Telefone, fkToken) VALUES
('Ana', 'ana@example.com', 'senha123', '(00) 9876-5432', 'ABCDE123'),
('Pedro', 'pedro@example.com', '123senha', '(00) 5432-9876', 'FGHIJ678');

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Ticket_Suporte  -----------------------------------------------------

INSERT INTO Ticket_Suporte (Assunto, Mensagem, fkUsuario) VALUES
('Problema Técnico', 'Estou com dificuldades para acessar minha DashBoard.', 1),
('Dúvida sobre Produto', 'Como posso fazer a instalação de sensores de forma mais eficiente', 2),
('Duvida Tecnica', 'Como faça a manutenção dos sensores?', 2);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------ Inserindo dados na tabela Propriedade  --------------------------------------------------------

INSERT INTO Propriedade (Nome, Qnt_Hectare, fkEmpresa) VALUES
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


-- ------------------------------------------------ Inserindo dados na tabela Dado  ---------------------------------------------------------------

INSERT INTO Dado (Umidade, Temperatura, DataLeitura, fkHectare) VALUES
(70.5, 25.0, NOW(), 1),
(75.5, 65.0, NOW(), 1),
(55.5, 45.0, NOW(), 1),
(68.0, 26.0, NOW(), 2),
(72.0, 27.0, NOW(), 3);

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- ----------------------------------------------------------- SELECTS ----------------------------------------------------------------------------

SELECT * FROM Mensagem;        -- Visualiza Todos os Dados da tabela Mensagem
SELECT * FROM Uva;      	   -- Visualiza Todos os Dados da tabela Uva
SELECT * FROM Mildio;          -- Visualiza Todos os Dados da tabela Mildio
SELECT * FROM Empresa;         -- Visualiza Todos os Dados da tabela Empresa
SELECT * FROM Usuario;         -- Visualiza Todos os Dados da tabela Usuario
SELECT * FROM Ticket_Suporte;  -- Visualiza Todos os Dados da tabela Ticket_Suporte
SELECT * FROM Propriedade;     -- Visualiza Todos os Dados da tabela Propriedade
SELECT * FROM Endereco;        -- Visualiza Todos os Dados da tabela Endereco
SELECT * FROM Hectare; 	       -- Visualiza Todos os Dados da tabela Hectare
SELECT * FROM Dado; 		   -- Visualiza Todos os Dados da tabela Dado


-- Serve para gerar um mensagem personalizada para notificar um cliente sobre a contratação de serviços.
SELECT 
	concat('Olá ',nome, "! Ficamos felizes em saber que contratou nossos serviços! Mandaremos avisos recorrentes para lhe manter informado para o email de contato fornecido que é o ",Email) as Mensagem
FROM
	Usuario
WHERE 
	IdUsuario = 1;
    
    
-- Tras dados de um usuario especifico
SELECT 
	*
FROM
	Usuario
WHERE
	IdUsuario = 2;
    
    
 -- Mostra fazendas que tem a quantidade de Hectares á partir de certo numero, Isso pode ser útil para identificar as fazendas que têm uma área maior.
SELECT 
	Nome AS Nome_Da_Fazenda, Qnt_Hectare as Quantidade_de_Hectares 
FROM 
	Propriedade 
WHERE 
	Qnt_Hectare >= 100;


 -- Funciona da mesma forma que o SELECT acima, mas para mostrar fazendas com areas menores.
SELECT 
	Nome AS Nome_Fazenda, Qnt_Hectare AS Quantidade_de_Hectares 
FROM
	Propriedade 
WHERE 
	Qnt_Hectare <= 50;
    
    
-- Mostra dados de um Hectar Especifico.
SELECT 
	* 
FROM 
	Dado 
WHERE 
	fkHectare = 1;
    
    
-- Serve para  gerar uma mensagem personalizada que descreve  a umidade de um hectare específico, bem como a data da última leitura de umidade realizada nele
SELECT 
	concat('A Umidade do Hectare cujo o sensor ',fkHectare,' se encontra está em ',Umidade,'%. A Ultima Leitura de Umidade desse Hectare Foi realizada em ', DataLeitura ) AS Mensagem 
    FROM 
		Dado
WHERE 
	fkHectare = 3;
    
    
-- Mostra Dados de Hectares filtrando apenas as leituras de umidade e Data que foram feitas dentro do intervalo de datas e horarios especificadas.
SELECT 
	DataLeitura, Umidade 
FROM 
	Dado 
WHERE 
	DataLeitura >= '2024-05-07 01:00:00' AND DataLeitura <= '2024-05-07 01:30:00';
    
    
-- Mostra Dados de Umidade dos Sensores
SELECT 
	IdDado, Umidade, fkHectare
FROM 
	Dado;
    
    
-- mostra quais sensores estão parados/com problemas/desligados
SELECT 
	IdHectare, Status_Sensor
FROM
	Hectare
WHERE
	Status_Sensor = "Parado";
-- --------------------------------------------------------------------------------------------------------------------------------------------------

    
-- ----------------------------------------------------------- JOINS --------------------------------------------------------------------------------

-- Join para ver Dados da empresa, suas respectivas propriedades e endereços delas
SELECT 
	Empresa.nome AS Nome_da_Empresa, CNPJ, Telefone AS Telefone_Empresa, Email AS Email_Empresa,
    Propriedade.nome AS Nome_da_Propriedade, Qnt_Hectare AS Quantidade_de_Hectare,
    CEP AS CEP_Rural, Estado, Cidade
FROM
	Endereco
JOIN
	Empresa
ON
	Token = fkToken
JOIN
	Propriedade
ON
	IdPropriedade = fkPropriedade;
    
    
-- Join para ver os dados de uma empresa e seus respectivos funcionarios
SELECT
	Empresa.nome AS Nome_da_Empresa, CNPJ,
    Usuario.nome AS Nome_do_usuario, Usuario.Email AS Email_do_Funcionario, Usuario.Telefone AS Telefone_do_Usuario
FROM
	Usuario
JOIN
	Empresa
ON
	Token = fkToken;
    
    
-- Join para ver os dados de uma empresa especifica e seus respectivos funcionarios
SELECT
	Empresa.nome AS Nome_da_Empresa, CNPJ,
    Usuario.nome AS Nome_do_usuario, Usuario.Email AS Email_do_Funcionario, Usuario.Telefone AS Telefone_do_Usuario
FROM
	Usuario
JOIN
	Empresa
ON
	Token = fkToken
WHERE
	fkToken = "FGHIJ678";
    
-- Join para ver dados  da propriedade, Hectare (Localização), Uva plantada, tipo da uva e leitura mais recente dos dados de um propriedade especifica    
SELECT 
	Propriedade.Nome AS Nome_da_Propriedade, Qnt_Hectare AS Quantidade_de_Hectares,
    CONCAT("Longitude: ", Longitude, " Latitude: ", Latitude) AS Localização_Hectare,
    ifnull(Uva.Nome, "Uva plantada não informada!") AS Uva_Plantada, ifnull(Tipo, "Tipo não informado!") AS Tipo_de_uva,
    Umidade AS Leitura_de_Umidade_mais_recente, Temperatura AS Leitura_de_Temperatura_mais_recente
FROM
	Hectare
JOIN 
	Propriedade
ON
	IdPropriedade = fkPropriedade
JOIN
	Uva
ON
	IdUva = fkUva
JOIN
	Dado
ON
	fkHectare = IdHectare
WHERE 
	IdPropriedade = 1
ORDER BY 
	DataLeitura DESC
LIMIT 
	1;
    
    
-- Join para ver quais usuarios abriram um Ticket de suporte e o respectivo Ticket
SELECT
	Nome AS Nome_do_Usuario, Email AS Email_do_Usuario,
    Assunto, Mensagem
FROM
	Ticket_Suporte
JOIN
	Usuario
ON
	IdUsuario = fkUsuario;
    
    
-- Join para obter os hectares de cada propriedade
SELECT 
	Nome AS Nome_Propriedade, 
    IdHectare, CONCAT("Longitude: ", Longitude, " Latitude: ", Latitude) AS Localização_Hectare
FROM
	Hectare
JOIN
	Propriedade
ON
	IdPropriedade = fkpropriedade;
    

-- Join para visualizar o historico de leitura de um sensor especifico
SELECT 
	IdHectare AS IdSensor,
	Temperatura, Umidade, DataLeitura AS Leitura
FROM
	Dado
JOIN
	Hectare
ON
	IdHectare = fkHectare
WHERE
	IdHectare = 1;

-- --------------------------------------------------------------------------------------------------------------------------------------------------

    
-- ----------------------------------------------------------- Funções Matematicas ------------------------------------------------------------------


-- Conta a quantidade de Hectares cadastrados no banco.
SELECT
	COUNT(IdHectare) AS Quantidade_de_Hectares
FROM
	Hectare;
    
    
-- Conta a quantidade de Hectares cadastrados no banco de uma propriedade Especifica.
SELECT
	COUNT(IdHectare) AS Quantidade_de_Hectares
FROM
	Hectare
WHERE
	fkPropriedade = 1;
    
    
-- Conta a quantidade de Leituras de umidade e temperatura realizadas por um sensor especifico
SELECT
	COUNT(Umidade) AS Leituras_Umidade, COUNT(Temperatura) AS Leituras_Temperatura
FROM
	Dado
WHERE
	fkHectare = 1;


-- Exibe a maior leitura de temperatura e umidade de um sensor especifico
SELECT
	Max(Temperatura), Max(Umidade)
FROM
	Dado
WHERE 
	fkHectare = 1;
    
    
-- Exibe a menor leitura de temperatura e umidade de um sensor especifico
SELECT
	Min(Temperatura), Min(Umidade)
FROM
	Dado
WHERE 
	fkHectare = 1;
    
    
-- Exibe a media de temperatura e umidade de um Hectare em especifico
SELECT
	avg(Temperatura), avg(Umidade)
FROM
	Dado
WHERE 
	fkHectare = 1;