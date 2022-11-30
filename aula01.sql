#Permite criar um database
create database db_video_locadora;

#Permite visualizar TODOS databases no banco
show databases;

#Apaga o database que você criou
drop database db_video_locadora;

#Permite escolher qual o database será utilizado
use db_video_locadora;

#Permite visualizar as tabelas existentes no data base
show tables;

#Comandos para visualizar a estrutura de uma tabela
desc tbl_genero;        #Exemplo1 
describe tbl_genero;    #Exemplo2 

#Criando a tabela de genero 
create table tbl_genero(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    unique index(id)
);

#Tabela de Classificacao
create table tbl_classificacao(
	id int not null auto_increment,
    nome varchar(20) not null,
    classificacao varchar(45) not null,
    caracteristicas varchar(80) not null,
    unique index(id),
    primary key(id) # <----- Criar a PK no final
);

#Tabela de nacionalidade
create table tbl_nacionalidade(
	id int not null auto_increment primary key,
	nome varchar(200) not null,
	unique index(id)
);

#Tabela de sexo
create table tbl_sexo(
	id int not null auto_increment primary key,
    sigla varchar(6) not null,
    descricao varchar(30),
    unique index(id)
);

#Permite apagar um atributo de uma tabela
alter table tbl_sexo drop column descricao;

#Permite criar um atributo novo a uma tabela
alter table tbl_sexo add column descricao varchar(30);

#Permite modificar um atributo de uma tabela
alter table tbl_sexo modify column descricao varchar(30) not null;

#Tambem permite modificar um atributo de uma tabela porem ele remodifica o nome do atributo
alter table tbl_sexo change descricao descricao varchar(30) not null;

#Tabela de filme
create table tbl_filme(
	id int not null auto_increment primary key,
	nome varchar(50) not null,
    nome_original varchar(45),
	duracao time,
	sinopse text, 
	data_lancamento date not null, 
	data_relancamento date,
	foto_capa varchar(200),
    id_classificacao int not null, #Atributo para receber Foreing Key
	constraint FK_classificacao_filme #É apenas um nome para FK
		foreign key(id_classificacao)  #Identifica quem será a FK
		references tbl_classificacao (id), #De onde virá a PK
        unique index(id)
);

drop table tbl_classificacao;

#Permite apagar uma constraint (um relacionamento) de uma tabela
alter table tbl_filme drop foreign key FK_classificacao_filme;

#Permite adicionar uma constraint (relacionamento)
alter table tbl_filme
	add constraint FK_classificacao_filme
	foreign key(id_classificacao)
    references tbl_classificacao(id);
    
    
create table tbl_filme_genero(
id int not null auto_increment primary key,
id_filme int not null,
	constraint FK_filme_filme_genero
    foreign key(id_filme)
    references tbl_filme(id),
id_genero int not null,
	constraint FK_genero_filme_genero
    foreign key(id_genero)
    references tbl_genero(id),
unique index(id)
);

create table tbl_ator_diretor(
id int not null auto_increment primary key,
nome varchar(80) not null, 
nome_artistico varchar(45),
data_nascimento date not null,
data_falecimento date, 
foto varchar(200),
id_sexo int not null, 
	constraint FK_sexo_ator_diretor
    foreign key(id_sexo)
    references tbl_sexo(id),
unique index(id)
);

create table tbl_diretor(
id int not null auto_increment primary key,
quantidade_filmes int,
biografia text,
ano_inicio_carreira year, 
id_ator_diretor int not null,
	constraint FK_ator_diretor_diretor
    foreign key(id_ator_diretor)
    references tbl_ator_diretor(id),
unique index(id)
);

create table tbl_ator(
id int not null auto_increment primary key,
quantidade_filmes int,
biografia text,
ano_inicio_carreira year,
id_ator_diretor int not null,
	constraint FK_ator_diretor_ator
    foreign key(id_ator_diretor)
    references tbl_ator_diretor(id),
unique index(id)
);
    
create table tbl_filme_diretor(
id int not null auto_increment primary key,
id_filme int not null,
	constraint FK_filme_filme_diretor
    foreign key(id_filme)
    references tbl_filme(id),
id_diretor int not null,
	constraint FK_diretor_filme_diretor
    foreign key(id_diretor)
    references tbl_diretor(id),
unique index(id)
);

create table tbl_filme_ator(
id int not null auto_increment primary key,
id_ator int not null,
	constraint FK_ator_filme_ator
    foreign key(id_ator)
    references tbl_ator(id),
id_filme int not null, 
	constraint FK_filme_filme_ator
    foreign key(id_filme)
    references tbl_filme(id),
unique index(id)
);

create table tbl_ator_diretor_nacionalidade(
id int not null auto_increment primary key,
id_nacionalidade int not null,
	constraint FK_nacionalidade_ator_diretor_nacionalidade
    foreign key (id_nacionalidade)
	references tbl_nacionalidade(id),
id_ator_diretor int not null,
	constraint FK_ator_diretor_ator_diretor_nacionalidade
    foreign key(id_ator_diretor)
    references tbl_ator_diretor(id),
unique index(id)
);







