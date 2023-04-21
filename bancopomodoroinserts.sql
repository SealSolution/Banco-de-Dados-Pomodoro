drop table usuario;
drop table empresa;
drop table telefone;
drop table caminhao;
drop table remessaTomates;
drop table sensor;
drop table dadosSensor;

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
(null,'fazenda grind','11111111111111','fazenda.grin@gmail.com','6907@Fer','09789789','R. Ype','jardim Pinheiros','SP','Monte Sião','Proximo da casa do Sr.João','Fazenda Grind produzindo felicidade'),
(null,'Jitterbiti Brasil','12345678901234','jitterbiti.brasil@gmail.com','b@r45678rt','09111111','R. esmeralda','jardim olinda','MG','Ouro Verde','Predio Branco no final da rua','Distribuidora de Frutos'),
(null,'Pomar Rivier Tomates','22222222222222','pr.tomates@gmail.com','jjskfgg@12345','09212233','R. Francisco das Neves','jardim Pamonha','GO','São bento','prédio','Produtora de tomates'),
(null,'Pomarola','33333333333333','pamarola@gmail.com','qwert09876','0999888','R. verrelho','jardim Jandira','SP','São Paulina','prédio comercial','Distribuidora'),
(null,'Quero','44444444444444','quero@gmail.com','qwertpo4567','09456789','R. lins fins','jardim Crispin','SP','jardins','Fazenda quero tomate','a Quero quer esta aqui para oferecer o melhor'),
(null,'FarmLand','55555555555555','farm.land@gmail.com','9500@Feoo','09789789','R.quintim','jardim Bom figliolio','SP','Santana de Vitoria','fazenda','Produtora de Tomates e Laranjas'),
(null,'Red juicy','66666666666666','redjuicy@outlook.com','84458jdu3!!','05789133','Travessa com Jardim pomar','Jardim Pomar','SC','Sorocaba','Proximo ao centro','Distribuidora de frutos e vegetais'),
(null,'TMM','77777777777777','TMM@outlook.com.br','E74Dkk492@','02478321','R Mel Maria','Rosana','SP','São paulo','Predio vermelho','Produtora de Tomates, Morangos e Maças'),
(null,'Ver Monte','88888888888888','ver.monte@gmail.com','J38#kd@kdkLL','01389473','Estrada 29','Barra do mendez','BH','Seabra','Proxima a fazenda de vinhos','Produtora de tomates'),
(null,'Tamos Aqui','99999999999999','Ta.aqui@outlook.com.br','747@@kdkieLRE','03294561','R. dos Senhores','Leme','PR','Pradaria do norte','Fica proximo a loja do Sr. Jose','Vendedora de tomates');


