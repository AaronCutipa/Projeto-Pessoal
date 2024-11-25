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
		CONSTRAINT fkUnidade
		FOREIGN KEY (fkUnidade)
		REFERENCES unidade(idUnidade)
);

-- Tabela cargo
CREATE TABLE cargo (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    nomeCargo VARCHAR(45),
		CONSTRAINT chkNomeCargo 
		CHECK (nomeCargo IN ('Desbravador', 'Conselheiro', 'Instrutor', 'Capelão', 'Diretor Associado(a)', 'Diretor')),
    fkMembro INT,
		CONSTRAINT fkMembroCargo 
		FOREIGN KEY (fkMembro) 
		REFERENCES membro(idMembro)
);

-- Tabela classes
CREATE TABLE classes (
    idClasses INT PRIMARY KEY AUTO_INCREMENT,
    nomeClasse VARCHAR(45),
		CONSTRAINT chkNomeClasse 
        CHECK (nomeClasse IN ('Amigo', 'Companheiro', 'Pesquisador', 'Pioneiro', 'Excursionista', 'Guia')),
    qtdMembros INT
);

-- Tabela membroClasse
CREATE TABLE membroClasse (
    fkMembro INT,
		CONSTRAINT fkMembroClasse 
		FOREIGN KEY (fkMembro) 
		REFERENCES membro(idMembro),
    fkClasse INT,
		CONSTRAINT fkClasseMembro 
        FOREIGN KEY (fkClasse) 
        REFERENCES classes(idClasses),
    dataInicio DATE,
    dataTermino DATE
);

-- Tabela faleConosco
CREATE TABLE faleConosco (
    idFaleConosco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    assunto VARCHAR(100),
    mensagem VARCHAR(2000)
);

INSERT INTO unidade(nomeUnidade)
VALUES
  ('Arara-Azul'),
  ('Falcão'),
  ('Beija-flor'),
  ('Albatroz');

INSERT INTO classes(nomeClasse)
VALUES
  ('Amigo'),
  ('Companheiro'),
  ('Pesquisador'),
  ('Pioneiro'),
  ('Excursionista'),
  ('Guia');


-- Inserir membros da diretoria
INSERT INTO membro (nome, sobrenome, dataNasc, email, senha, sexo)
VALUES
  ('Marcelo', 'Martins', '1980-06-15', 'marcelo.martins@email.com', 'senha123', 0),
  ('Mayra', 'Cutipa', '1985-07-20', 'mayra.milene@email.com', 'senha456', 1),
  ('Thiago', 'Furioto', '1990-03-12', 'thiago.furioto@email.com', 'senha789', 0),
  ('Hanan', 'Hortiz', '1992-10-03', 'hanan.hortiz@email.com', 'senha101', 1),
  ('Caio', 'Conde', '1991-05-18', 'caio.conde@email.com', 'senha102', 0),
  ('Letícia', 'Conde', '1993-11-25', 'leticia.conde@email.com', 'senha103', 1),
  ('Dany', 'Farias', '1994-02-11', 'dany.farias@email.com', 'senha104', 1),
  ('Leyla', 'Martins', '1988-07-30', 'leyla.martins@email.com', 'senha105', 1),
  ('Jana', 'Marques', '1987-09-14', 'jana.marques@email.com', 'senha106', 1),
  ('Matheus', 'Rodrigues', '1995-01-22', 'matheus.rodrigues@email.com', 'senha108', 0),
  ('Renato', 'Soares', '1992-03-30', 'renato.soares@email.com', 'senha109', 0),
  ('Alexandre', 'Soares', '1984-12-08', 'alexandre.soares@email.com', 'senha107', 0);
  
  -- insert membros Desbravadores
INSERT INTO membro (nome, sobrenome, dataNasc, email, senha, sexo, fkUnidade)
VALUES
  ('João', 'Silva', '2008-04-01', 'joao.silva@email.com', 'senha110', 0, 2),
  ('Lucas', 'Oliveira', '2007-06-14', 'lucas.oliveira@email.com', 'senha111', 0, 2),
  ('Gabriel', 'Pereira', '2006-08-27', 'gabriel.pereira@email.com', 'senha112', 0, 4),
  ('Fernanda', 'Alves', '2006-11-05', 'fernanda.alves@email.com', 'senha113', 1, 1),
  ('Roberta', 'Gomes', '2005-03-13', 'roberta.gomes@email.com', 'senha114', 1, 3),
  ('Pedro', 'Santos', '2004-02-20', 'pedro.santos@email.com', 'senha115', 0, 4),
  ('Gisele', 'Costa', '2003-09-16', 'gisele.costa@email.com', 'senha116', 1, 1),
  ('Cláudia', 'Lima', '2003-07-28', 'claudia.lima@email.com', 'senha117', 1, 3);




