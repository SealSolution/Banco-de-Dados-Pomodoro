drop database sealSolution;

create database sealSolution;
use sealSolution;

create table usuario (
idUsuario int primary key auto_increment,
email varchar(45),
senha varchar(45),
nome varchar(45),
cpf char(11),
nivel_acesso varchar(45) constraint chkniel check (nivel_acesso in('médio','básico','total')));



create table empresa(
idempresa int primary key auto_increment,
nome varchar(45),
cnpj char(14),
cep char(8),
rua varchar(45),
bairro varchar(45),
numero int,
cidade varchar(45),
uf char(2),
complemento varchar(45),
descricao varchar(45));


create table usuarioEmpresa (
fkusuario int primary key,
fkempresa int,
constraint fkusuario foreign key (fkusuario) references usuario(idUsuario),
constraint fkempresa foreign key (fkempresa) references empresa(idempresa)
);



create table caminhao (
	
	idCaminhao INT PRIMARY KEY auto_increment,
    fk_idEmpresa INT,
    marca VARCHAR(45),
    placa CHAR(7),
    tipoCaminhao VARCHAR(20),
	FOREIGN KEY (fk_idEmpresa) REFERENCES empresa(idEmpresa)
);

create table sensor(

	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    fk_idEmpresa INT,
    tipo CHAR(4),
    FOREIGN KEY (fk_idEmpresa) REFERENCES empresa(idEmpresa)
);

create table dadossensor(

	dtHora DATETIME PRIMARY KEY,
    fk_idSensor INT,
    temperatura DOUBLE,
    umidade DOUBLE,
    FOREIGN KEY (fk_idSensor) REFERENCES sensor(idSensor)
);

create table motorista(

	idMotorista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf VARCHAR(11),
    idade DATE,
    cnh VARCHAR(12)
);

create table viagem(

	idViagem INT AUTO_INCREMENT,
	fk_caminhao INT,
    fk_motorista INT,
    data_viagem DATE,
    qtd_tomate INT,
    FOREIGN KEY (fk_caminhao) REFERENCES caminhao(idCaminhao),
    FOREIGN KEY (fk_motorista) REFERENCES motorista(idMotorista),
    CONSTRAINT chkComposta PRIMARY KEY (idViagem, fk_caminhao, fk_motorista)
);
