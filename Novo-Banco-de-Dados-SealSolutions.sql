CREATE DATABASE sealSolutions;

USE sealSolutions;

CREATE TABLE tipo_usuario (
idTipo INT PRIMARY KEY auto_increment,
tipo CHAR(8)
CONSTRAINT chkTipo CHECK (tipo IN ('Autonomo','Empresa'))
);

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR (5) NOT NULL,
    CONSTRAINT chkSexo CHECK (sexo IN ('M', 'F', 'Outro')),
    dtNasc DATE NOT NULL,
    CPF CHAR (11) NOT NULL,
    RG VARCHAR (9) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    fkTipo INT,
    rua VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    CEP CHAR(8),
    complemento VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(2),
    foreign key (fkTipo) REFERENCES tipo_usuario(idTipo)
);

CREATE TABLE remessaTomates (
idTomates INT PRIMARY KEY auto_increment,
qnt_unidade INT,
qnt_caixas INT,
fkUsuario INT,
foreign key (fkUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE motorista (
idMotorista INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
dataNasc DATE,
cpf CHAR(11),
cnh CHAR(12)
);

CREATE TABLE trajeto (
idTrajeto INT primary key auto_increment,
localPartida VARCHAR(45),
destino VARCHAR(45),
distancia INT
);


CREATE TABLE caminhao (
idCaminhao INT primary key auto_increment,
marca VARCHAR(45),
placa CHAR(7),
fkMotorista INT,
FOREIGN KEY (fkMotorista) REFERENCES motorista(idMotorista),
fkRemessaTomate INT,
FOREIGN KEY (fkRemessaTomate) REFERENCES remessaTomates(idTomates),
fkTrajeto INT,
FOREIGN KEY (fkTrajeto) REFERENCES trajeto(idTrajeto)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo CHAR(4), 
CONSTRAINT chkTipoSensor CHECK (tipo IN ('TEMP','UMID')),
fkCaminhao INT,
FOREIGN KEY (fkCaminhao) REFERENCES caminhao(idCaminhao)
);


CREATE TABLE dadosSensor (
idDadosSensor INT PRIMARY KEY auto_increment,
dtHora DATETIME,
temperatura FLOAT,
umidade INT,
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

CREATE TABLE Telefone 
	(idTelefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(11),
    fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario));

