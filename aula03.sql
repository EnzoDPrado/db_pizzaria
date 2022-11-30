#Estrutura basica do SELECT

#Retorna todas as colunas (*) e todos os registros
select * from tbl_filme;
select tbl_filme .* from tbl_filme;

#Retorna apenas os atributos selecionados de todos os registros
select nome, duracao, data_lancamento 
	from tbl_filme;
    

#Filtro pelo ID
select * from tbl_filme where id = 1;

#Filtro por outros atributos
#Retorna apenas os filmes com a mesma escrita 
select * from tbl_filme 
	where nome = 'Poderoso';
    
#Retorna apenas os filmes com a mesma escrita
select * from tbl_filme 
	where nome like 'Poderoso';
    
#Retorna os filmes que terminam com a palavra chave(Poderoso)
select * from tbl_filme 
	where nome like '%Poderoso';
    
#Retorna os filmes que começam com a palavra chave(Poderoso)    
select * from tbl_filme 
	where nome like 'Poderoso%';
    
#Retorna os filmes que contem a palavra chave no nome(Poderoso)
select * from tbl_filme 
	where nome like '%Poderoso%';
    
#Ordenação
select * from tbl_filme order by nome asc;    #Ordenação Crescente 
select * from tbl_filme order by nome desc;   #Ordenação Decrescente

select * from tbl_filme order by nome, nome_original desc;
select * from tbl_filme order by nome asc, nome_original desc;


select * from tbl_filme where data_lancamento < '1990-12-31';   #menor
select * from tbl_filme where data_lancamento >'1990-12-31'; 	#maior
select * from tbl_filme where data_lancamento <= '1990-12-31';  #menor ou igual
select * from tbl_filme where data_lancamento >= '1990-12-31'; 	#maior ou igual
select * from tbl_filme where data_lancamento <> '1990-12-31'; 	#diferente	

#Operadores logicos
	#Ordem de execução: 
    #0 - ( )
    #1 - not  (NÃO)	
    #2 - and  (E)
    #3 - or	  (OU)

#Exemplo com and (ou)
select * from tbl_filme where nome like 'A%' and data_lancamento < '2010-01-01';

select * from tbl_filme where nome like 'a%' or nome like 'o%';

select * from tbl_filme where nome like 'a%' or nome_original like 'a%' or 
											nome like 'o%' or nome_original like 'o%' and
                                            data_lancamento < 2010-01-01

