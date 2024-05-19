## Exercicio  6
Apresente a query para listar o autor com maior número de livros publicados. O resultado deve conter apenas as colunas codautor, nome, quantidade_publicacoes.

```
SELECT a.codautor, a.nome, COUNT(l.cod) AS quantidade_publicacoes
FROM autor AS a 
JOIN livro AS l ON a.codautor = l.autor
GROUP BY a.codautor
HAVING COUNT(l.cod) = (
    SELECT MAX(quantidade_publicacoes)
    FROM (
        SELECT COUNT(l.cod) AS quantidade_publicacoes
        FROM autor AS a 
        JOIN livro AS l ON a.codautor = l.autor
        GROUP BY a.codautor
    ) AS subquery
)
```