## Exercicio  9

Apresente a query para listar o código e nome do produto mais vendido entre as datas de 2014-02-03 até 2018-02-02, e que estas vendas estejam com o status concluída. As colunas presentes no resultado devem ser cdpro e nmpro.

```
SELECT cdpro, nmpro
from(
	select produto.cdpro, vendas.nmpro, count(vendas.cdven) quantidade_vendas,
	RANK() OVER (order by count(vendas.cdven) desc) as rank
from tbestoqueproduto as produto
left join tbvendas as vendas 
	on produto.cdpro = vendas.cdpro
where vendas.dtven BETWEEN '2014-02-03' and '2018-02-02' and vendas.status = 'Concluído'
group by produto.cdpro
)as subquery
where rank = 1
```