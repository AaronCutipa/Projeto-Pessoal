CREATE DATABASE passaroCeleste;
USE passaroCeleste;

-- Tabela unidade
CREATE TABLE unidade (
    idUnidade INT PRIMARY KEY AUTO_INCREMENT,
    nomeUnidade VARCHAR(45),
    CONSTRAINT chkNomeUnidade 
        CHECK (nomeUnidade IN ('Arara-Azul', 'Falcão', 'Beija-flor', 'Albatroz')),
    qtdMembros INT
);

-- Tabela cargo
CREATE TABLE cargo (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    nomeCargo VARCHAR(45),
    CONSTRAINT chkNomeCargo 
        CHECK (nomeCargo IN ('Desbravador', 'Conselheiro', 'Instrutor', 'Capelão', 'Diretor Associado(a)', 'Diretor'))
);

-- Tabela classes
CREATE TABLE classes (
    idClasse INT PRIMARY KEY AUTO_INCREMENT,
    nomeClasse VARCHAR(45),
    CONSTRAINT chkNomeClasse 
        CHECK (nomeClasse IN ('Amigo', 'Companheiro', 'Pesquisador', 'Pioneiro', 'Excursionista', 'Guia')),
    qtdMembros INT
);

-- Tabela membro
CREATE TABLE membro (
    idMembro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    dataNasc DATE NOT NULL,
    sexo TINYINT(1) NOT NULL,
    CONSTRAINT chkSexo 
        CHECK (sexo IN (0, 1)),
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    fkUnidade INT,
        CONSTRAINT fkMembroUnidade
        FOREIGN KEY (fkUnidade)
        REFERENCES unidade(idUnidade),
    fkCargo INT,
        CONSTRAINT fkMembroCargo 
        FOREIGN KEY (fkCargo) 
        REFERENCES cargo(idCargo),
    fkClasse INT,
        CONSTRAINT fkMembroClasse
        FOREIGN KEY (fkClasse) 
        REFERENCES classes(idClasse)
);

-- Tabela faleConosco
CREATE TABLE faleConosco (
    idFaleConosco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    assunto VARCHAR(100),
    mensagem VARCHAR(2000)
);

-- Inserir dados na tabela unidade
INSERT INTO unidade(nomeUnidade)
VALUES
  ('Arara-Azul'),
  ('Falcão'),
  ('Beija-flor'),
  ('Albatroz');
  
-- Inserir dados na tabela cargo
INSERT INTO cargo (nomeCargo)
VALUES
    ('Desbravador'),
    ('Instrutor'),
    ('Capelão'),
    ('Conselheiro'),
    ('Diretor Associado(a)'),
    ('Diretor');

-- Inserir dados na tabela classes
INSERT INTO classes(nomeClasse)
VALUES
  ('Amigo'),
  ('Companheiro'),
  ('Pesquisador'),
  ('Pioneiro'),
  ('Excursionista'),
  ('Guia');

-- Inserir membros da diretoria
INSERT INTO membro (nome, sobrenome, dataNasc, email, senha, sexo, fkCargo)
VALUES
  ('Marcelo', 'Martins', '1980-06-15', 'marcelo.martins@email.com', 'senha123', 0, 6),
  ('Mayra', 'Cutipa', '1985-07-20', 'mayra.milene@email.com', 'senha456', 1, 5),
  ('Thiago', 'Furioto', '1990-03-12', 'thiago.furioto@email.com', 'senha789', 0, 5),
  ('Hanan', 'Hortiz', '1992-10-03', 'hanan.hortiz@email.com', 'senha101', 1, 4),
  ('Caio', 'Conde', '1991-05-18', 'caio.conde@email.com', 'senha102', 0, 4),
  ('Letícia', 'Conde', '1993-11-25', 'leticia.conde@email.com', 'senha103', 1, 4),
  ('Dany', 'Farias', '1994-02-11', 'dany.farias@email.com', 'senha104', 1, 4),
  ('Leyla', 'Martins', '1988-07-30', 'leyla.martins@email.com', 'senha105', 1, 4),
  ('Jana', 'Marques', '1987-09-14', 'jana.marques@email.com', 'senha106', 1, 4),
  ('Matheus', 'Rodrigues', '1995-01-22', 'matheus.rodrigues@email.com', 'senha108', 0, 4),
  ('Renato', 'Soares', '1992-03-30', 'renato.soares@email.com', 'senha109', 0, 4),
  ('Alexandre', 'Soares', '1984-12-08', 'alexandre.soares@email.com', 'senha107', 0, 3);
  
