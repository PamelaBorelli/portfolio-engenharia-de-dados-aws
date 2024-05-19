## Exercicio  3

Apresente a query para listar as 5 editoras com mais livros na biblioteca. O resultado deve conter apenas as colunas quantidade, nome, estado e cidade. Ordenar as linhas pela coluna que representa a quantidade de livros em ordem decrescente.

```
select  l.cod, e.nome, end.estado, end.cidade 
from livro as l
left join editora as e
	on l.editora = e.codeditora
left join endereco as end 
  	on e.endereco = end.codendereco
GROUP BY e.codeditora
ORDER BY quantidade DESC
LIMIT 5
```