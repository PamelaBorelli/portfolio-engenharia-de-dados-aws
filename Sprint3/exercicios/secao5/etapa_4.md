## Etapa 4

A coluna **#1 Movie** contém o filme de maior bilheteria em que o ator atuou. Realize a contagem de aparições destes filmes no dataset, listando-os ordenados pela quantidade de vezes e que estão presentes. Considere a ordem decrescente e, em segundo nível, o nome do filme.

Ao escrever no arquivo, considere o padrão de saída **(sequência) - O filme (nome do filme) aparece (quantidade) vez(es) no dataset**, adicionando um resultado a cada linha.

```
def count_movies(dataset):
    movie_counts = {}
    # Lendo o dataset linha por linha e eliminando a primeira
    for linha in dataset[1:]:
        # A variável temporária
        filme = linha[4]
        # Se o filme já estiver no dicionário, incrementa a contagem
        if filme in movie_counts:
            movie_counts[filme] += 1
        # Se o filme não estiver no dicionário, adiciona com a contagem 1
        else:
            movie_counts[filme] = 1

    # Ordenando o dicionário pela contagem dos filmes em ordem decrescente e, em caso de empate, pelo nome do filme
    sorted_movies = sorted(movie_counts.items(), key=lambda x: (-x[1], x[0]))

    return sorted_movies

# Imprimindo os resultados
sorted_movies = count_movies(dataset)
for i, (filme, contagem) in enumerate(sorted_movies, 1):
    if contagem > 1:
        print(f'{i}. O filme {filme} aparece {contagem} vezes no dataset.')
    else:
        print(f'{i} - O filme {filme} aparece {contagem} vez no dataset.')
```