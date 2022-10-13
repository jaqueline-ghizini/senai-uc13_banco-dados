CREATE DATABASE RPG_OnlineBD

USE RPG_OnlineBD

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClassesID INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(50) UNIQUE NOT NULL,
	DescricaoClasse VARCHAR(255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID),
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClassesID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY  REFERENCES Classes(ClassesID),
	HabilidadeID INT FOREIGN  KEY REFERENCES Habilidades(HabilidadeID)
)

--Alterar TABELAS 
ALTER TABLE Personagens
ALTER COLUMN NomePersonagem VARCHAR(100); 


--DML colocar dados
INSERT INTO Usuarios VALUES('Jaque@jaja.com', '123')
INSERT INTO Usuarios (Email, Senha) VALUES ('manuel@manuel.com', HASHBYTES('SHA2_512','123456'))
INSERT INTO Usuarios (Email, Senha) VALUES ('ana@ana.com', HASHBYTES('SHA2_512','1234'))
INSERT INTO Classes VALUES('Barbaro', 'Ele e realmente barbaro')	
INSERT INTO Habilidades VALUES('Muquetada na Costela'),('Zidane'),('Voadora'),('Pedala Robinho')
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Pedrinho','2','1')
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Peninha','1','1')
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Anao','3','1')
INSERT INTO ClasseHabilidade(ClasseID,HabilidadeID) Values (1, 1),(1,2),(1,3), (1,4)

--update altera��es
UPDATE Usuarios
SET Senha = '19944'
WHERE UsuarioID = 1;

--delete
DELETE FROM Personagens WHERE UsuarioID = '3'

-- DQL consultas
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes. ClassesID




--mudando base de dados
-- exemplo de JOIN
CREATE DATABASE ExemplosJOIN
USE ExemplosJOIN

CREATE TABLE Tabela(
	Nome VARCHAR(50) NULL
)
CREATE TABLE TabelaB(
	Nome VARCHAR(50) NULL 
)
--DML
INSERT INTO Tabela VALUES('Fernanda')
INSERT INTO Tabela VALUES('Luis')
INSERT INTO Tabela VALUES('Josefa')
INSERT INTO Tabela VALUES('Fernando')

INSERT INTO TabelaB VALUES ('Manoel'),('Fernando'),('Fernanda')

--DQL
SELECT * FROM Tabela
SELECT * FROM TabelaB

SELECT Tabela.Nome AS Tabela, TabelaB.Nome AS TabelaB FROM Tabela 
INNER JOIN TabelaB
ON Tabela.Nome = TabelaB.Nome

SELECT Tabela.Nome AS Tabela, TabelaB.Nome AS TabelaB FROM Tabela 
LEFT JOIN TabelaB
ON Tabela.Nome = TabelaB.Nome

SELECT Tabela.Nome AS Tabela, TabelaB.Nome AS TabelaB FROM Tabela 
RIGHT JOIN TabelaB
ON Tabela.Nome = TabelaB.Nome

SELECT Tabela.Nome AS Tabela, TabelaB.Nome AS TabelaB FROM Tabela 
FULL OUTER JOIN TabelaB
ON Tabela.Nome = TabelaB.Nome