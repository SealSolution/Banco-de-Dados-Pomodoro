CREATE DATABASE sealSolutions;

USE sealSolutions;

CREATE TABLE usuario (
idUser INT PRIMARY KEY auto_increment,
tipo CHAR(4),
nivelAcesso VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(45)
);

CREATE TABLE empresa (
	idUsuario INT PRIMARY KEY auto_increment,
    CNPJ CHAR (14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    CEP INT,
	endereço VARCHAR(45),
    bairro VARCHAR(45),
	estado CHAR(2),
    fkUsuario INT,
    foreign key (fkUsuario) REFERENCES usuario(idUser)
);

CREATE TABLE telefone (
idTelefone INT PRIMARY KEY auto_increment,
telefone_1 VARCHAR(20) NOT NULL,
telefone_2 VARCHAR(20),
fkEmpresa int,
foreign key (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE caminhão (
idCaminhão INT primary key auto_increment,
marca VARCHAR(45),
cor varchar(45),
placa CHAR(7),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE remessaTomates (
idTomates INT PRIMARY KEY auto_increment,
qnt_unidade INT,
qnt_caixas INT,
qnt_quilos INT,
fkCaminhão INT,
foreign key (fkCaminhão) REFERENCES caminhão(idCaminhão)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo CHAR(4),
fkCaminhão INT,
FOREIGN KEY (fkCaminhão) REFERENCES caminhão(idCaminhão)
);


CREATE TABLE dadosSensor (
idDadosSensor INT PRIMARY KEY auto_increment,
dtHora DATETIME,
temperatura FLOAT,
umidade INT,
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);