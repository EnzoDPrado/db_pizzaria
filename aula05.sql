use db_video_locadora;

show tables;

select * from tbl_filme;
select * from tbl_genero;
select * from tbl_filme_genero; 

#Relacionamento pelo Where
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento, 
	tbl_genero.nome as nome_genero
from tbl_filme, tbl_genero, tbl_filme_genero
where tbl_filme.id = tbl_filme_genero.id_filme and 
tbl_genero.id = tbl_filme_genero.id_genero;




#Relacionamento pelo from
#Inner Join
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento, 
	tbl_genero.nome as nome_genero,
    tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao
from tbl_filme
	inner join tbl_filme_genero
		on tbl_filme.id = tbl_filme_genero.id_filme
	inner join tbl_genero
		on tbl_genero.id = tbl_filme_genero.id_genero
	inner join tbl_classificacao
		on tbl_classificacao.id = tbl_filme.id_classificacao
order by tbl_filme.nome; 


#Exemplo 02 de INNER JOIN
#OBS: existem atores que nao foram relacionados com a nacionalidade, assim 
	 #o inner join nao consegue trazer os dados desses atores
select tbl_filme.nome as nomeFilme, tbl_filme.sinopse, 
		tbl_genero.nome as nomeGenero,
        tbl_classificacao.nome as nomeClassificacao, tbl_classificacao.classificacao,
        tbl_classificacao.caracteristicas,
        tbl_ator_diretor.nome as nomeAtor, tbl_ator_diretor.nome_artistico,
        tbl_nacionalidade.nome as nomeNacionalidaideAtorh
	
    from tbl_filme
			inner join tbl_filme_genero
				on tbl_filme.id = tbl_filme_genero.id_filme
			inner join tbl_genero
				on tbl_genero.id = tbl_filme_genero.id_genero
			inner join tbl_classificacao
				on tbl_classificacao.id = tbl_filme.id_classificacao
			left join tbl_filme_ator
				on tbl_filme.id = tbl_filme_ator.id_filme
			left join tbl_ator
				on tbl_ator.id = tbl_filme_ator.id_ator
			left join tbl_ator_diretor
				on tbl_ator_diretor.id = tbl_ator.id_ator_diretor
			left join tbl_ator_diretor_nacionalidade 
				on tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
			left join tbl_nacionalidade
				on tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
                
#Exemplo 01 de LEFT JOIN
#OBS: usando o left join conseguimos ter no resultado os atores que nao tinham
	  #relacao com a nacionalidade e campos que faltavam
select tbl_filme.nome as nomeFilme, tbl_filme.sinopse, 
		tbl_genero.nome as nomeGenero,
        tbl_classificacao.nome as nomeClassificacao, tbl_classificacao.classificacao,
        tbl_classificacao.caracteristicas,
        tbl_ator_diretor.nome as nomeAtor, tbl_ator_diretor.nome_artistico,
        tbl_nacionalidade.nome as nomeNacionalidaideAtorh
	
    from tbl_filme
			inner join tbl_filme_genero
				on tbl_filme.id = tbl_filme_genero.id_filme
			inner join tbl_genero
				on tbl_genero.id = tbl_filme_genero.id_genero
			inner join tbl_classificacao
				on tbl_classificacao.id = tbl_filme.id_classificacao
			left join tbl_filme_ator
				on tbl_filme.id = tbl_filme_ator.id_filme
			left join tbl_ator
				on tbl_ator.id = tbl_filme_ator.id_ator
			left join tbl_ator_diretor
				on tbl_ator_diretor.id = tbl_ator.id_ator_diretor
			left join tbl_ator_diretor_nacionalidade 
				on tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
			left join tbl_nacionalidade
				on tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
                
                
                
                
                
                
	#INNER JOIN- retorna apenas os registros que possuem relação em ambos
    #os lados da relação
    select tbl_ator_diretor.nome as nomeAtor, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nomeNacionalidade
	from tbl_ator_diretor
		inner join tbl_ator_diretor_nacionalidade
			on tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
		inner join tbl_nacionalidade
			on tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
            
            
	#LEFT JOIN- retorna todos o
       select tbl_ator_diretor.nome as nomeAtor, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nomeNacionalidade
	from tbl_ator_diretor
		inner join tbl_ator_diretor_nacionalidade
			on tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
		left join tbl_nacionalidade
			on tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
                
	#RIGHT JOIN- retorna todos os registros que possuem relação em abos
    #os lados da relação e que na tabela da direita possue dados e que nao
    #foi relacionado com a tabela da esquerda
           select tbl_ator_diretor.nome as nomeAtor, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nomeNacionalidade
	from tbl_ator_diretor
		inner join tbl_ator_diretor_nacionalidade
			on tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
		left join tbl_nacionalidade
			on tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
            
 
 
 #UNION-permite unir o resultado de dois ou mais scripts SQL
 #OBS: para ele funcionar, a qtde de colunas e os nomes das colunas precisam ser exatamente iguais