INSERT INTO cargo (nomeCargo, fkMembro)
VALUES
    ('Diretor', 1),
    ('Diretor Associado(a)', 2),
    ('Diretor Associado(a)', 3),
    ('Conselheiro', 4),
    ('Conselheiro', 5),
    ('Conselheiro', 6),
    ('Conselheiro', 7),
    ('Conselheiro', 8),
    ('Conselheiro', 9),
    ('Conselheiro', 10),
    ('Conselheiro', 11),
    ('Capelão', 12),
    ('Desbravador', 13),
    ('Desbravador', 14),
    ('Desbravador', 15),
    ('Desbravador', 16),
    ('Desbravador', 17),
    ('Desbravador', 18),
    ('Desbravador', 19),
    ('Desbravador', 20);


INSERT INTO membroClasse (fkMembro, fkClasse, dataInicio, dataTermino)
VALUES
    (13, 5, '2024-01-01', '2024-11-01'),
    (14, 1, '2024-01-01', '2024-11-01'),
    (15, 3, '2024-01-01', '2024-11-01'),
    (16, 6, '2024-01-01', NULL),
    (17, 2, '2024-01-01', NULL),
    (18, 1, '2024-01-01', NULL),
    (19, 2, '2024-01-01', NULL),
    (20, 3, '2024-01-01', NULL);
    
SELECT
	m.idMembro AS ID,
    m.nome AS Nome,
    m.sobrenome AS Sobrenome,
    m.dataNasc AS 'Data de Nascimento',
    m.email AS 'E-mail',
    m.senha AS Senha,
    c.nomeCargo AS Cargo,
    u.nomeUnidade AS Unidade,
    mc.dataInicio AS 'Início da Classe',
    mc.dataTermino AS 'Termino',
	cl.nomeClasse AS Classe
FROM membro AS m
JOIN cargo AS c
	ON m.idMembro = c.fkMembro
JOIN unidade AS u
	ON m.fkUnidade = u.idUnidade
LEFT JOIN membroClasse AS mc
	ON mc.fkMembro = m.idMembro
LEFT JOIN classes AS cl
	ON mc.fkClasse = cl.idClasses
ORDER BY m.idMembro ASC;


-- Total de membros
SELECT COUNT(*) AS 'Total de Membros'
FROM membro;

-- Total de membros por cargo
SELECT
    ca.nomeCargo AS Cargo,
    COUNT(ca.fkMembro) AS 'Quantidade de Membros'
FROM cargo ca
GROUP BY ca.nomeCargo;

-- Total de memros por cargo com porcentagem
SELECT
    ca.nomeCargo AS Cargo,
    COUNT(ca.fkMembro) AS 'Quantidade de Membros',
    (COUNT(ca.fkMembro) / (SELECT COUNT(*) FROM membro)) * 100 AS 'Porcentagem de Membros'
FROM cargo ca
GROUP BY ca.nomeCargo;


-- Total de membros por Unidade
SELECT
    u.nomeUnidade AS Unidade,
    COUNT(m.idMembro) AS 'Quantidade de Membros'
FROM unidade u
LEFT JOIN membro m 
	ON m.fkUnidade = u.idUnidade
GROUP BY u.idUnidade;

-- Total de membros por Classe
SELECT
    c.nomeClasse AS Classe,
    COUNT(mc.fkMembro) AS 'Quantidade de Membros'
FROM classes c
LEFT JOIN membroClasse mc 
	ON mc.fkClasse = c.idClasses
LEFT JOIN membro m 
	ON mc.fkMembro = m.idMembro
GROUP BY c.idClasses;


SELECT
    CASE WHEN sexo = 0 THEN 'Masculino'
         WHEN sexo = 1 THEN 'Feminino' END AS Genero,
    COUNT(*) AS 'Quantidade de Membros'
FROM membro
GROUP BY sexo;


    
    

/*INSERT INTO membro(nome, sobrenome, dataNasc, email, senha)
VALUES
	('Aaron', 'Cutipa', '2005-02-01', 'aacc6720@gmail.com', '18171401Jfma!');*/
    
