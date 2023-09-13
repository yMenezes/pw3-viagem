Create Database Condominio;

use Condominio;

drop table Reserva;

create table Condominio(
id_condominio integer IDENTITY(1,1) primary key,
nome_condominio varchar(30) not null,
endereco varchar(30) not null,
status_ varchar(30) not null 
);
create table Apartamento(
id_apartamento integer IDENTITY(1,1) primary key,
telefone_apartamento varchar(30) not null,
numero varchar(30) not null,
status_ varchar(30) not null,
id_condominio_apart integer foreign key references Condominio(id_condominio)
);

create table pessoa_apartamento(
id_pessoa_rela integer  foreign key references Pessoa(id_pessoa),
id_apartamento_rela integer foreign key references Apartamento(id_apartamento)
);

create table Pessoa(
id_pessoa integer IDENTITY(1,1) primary key,
nome_pessoa varchar(30) not null,
cpf_pessoa char(11) not null,
perfil_pessoa varchar(11) not null,
telefone_pessoa varchar(30) not null,
status_pessoa varchar(30) not null,
id_apartamento_pessoa integer foreign key references Apartamento(id_apartamento),
id_cond_pessoa integer foreign key references Condominio(id_condominio)
);
create table Reserva(
id_reserva integer IDENTITY(1,1) primary key,
data_reserva date not null,
status_ varchar(30) not null,
id_pessoa_reser integer  foreign key references Pessoa(id_pessoa),
id_areacomum_reser integer foreign key references AreaComum(id_areacomum)
);


create table AreaComum(
id_areacomum integer IDENTITY(1,1) primary key,
nome_areacomum varchar(30) not null,
capacidade numeric(10) not null,
status_ varchar(30) not null
);
create table Entrega(
id_entrega integer IDENTITY(1,1) primary key,
remetente varchar(30) not null,
data_entrega date not null,
data_retirada date,
status_ varchar(30) not null,
id_pessoa_entre integer foreign key references Pessoa(id_pessoa)
);
create table Usuario(
id_usuario integer IDENTITY(1,1) primary key,
nome varchar(30) not null,
email varchar(30) not null,
senha_hash varchar(30) not null,
senha_salt varchar(30) not null,
red_senha varchar(30),
dat_env_cod varchar(30),
id_pessoa_usuar integer foreign key references Pessoa(id_pessoa)
);



select * from Pessoa;
select * from AreaComum;
select * from Entrega;
select * from Sindico;
select * from Apartamento;
select * from Condominio;
select * from Usuario_mor;
select * from pessoa_apartamento;
select * from Reserva;
drop table Entrega;

insert into Condominio values('aguas amarelas','Rua Super', 'ativo');
insert into Apartamento values('112','1','ativo',1);
insert into Pessoa(nome_pessoa, cpf_pessoa, perfil_pessoa, telefone_pessoa, status_pessoa, id_cond_pessoa) values('Adalberto','12345678912','113as','12121','vivo',1);
insert into Pessoa (nome_pessoa, cpf_pessoa, perfil_pessoa, telefone_pessoa, status_pessoa, id_apartamento_pessoa) values('Alberto','12345678912','113as','12121','vivo',1);
insert into Reserva values('05-25-2023','Ativo',1,2);						
insert into AreaComum values('Sal o',11,'Ativo');								
insert into Entrega values('Gilberto','11-09-1945','11-09-1946','Ativo',1);
insert into Usuario values('Roberto','Robertinho@gmail.com','a','a','','',1);
insert into pessoa_apartamento values(4,1);

--Nome do Condominio com o Sindico
select p.nome_pessoa, c.nome_condominio, cpf_pessoa from Pessoa as p
inner join Condominio as c on p.id_cond_pessoa = c.id_condominio;


select p.nome_pessoa, c.nome_condominio from Pessoa as p
inner join Condominio as c on p.id_cond_pessoa = c.id_condominio;

--Numero do Apartamento em qual condominio
select a.numero, c.nome_condominio from Apartamento as a
inner join Condominio as c on a.id_apartamento = c.id_condominio;

--Nome do Morador e a Area que ele reservou

select a.nome_areacomum, p.nome_pessoa from Reserva as r
inner join Pessoa as p on r.id_areacomum_reser = p.id_pessoa
inner join AreaComum as a on r.id_areacomum_reser = a.id_areacomum;


select p.nome_pessoa, a.telefone_apartamento from pessoa_apartamento as r
inner join Pessoa as p on r.id_pessoa_rela = p.id_pessoa
inner join Apartamento as a on r.id_apartamento_rela = a.id_apartamento;

--Nome do morador e sua entrega
select e.id_entrega, p.nome_pessoa from Entrega as e
inner join Pessoa as p on e.id_entrega = p.id_pessoa;

--Nome do usuario e morador
select u.nome, p.nome_pessoa, u.email, u.dat_env_cod from Usuario as u inner join Pessoa as p on u.id_usuario = p.id_pessoa where id_apartamento_pessoa = 1;

UPDATE Pessoa
SET nome_pessoa = 'Adalberta'
WHERE id_pessoa=4;

select u.nome from Usuario as u
in