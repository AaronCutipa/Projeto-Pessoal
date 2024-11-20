CREATE DATABASE passaroCeleste;
USE passaroCeleste;

CREATE TABLE membro(
	idMembro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    dataNasc DATE,
    email VARCHAR(100),
    senha VARCHAR(100),
    telefone VARCHAR(11),
    celular VARCHAR(12),
    cpf CHAR(12),
    sexo TINYINT(1),
    CONSTRAINT chkSexoMembro CHECK(sexo IN (0,1)),
    fkUnidade INT,
    CONSTRAINT fkUnidade
    FOREIGN KEY (fkUnidade)
		REFERENCES unidade(idUnidade),
	fkDiretor INT,
    CONSTRAINT fkDiretor
    FOREIGN KEY (fkDiretor)
		REFERENCES membro(idMembro)
);
CREATE TABLE cargo(
	idCargo INT PRIMARY KEY AUTO_INCREMENT,
    nomeCargo VARCHAR(100),
    fkMembro INT,
    CONSTRAINT fkMembroCargo
    FOREIGN KEY (fkMembro)
		REFERENCES membro(idMembro)
);
CREATE TABLE unidade(
	idUnidade INT PRIMARY KEY AUTO_INCREMENT,
    nomeUnidade VARCHAR(45),
    CONSTRAINT chkNomeUnidade 
		CHECK (nomeUnidade IN ('Arara-Azul', 'Falcão', 'Beija-flor', 'Albatroz')),
    qtdMembros INT,
    sexo TINYINT(1),
    CONSTRAINT chkSexo CHECK(sexo IN (0,1))
);
CREATE TABLE classes(
	idClasses INT PRIMARY KEY AUTO_INCREMENT,
    nomeClasse VARCHAR(45),
	CONSTRAINT chkNomeClasse
		CHECK (nomeClasse IN ('Amigo', 'Companheiro', 'Pesquisador', 'Pioneiro', 'Excursionista', 'Guia')),
    qtdMembros INT
);
CREATE TABLE membroClasse(
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
CREATE TABLE faleConosco(
	idFaleConosco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    assunto VARCHAR(100),
    mensagem VARCHAR(2000)
);


SELECT * FROM membro;
DELETE FROM membro WHERE idMembro = 1;

