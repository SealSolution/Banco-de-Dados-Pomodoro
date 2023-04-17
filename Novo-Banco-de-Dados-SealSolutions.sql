CREATE DATABASE sealSolutions;

USE sealSolutions;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY auto_increment,
    nomeEmpresa varchar(45),
    CNPJ CHAR (14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    CEP INT,
	endereço VARCHAR(45),
    bairro VARCHAR(45),
	estado CHAR(2),
    cidade varchar(45),
    complemento varchar(45),
	descricao varchar(45)
);

insert into empresa values
(null,'fazenda grind','fazenda.grin@gmail.com','6907@Fer','09789789','R. Ype','jardim Pinheiros','SP','Monte Sião','Proximo da casa do Sr.João', 'Fazenda Grind produzindo felicidade'),
(null,'Jitterbiti Brasil','jitterbiti.brasil@gmail.com','b@r45678rt','09111111','R. esmeralda','jardim olinda','MG','Ouro Verde','Predio Branco no final da rua' ,'Distribuidora de Frutos'),
(null,'P.R Tomates','pr.tomates@gmail.com','jjskfgg@12345','09212233','R. Francisco das Neves','jardim Pamonha','GO','São bento','prédio', 'Produtora de tomates'),
(null,'Pomarola','pamarola@gmail.com','qwert09876','0999888','R. verrelho','jardim Jandira','SP','São Paulina','prédio comercial','Distribuidora'),
(null,'Quero','quero@gmail.com','qwertpo4567','09456789','R. lins fins','jardim Crispin','SP','jardins','Fazenda quero tomate', 'a Quero quer esta aqui para oferecer o melhor' ),
(null,'FarmLand','farm.land@gmail.com','9500@Feoo','09789789','R.quintim','jardim Bom figliolio','SP','Santana de Vitoria','fazenda', 'Produtora de Tomates e Laranjas'),
(null,'Red-juicy','redjuicy@outlook.com','84458jdu3!!','05789133','Travessa com Jardim pomar','Jardim Pomar','SC','Sorocaba','Proximo ao centro', 'Distribuidora de frutos e vegetais'),
(null,'TMM','TMM@outlook.com.br','E74Dkk492@','02478321','R Mel Maria','Rosana','SP','São paulo','Predio vermelho', 'Produtora de Tomates, Morangos e Maças'),
(null,'Ver Monte','ver.monte@gmail.com','J38#kd@kdkLL','01389473','Estrada 29','Barra do mendez','BH','Seabra','Proxima a fazenda de vinhos', 'Produtora de tomates'),
(null,'Tamos Aqui','Ta.aqui@outlook.com.br','747@@kdkieLRE','03294561','R. dos Senhores','Leme','PR','Pradaria do norte','Fica proximo a loja do Sr. Jose', 'Vendedora de tomates');


CREATE TABLE usuario (
idUsuario INT PRIMARY KEY auto_increment,
nomeUsuario varchar(45),
tipo CHAR(4), constraint chktipo check (tipo in('dono','funcionario')),
nivelAcesso VARCHAR(45), constraint chkNivelAcesso check (nivelAcesso in('Total', 'Medio', 'Sem')),
email VARCHAR(45),
senha VARCHAR(45),
cpf char(11),
fkEmpresa int, foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into usuario values
(null,'Jorge de Andrade','dono','Total','jorge.deandrade@gmail.com','qwert@9787','41189567977',1),
(null,'Maria dos Anjos','funcionario','Medio','maria.dosanjos@gmail.com','qwert@12345','39922334455',2),
(null,'Thiago Lins','funcionario','Sem','thiago.lins@gmail.com','AB@2114455','39121221212',3),
(null,'Jordana da Silva','funcionario','Medio','jordana.silva@gmail.com','QwQw11!44','41190890987',4),
(null,'Lucas Augusto','funcionario','Total','lucas.augusto@gmail.com','LKÇ234567','40012345678',5),
(null,'Thais Rodrigues','funcionario','Medio','rodrigues.thais@gmail.com','@#qwer1234','39999999999',6),
(null,'Abner Ribeiro','funcionario','Sem','abner.ribeiro@gmail.com','#grt2345','38221345122',7),
(null,'Renan Bolfin','funcionario','Sem','renan.bolfin@gmail.com','#dfgrg234','42234343434',8),
(null,'Queila Crispin','funcionario','medio','queila.crispingmail.com','fdfgh123456','44411223344',9),
(null,'Maysi de Souza','funcionario','Total','maysi.souza@gmail.com','lkmjnhbg98765','411223344455',10);




CREATE TABLE telefone (
idTelefone INT PRIMARY KEY auto_increment,
telefone VARCHAR(11),
fkUsuario int,
foreign key (fkUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE caminhão (
idCaminhão INT primary key auto_increment,
marca VARCHAR(45),
placa CHAR(7),
tipoCaminhao varchar(22), 
constraint chkTipoCaminhao check 
	(tipoCaminhao in("3/4", "Toco", "Truck","Carreta Simples", "Carreta Eixo Extendido")),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE remessaTomates (
idTomates INT PRIMARY KEY auto_increment,
qnt_unidade INT,
qnt_caixas INT,
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
