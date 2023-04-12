cREATE DATABASE sealSolutions;

USE sealSolutions;

CREATE TABLE tipo_usuario (
idTipo INT PRIMARY KEY auto_increment,
tipo CHAR(8)
CONSTRAINT chkTipo CHECK (tipo IN ('Autonomo','Empresa'))
);

INSERT INTO tipo_usuario VALUES
(null,'Autonomo'),
(null,'Autonomo'),
(null,'Empresa'),
(null,'Autonomo'),
(null,'Empresa'),
(null,'Empresa'),
(null,'Empresa'),
(null,'autonomo'),
(null,'autonomo'),
(null,'Empresa');

select * from tipo_usuario;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(45),
    sexo CHAR (5) NOT NULL,
    CONSTRAINT chkSexo CHECK (sexo IN ('M', 'F', 'Outro')),
    dtNasc DATE NOT NULL,
    CPF CHAR (11) NOT NULL,
    RG VARCHAR (9) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    rua VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    CEP CHAR(8),
    complemento VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(2),
    fkTipo INT, foreign key (fkTipo) REFERENCES tipo_usuario(idTipo)
);

iNSERT INTO usuario VALUES
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R.Cabral Peixoto','Jardim Iracema','1234','09789789',null,'São Paulo','São Paulo',1),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','A2@qwer123','R.Prefeito Albertino','Jardim Ype','888','09789789',null,'Monte Sião','São Paulo',2),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','','R. prefeito Morais','Jardim crispin','789','09789123',null,'Mato Grosso do Sul','Rio Grande do Sul',3),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R.Japão','Jardim Pinherais','098','09789234',null,'São Paulo','São Paulo',4),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R.Lins Firpins','Jardim Deomonte','234','09789567',null,'São Paulo','São Paulo',5),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R.Armando Morais','Jardim utinga','111','09789890',null,'São Paulo','São Paulo',6),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R. Alberto Nobrega','Jardim Guapituba','2100','09789159',null,'São Paulo','São Paulo',7),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R. Onze de Novembro','Jardim capuava','2020','09789111',null,'São Paulo','São Paulo',8),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R.Julio de Mesquita','Jardim prefeito saldino','45','09789222',null,'São Paulo','São Paulo',9),
(null,'João','Alves Lopes','M','1985-02-19','42245789009','2345678908','joao.alvesl@gmail.com','JAL1234qwe','R. marcos Fernandes','Jardim Silva','12','09789000',null,'São Paulo','São Paulo',10);

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