CREATE TABLE usuario (
idUsuario INT PRIMARY KEY auto_increment,
nomeUsuario varchar(45),
tipo CHAR(11), constraint chktipo check (tipo in('dono','funcionario')),
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
(null,'Maysi de Souza','funcionario','Total','maysi.souza@gmail.com','lkmjnhbg98765','41122334445',10);

select * from usuario;

select * from usuario 
join empresa on usuario.idusuario = fkEmpresa; 

CREATE TABLE telefone (
idTelefone INT PRIMARY KEY auto_increment,
telefone VARCHAR(11),
fkUsuario int,
foreign key (fkUsuario) REFERENCES usuario(idUsuario)
);

insert into telefone values
(null,'11934342526',1),
(null,'11999999999',1),
(null,'11911111111',2),
(null,'11912121212',2),
(null,'11922222222',3),
(null,'11933333333',4),
(null,'11944444444',5),
(null,'11955555555',6),
(null,'11966666666',7),
(null,'11977676767',8),
(null,'11923456789',9),
(null,'11910101010',10);

select * from telefone;
select * from telefone
join usuario on telefone.idtelefone = fkusuario;

CREATE TABLE caminhao (
idCaminhao INT primary key auto_increment,
marca VARCHAR(45),
placa CHAR(7),
tipoCaminhao varchar(22), 
constraint chkTipoCaminhao check 
	(tipoCaminhao in("3/4", "Toco", "Truck","Carreta Simples", "Carreta Eixo Extendido")),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

insert into caminhao values
(null,'Scania','01qwe12','toco',1),
(null,'MAN','asdqwe1','3/4',2),
(null,'Volkswagen','zxc1230','Truck',3),
(null,'Iveco','456tgb6','Carreta Eixo Extendido',4),
(null,'Mercedes-Benz','ert0977','Carreta Eixo Extendido',5),
(null,'Volvo','vcdfg56','Carreta Simples',6),
(null,'Scania','k8k9k9j','toco',7),
(null,' Hyundai','1w2wwww','3/4',8),
(null,'Volvo','zlku789','Truck',9),
(null,'Scania','oba1234','Truck',10);

select * from caminhao;
select * from caminhao 
join empresa on idcaminhao = fkEmpresa;

CREATE TABLE remessaTomates (
idTomates INT PRIMARY KEY auto_increment,
qnt_unidade INT,
qnt_caixas INT,
fkCaminhao INT,
foreign key (fkCaminhao) REFERENCES caminhao(idCaminhao)
);

insert into remessaTomates values
(null,'1008','21',1),
(null,'1920','40',2),
(null,'2400','50',3),
(null,'1920','40',4),
(null,'1680','35',5),
(null,'1440','30',6),
(null,'1920','40',7),
(null,'2304','48',8),
(null,'3360','70',9),
(null,'1680','35',10);

select * from caminhao;

select * from caminhao
join empresa on idcaminhao = fkEmpresa;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo CHAR(4),
constraint chkTiposensor check 
(tipo in("temp", "umid")),
fkCaminhao INT,
FOREIGN KEY (fkCaminhao) REFERENCES caminhao(idCaminhao)
);

insert into sensor values
(null,'temp',1),
(null,'temp',2),
(null,'temp',3),
(null,'temp',4),
(null,'temp',5),
(null,'temp',6),
(null,'temp',7),
(null,'temp',8),
(null,'temp',9),
(null,'temp',10),
(null,'umid',1),
(null,'umid',2),
(null,'umid',3),
(null,'umid',4),
(null,'umid',5),
(null,'umid',6),
(null,'umid',7),
(null,'umid',8),
(null,'umid',9),
(null,'umid',10);

select * from sensor;

select * from sensor 
join caminhao on idsensor = fkcaminhao;

CREATE TABLE dadosSensor (
idDadosSensor INT PRIMARY KEY auto_increment,
dtHora DATETIME,
temperatura FLOAT,
umidade INT,
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

insert into dadosSensor values
(null,'2023-04-20 10:00:20','10','60',1);

insert into dadosSensor values
(null,'2023-04-20 10:30:20','10','60',1),
(null,'2023-04-20 11:00:20','10','70',1),
(null,'2023-04-20 11:30:20','10','60',1),
(null,'2023-04-20 12:00:20','11','60',1),
(null,'2023-04-20 12:30:20','10','60',1),
(null,'2023-04-20 13:00:20','10','60',1),
(null,'2023-04-20 13:30:20','10','60',1),
(null,'2023-04-20 14:00:20','10','60',1),
(null,'2023-04-20 14:30:20','10','60',1),
(null,'2023-04-20 15:00:20','10','60',1),
(null,'2023-04-20 15:30:20','10','60',1),
(null,'2023-04-20 16:00:20','10','60',1),
(null,'2023-04-20 16:30:20','11','60',1),
(null,'2023-04-20 17:00:20','11','60',1),
(null,'2023-04-20 17:30:20','11','70',1),
(null,'2023-04-20 18:00:20','12','70',1),
(null,'2023-04-20 18:30:20','11','70',1),
(null,'2023-04-20 19:00:20','10','80',1),
(null,'2023-04-20 19:30:20','10','70',1);

insert into  dadosSensor values
(null,'2023-04-10 10:30:20','10','60',2),
(null,'2023-04-10 11:00:20','10','70',2),
(null,'2023-04-10 11:30:20','10','80',2),
(null,'2023-04-10 12:00:20','11','80',2),
(null,'2023-04-10 12:30:20','10','70',2),
(null,'2023-04-10 13:00:20','10','70',2),
(null,'2023-04-10 13:30:20','10','60',2),
(null,'2023-04-10 14:00:20','10','60',2),
(null,'2023-04-10 14:30:20','10','60',2),
(null,'2023-04-10 15:00:20','10','60',2),
(null,'2023-04-10 15:30:20','10','60',2);

select * from dadosSensor;

select * from dadosSensor 
join sensor on iddadosSensor = fksensor;
