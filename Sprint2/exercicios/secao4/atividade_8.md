## Exercicio  8

Apresente a query para listar o código e o nome do vendedor com maior número de vendas (contagem), e que estas vendas estejam com o status concluída.  As colunas presentes no resultado devem ser, portanto, cdvdd e nmvdd

```
SELECT cdvdd, nmvdd
FROM (
    SELECT vendedor.cdvdd, vendedor.nmvdd, COUNT(vendas.cdven) AS quantidade_vendas, vendas.status,
           RANK() OVER (ORDER BY COUNT(vendas.cdven) DESC) as rank
    FROM tbvendedor AS vendedor 
    LEFT JOIN tbvendas AS vendas 
        ON vendedor.cdvdd = vendas.cdvdd
    WHERE vendas.status = 'Concluído'
    GROUP BY vendedor.cdvdd, vendas.status
) AS subquery
WHERE rank = 1
```