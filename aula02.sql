use db_video_locadora;

show tables;

insert into tbl_sexo(sigla, descricao) values('F', 'Feminino');

insert into tbl_sexo(sigla, descricao) values('M', 'Masculino');

select * from tbl_sexo; 

insert into tbl_classificacao (nome, classificacao, caracteristicas)
	values('L', 'Livre', 'Não expõe crianças a conteúdos potencialmente prejudiciais.'),
    ('10', 'Exibição em qualquer horário','Conteúdo violento ou linquagem inapropriada para criancas, ainda que em menor intensidade.'),
    ('12', 'Não recomendado para menores de 12 anos','As cenas podem conter agressão física, consumo de drogas e insinuação sexual.'),
    ('14', 'Não recomendado para menores de 14 anos','Conteúdos mais acentuados com violência e ou linguagem sexual.'),
    ('16', 'Não recomendado para menores de 16 anos','Conteúdos de sexo ou violência mais intensos, com cenas de tortura, suicídio, estupro ou nudez total.'),
    ('18', 'Não recomendado para menores de 18 anos','Conteúdos violentos e sexuais extremos. Cenas de sexo, incesto ou atos repetidos de tortura, multilação ou abuso sexual.');

desc tbl_ator_diretor;

alter table tbl_classificacao 
	modify column classificacao varchar(80),
    modify column caracteristicas varchar(150);
    
    
select * from tbl_classificacao; 

#Update
update tbl_classificacao set nome = 'LI';
update tbl_classificacao set classificacao = ' ';

#Delete
delete from tbl_classificacao;

insert into tbl_ator_diretor(nome, nome_artistico, data_nascimento, data_falecimento, foto, id_sexo)
	values  ('Roger Allers', null, '1949-06-29', null, 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/91/54/06/20150846.jpg', 2),
			('Robert R. Minkoff', 'Rob Minkoff', '1962-08-11', null, 'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/91/54/07/20150847.jpg',2),
            ('Manoel Garcia Júnior', 'Gárcia Júnior', '1967-03-2',null, 'https://br.web.img2.acsta.net/c_310_420/pictures/14/01/16/13/52/556410.jpg', 2),
            ('Matthew Broderick', null, '1962-03-21', null, 'https://br.web.img2.acsta.net/c_310_420/pictures/19/07/02/22/47/0236519.jpg', 2),
            ('James Earl Jones', null, '1931-01-17', null, 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/55/34/20040970.jpg',2);

            
            
insert into tbl_ator(quantidade_filmes, biografia, ano_inicio_carreira, id_ator_diretor)
	values(9,'Roger Allers é um diretor, roteirista, artista de storyboard, cartunista e dramaturgo americano. Ele é mais conhecido por co-dirigir o filme de animação tradicional de maior bilheteria na história, O Rei Leão da Walt Disney Animation Studios, e por escrever a adaptação da Broadway, O Rei Leão.',1988,5),
		  ( , '', , ),
          ( , '', , ),
          ( , '', , ),
          ( , '', , );



insert into tbl_diretor(quantidade_filmes, biografia, ano_inicio_carreira, id_ator_diretor)
	values(72, 'Em 1969, fundou juntamente com George Lucas a produtora American Zoetrope, em São Francisco, tendo como primeiro projeto o filme THX 1138 (1970);- É tio do ator Nicolas Cage;- Pai da tambem diretora Sofia Coppola;- Foi assistente de direção de Roger Corman;- Graduado na Universidade da Califórnia (UCLA), a mesma dos diretores, George Lucas e Steven Spielberg.', 1962,4);
    
insert into tbl_ator_diretor_nacionalidade(id_nacionalidade, id_ator_diretor)
	values  (1, 1),
			(1, 2),
			(1, 3),
            (1, 4);
    
insert into tbl_nacionalidade(nome)
	values('Americano');
    

    
insert into tbl_filme(nome, nome_original, duracao, sinopse, data_lancamento, data_relancamento, foto_capa, id_classificacao)
	values('O poderoso chefão', 'The Godfather', '02:55:00','Don Vito Corleone (Marlon Brando) é o chefe de uma "família" de Nova York que está feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo). Porém, durante a festa, Bonasera (Salvatore Corsitto) é visto no escritório de Don Corleone pedindo "justiça", vingança na verdade contra membros de uma quadrilha, que espancaram barbaramente sua filha por ela ter se recusado a fazer sexo para preservar a honra. Vito discute, mas os argumentos de Bonasera o sensibilizam e ele promete que os homens, que maltrataram a filha de Bonasera não serão mortos, pois ela também não foi, mas serão severamente castigados. Vito porém deixa claro que ele pode chamar Bonasera algum dia para devolver o "favor". Do lado de fora, no meio da festa, está o terceiro filho de Vito, Michael (Al Pacino), um capitão da marinha muito decorado que há pouco voltou da 2ª Guerra Mundial. Universitário educado, sensível e perceptivo, ele quase não é notado pela maioria dos presentes, com exceção de uma namorada da faculdade, Kay Adams (Diane Keaton), que não tem descendência italiana mas que ele ama. Em contrapartida há alguém que é bem notado, Johnny Fontane (Al Martino), um cantor de baladas românticas que provoca gritos entre as jovens que beiram a histeria. Don Corleone já o tinha ajudado, quando Johnny ainda estava em começo de carreira e estava preso por um contrato com o líder de uma grande banda, mas a carreira de Johnny deslanchou e ele queria fazer uma carreira solo. Por ser seu padrinho Vito foi procurar o líder da banda e ofereceu 10 mil dólares para deixar Johnny sair, mas teve o pedido recusado. Assim, no dia seguinte Vito voltou acompanhado por Luca Brasi (Lenny Montana), um capanga, e após uma hora ele assinou a liberação por apenas mil dólares, mas havia um detalhe: nas "negociações" Luca colocou uma arma na cabeça do líder da banda. Agora, no meio da alegria da festa, Johnny quer falar algo sério com Vito, pois precisa conseguir o principal papel em um filme para levantar sua carreira, mas o chefe do estúdio, Jack Woltz (John Marley), nem pensa em contratá-lo. Nervoso, Johnny começa a chorar e Vito, irritado, o esbofeteia, mas promete que ele conseguirá o almejado papel. Enquanto a festa continua acontecendo, Don Corleone comunica a Tom Hagen (Robert Duvall), seu filho adotivo que atua como conselheiro, que Carlo terá um emprego mas nada muito importante, e que os "negócios" não devem ser discutidos na sua frente. Os verdadeiros problemas começam para Vito quando Sollozzo (Al Lettieri), um gângster que tem apoio de uma família rival, encabeçada por Phillip Tattaglia (Victor Rendina) e seu filho Bruno (Tony Giorgio). Sollozzo, em uma reunião com Vito, Sonny e outros, conta para a família que ele pretende estabelecer um grande esquema de vendas de narcóticos em Nova York, mas exige permissão e proteção política de Vito para agir. Don Corleone odeia esta idéia, pois está satisfeito em operar com jogo, mulheres e proteção, mas isto será apenas a ponta do iceberg de uma mortal luta entre as "famílias".','1972-07-07', '2022-02-24','https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/90/93/20/20120876.jpg', 10);
    


    
insert into tbl_genero(nome)
	values  ('Policial'),
			('Drama');
            
insert into tbl_filme_genero(id_filme, id_genero)
	values  (1, 1),
			(1, 2); 	





