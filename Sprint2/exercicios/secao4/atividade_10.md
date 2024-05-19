## Exercicio  10

A comissão de um vendedor é definida a partir de um percentual sobre o total de vendas (quantidade * valor unitário) por ele realizado. O percentual de comissão de cada vendedor está armazenado na coluna perccomissao, tabela tbvendedor. 

Com base em tais informações, calcule a comissão de todos os vendedores, considerando todas as vendas armazenadas na base de dados com status concluído.

As colunas presentes no resultado devem ser vendedor, valor_total_vendas e comissao. O valor de comissão deve ser apresentado em ordem decrescente arredondado na segunda casa decimal.

```
select vendedor, valor_total_vendas, ROUND(((perccomissao * valor_total_vendas)/100), 2) as comissao
  from(
select vendedor.cdvdd, vendedor.nmvdd as vendedor, vendedor.perccomissao, SUM(qtd * vrunt) as valor_total_vendas
  from tbvendas as vendas 
  left join tbvendedor as vendedor 
  	ON vendedor.cdvdd = vendas.cdvdd
  where status = 'Concluído'
 group by vendedor.cdvdd
) as subquery
order by comissao desc
```