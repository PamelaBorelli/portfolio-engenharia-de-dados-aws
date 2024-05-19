## Exercicio  5

Apresente a query para listar o nome dos autores que publicaram livros através de editoras NÃO situadas na região sul do Brasil. Ordene o resultado pela coluna nome, em ordem crescente. Não podem haver nomes repetidos em seu retorno.


```
select distinct a.nome
from autor as a 
join livro as l
	on a.codautor = l.autor
join editora as e 
	on e.codeditora = l.editora
join endereco as end 
	on e.endereco = end.codendereco
WHERE end.estado NOT IN ('RIO GANDE DO SUL', 'SANTA CATARINA', 'PARANÁ')
order by a.nome asc
```