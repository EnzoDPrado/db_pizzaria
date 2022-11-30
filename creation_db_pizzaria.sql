#Criacao do dataBase da pizzaria
create database db_la_pizzaria;

use db_la_pizzaria;

##########################################
#************TABELAS DE PIZZAS***********#
##########################################

#Criacao da tabela de sabor da pizza
create table tbl_sabor_pizza (
	id int not null auto_increment primary key,
	sabor varchar(50),
	unique index(id)
);

#Criacao da tabela de ingredients da pizza
create table tbl_ingredientes_pizza(
	id int not null auto_increment primary key,
    ingrediente varchar(35) not null,
    unique index(id)
);

#Criacao da tabela de pizza
create table tbl_pizza (
	id int not null auto_increment primary key,
    preco double not null,
    id_sabor_pizza int not null,
    constraint FK_sabor_pizza_pizza
		foreign key(id_sabor_pizza)
        references tbl_sabor_pizza (id),
	id_ingrediente int not null,
	constraint FK_ingredientes_pizza_pizza
			foreign key(id_ingrediente)
            references tbl_ingredientes_pizza(id),
	unique index(id)	
);

#Criacao da tabela de promocao das pizzas
create table tbl_promocao_pizza(
	id int not null auto_increment primary key,
    preco double not null,
    id_pizza int not null,
		constraint FK_pizza_promocao_pizza
        foreign key(id_pizza)
        references tbl_pizza(id),
	unique index(id)
);

#Criacao da tabela de pizzas favoritas
create table tbl_pizza_favorito(
	id int not null auto_increment primary key,
    id_pizza int not null,
		constraint FK_pizza_pizza_favorito
        foreign key(id_pizza)
        references tbl_pizza(id),
	unique index(id)
);

##########################################
#************TABELAS DE BEBIDAS**********#
##########################################

#Criacao da tabela do tipo de bebidas
create table tbl_tipo_bebida(
	id int not null auto_increment primary key,
    tipo varchar(75) not null,
    unique index(id)
);

#Criacao da tabela de sabor da bebida
create table tbl_sabor_bebida(
	id int not null auto_increment primary key,
    sabor varchar(45),
    unique index(id)
);

#Criacao da tabela de marca da bebida
create table tbl_marca_bebida(
	id int not null auto_increment primary key,
    marca varchar(50) not null,
	unique index(id)
);

create table tbl_volume_bebida(
	id int not null auto_increment primary key,
    volume varchar(7) not null,
    unique index(id)
);

create table tbl_bebida(
	id int not null auto_increment primary key,
    preco double not null,
    id_tipo_bebida int not null,
		constraint FK_tipo_bebida_bebida
		foreign key(id_tipo_bebida)
        references tbl_tipo_bebida(id),
	id_volume_bebida int not null,
		constraint FK_volume_bebida_bebida
        foreign key (id_volume_bebida)
        references tbl_volume_bebida(id),
	id_marca_bebida int not null,
		constraint FK_marca_bebida_bebida
        foreign key (id_marca_bebida)
        references tbl_marca_bebida(id),
	id_sabor_bebida int not null,
		constraint FK_sabor_bebida_bebida
        foreign key(id_sabor_bebida)
        references tbl_sabor_bebida(id),
	unique index(id)
);

create table tbl_promocao_bebida(
	id int not null auto_increment primary key,
    preco_promocao double not null,
    id_bebida int not null,
		constraint FK_bebida_promocao_bebida
        foreign key (id_bebida)
        references tbl_bebida(id),
	unique index(id)
);

##########################################
#************TABELA DE CARDAPIO**********#
##########################################

create table tbl_cardapio(
	id int not null auto_increment primary key,
    unidade varchar(50) not null,
    id_pizza int not null,
		constraint FK_pizza_cardapio
        foreign key(id_pizza)
        references tbl_pizza(id),
	id_bebida int not null,
		constraint FK_bebida_cardapio
        foreign key(id_bebida)
		references tbl_bebida(id),
	id_promocao_pizza int not null,
		constraint FK_promocao_pizza_cardapio_cardapio 
        foreign key(id_promocao_pizza)
        references tbl_promocao_pizza(id),
	id_promocao_bebida int not null,
		constraint FK_promocao_pizza_cardapio
        foreign key(id_promocao_bebida)
        references tbl_promocao_bebida(id),
	id_pizza_favorito int not null,
		constraint FK_pizza_favorito_cardapio
        foreign key(id_pizza_favorito)
        references tbl_pizza_favorito(id),
	unique index(id)
);

##########################################
#****TABELAS DE CONTROLE DA PIZZARIA*****#
##########################################

create table tbl_pizzaria(
	id int not null auto_increment primary key, 
    nome varchar(50) not null,
    rua varchar(45) not null,
    bairro varchar(45) not null,
    cep varchar(12) not null,
	id_cardapio int not null,
		constraint FK_cardapio_pizzaria
        foreign key(id_cardapio)
		references tbl_cardapio(id),
	unique index(id)
);


create table tbl_funcionario(
	id int not null auto_increment primary key,
    nome varchar(200) not null,
    email varchar(100) not null,
    telefone varchar(18) not null,
    senha varchar(100) not null,
    foto varchar(200),
    id_pizzaria int not null,
		constraint FK_pizzaria_funcionario
        foreign key(id_pizzaria)
        references tbl_pizzaria(id),
	unique index(id)
);

create table tbl_contato(
	id int not null auto_increment primary key,
    nome varchar(200) not null,
    telefone varchar(18),
    celular varchar(18) not null,
    email varchar(100) not null,
    mensagem text not null,
    id_pizzaria int not null,
		constraint FK_pizzaria_contato
        foreign key(id_pizzaria)
        references tbl_pizzaria(id),
	unique index(id)
);




