-- Inserir membros desbravadores
INSERT INTO membro (nome, sobrenome, dataNasc, email, senha, sexo, fkUnidade, fkCargo, fkClasse)
VALUES
  ('João', 'Silva', '2008-04-01', 'joao.silva@email.com', 'senha110', 0, 2, 1, 5),
  ('Lucas', 'Oliveira', '2007-06-14', 'lucas.oliveira@email.com', 'senha111', 0, 2, 1, 1),
  ('Gabriel', 'Pereira', '2006-08-27', 'gabriel.pereira@email.com', 'senha112', 0, 4, 1, 3),
  ('Fernanda', 'Alves', '2006-11-05', 'fernanda.alves@email.com', 'senha113', 1, 1, 1, 6),
  ('Roberta', 'Gomes', '2005-03-13', 'roberta.gomes@email.com', 'senha114', 1, 3, 1, 3),
  ('Pedro', 'Santos', '2004-02-20', 'pedro.santos@email.com', 'senha115', 0, 4, 1, 2),
  ('Gisele', 'Costa', '2003-09-16', 'gisele.costa@email.com', 'senha116', 1, 1, 1, 1),
  ('Cláudia', 'Lima', '2003-07-28', 'claudia.lima@email.com', 'senha117', 1, 3, 1, 2);
  
  SELECT
    m.idMembro AS ID,
    m.nome AS Nome,
    m.sobrenome AS Sobrenome,
    m.dataNasc AS 'Data de Nascimento',
    m.email AS 'E-mail',
    c.nomeCargo AS Cargo,
    u.nomeUnidade AS Unidade,
    cl.nomeClasse AS Classe
FROM membro m
LEFT JOIN cargo c ON m.fkCargo = c.idCargo
LEFT JOIN unidade u ON m.fkUnidade = u.idUnidade
LEFT JOIN classes cl ON m.fkClasse = cl.idClasse
ORDER BY m.idMembro ASC;


-- Total de membros por Cargo
SELECT
    c.nomeCargo AS Cargo,
    COUNT(m.idMembro) AS 'Quantidade de Membros'
FROM cargo c
LEFT JOIN membro m ON c.idCargo = m.fkCargo
GROUP BY c.idCargo;

-- Total de membros por unidade
SELECT
    u.nomeUnidade AS Unidade,
    COUNT(m.idMembro) AS 'Quantidade de Membros'
FROM unidade u
LEFT JOIN membro m ON u.idUnidade = m.fkUnidade
GROUP BY u.idUnidade;

-- Total de membros por Classe
SELECT
    cl.nomeClasse AS Classe,
    COUNT(m.idMembro) AS 'Quantidade de Membros'
FROM classes cl
LEFT JOIN membro m ON cl.idClasse = m.fkClasse
GROUP BY cl.idClasse;

-- Total de membros
SELECT COUNT(*) AS 'Total de Membros'
FROM membro;


-- Unidade com mais membros
SELECT
	u.nomeUnidade AS Unidade,
    COUNT(m.idMembro) AS 'qtd_membro'
FROM unidade AS u
JOIN membro AS m
	ON u.idUnidade = m.fkUnidade
GROUP BY u.idUnidade
ORDER BY COUNT(m.idMembro) DESC
LIMIT 1;

-- Classe com mais membros
SELECT
	nomeClasse AS Classe,
    COUNT(m.idMembro) AS qtd_membro
FROM classes AS cl
JOIN membro AS m
	ON cl.idClasse = m.fkClasse
GROUP BY cl.idClasse
ORDER BY COUNT(m.idMembro) DESC
LIMIT 1;


SELECT * FROM membro;


