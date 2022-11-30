use db_video_locadora;
#TRABALHANDO COM DATA E HORA

#Retorna a data atual do servidor
select curdate() as data_atual;
select current_date() as data_atual;

#Retorna a hora atual do servidor
select curtime() as hora_atual;
select current_time() as hora_atual;

#Retorna a data e a hora atual do servidor 
select current_timestamp() as data_hora_atual;

#Funções para formatar a hora
# %H - retorna a hora de 0 a 23
# %h - retorna a hora de 0 a 12
# %i - retorna os minutos
# %s - retorna os segundos
# %r - retorna a hora de 0 a 12 em AM ou PM
select time_format(current_time(),'%H' )as hora;
select time_format(current_time(),'%h' )as hora;
select time_format(current_time(),'%i' )as minuto;
select time_format(current_time(),'%s' )as segundo;
select time_format(current_time(),'%r' )as hora_completa;
select time_format(current_time(),'%T' )as hora;

#Função para retornar somente hora, minuto e segundo 
select hour(current_time()) as hora;
select minute(current_time()) as minute;
select second(current_time()) as segundo;

#Função para formatar a data date_format
# %W - retorna o dia da semana
# %w - retorna o dia da semana em numeral(0 = domingo .... 6 = sabado
# %a - retorna as primeiras 3 letras do dia da semana (ex: TUEsday)
# %m - retorna o mes da data(1 = janeiro e 12 = dezembro)
# %M - retorna o mes da data por escrito
# %b - retorna o mes da data por escrito abreviado
# %d - retorna o dia da data
# %d - retorna o dia em numero ordinal(primeiro, segundo, terceiro, quarto e etc...)
# %y - retorna o ano da data com 2 digitos
# %Y - retorna o ano da data com 4 digitos
select date_format(current_date(), '%W');
select date_format(current_date(), '%w');
select date_format(current_date(), '%a');
select date_format(current_date(), '%m');
select date_format(current_date(), '%b');
select date_format(current_date(), '%d');
select date_format(current_date(), '%D');
select date_format(current_date(), '%y');
select date_format(current_date(), '%Y');

select date_Format(current_date(), '%d/%m/%Y');

#Funcao para retornar somente o dia, mes e ano
select day(current_date());
select month(current_date());
select year(current_date());

#Funcoes para calcular diferença de datas e horas
select timediff('13:00:00', '10:00:00')  as qtdeHoras; 
select concat('R$', ((datediff('2022-11-21', '2022-11-22') * 30) *-1)) as ValorPagar; 

#Retorna somente a parte da data
select date(current_timestamp());

#Retorna somente a parte da hora
select time(current_timestamp());

######## Realizando Calculas ######
select count(*) as qtdeFilmes from tbl_filme;
select concat('Existe(m) ', count(*), 'filme(s) cadastrados, e custou', count(*) * 30.90, 'reais para a video locadora.') as resultado from tbl_filme;

alter table tbl_filme add column qtde int; 

update tbl_filme set qtde = 15 where id = 1;

#Soma valores de uma coluna
select sum(qtde) as soma from tbl_filme;

#Media de valores de uma coluna
select avg(qtde) as media from tbl_filme;

#ROUND - permite arredondar e limitar a qtde de casas decimais
select round (avg(qtde),1) as media from tbl_filme;

#Retornar o menor e o maior valor
select min(qtde) as minimo from tbl_filme;
select max(qtde) as maximo from tbl_filme;

#Between - retorna dados que estao entre dois valores(range valores)
#not between - retorna dados que NÃO estão entre dois valores
select id, nome, sinopse, qtde, (qtde * 4.60) as valorTotal from tbl_filme where qtde between 4 and 8;

#in- Retorna dados conforme uma sequencia de valores(ele substitui o operador logico OR)
#not in - retorna dados que NAO estao na sequencia de valores(ele substitui o operador logico OR)
select id, nome, sinopse, qtde, (qtde * 4.60) as valorTotal from tbl_filme where qtde in(2, 4, 6, 8, 10);
 
