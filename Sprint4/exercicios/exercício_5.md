## Exercício 5

Um determinado sistema escolar exporta a grade de notas dos estudantes em formato CSV. Cada linha do arquivo corresponde ao nome do estudante, acompanhado de 5 notas de avaliação, no intervalo [0-10]. É o arquivo estudantes.csv de seu exercício.

Precisamos processar seu conteúdo, de modo a gerar como saída um relatório em formato textual contendo as seguintes informações:

- Nome do estudante

- Três maiores notas, em ordem decrescente

- Média das três maiores notas, com duas casas decimais de precisão

O resultado do processamento deve ser escrito na saída padrão (print), ordenado pelo nome do estudante e obedecendo ao formato descrito a seguir:

```
Nome: <nome estudante> Notas: [n1, n2, n3] Média: <média>
```

Exemplo:

```
Nome: Maria Luiza Correia Notas: [7, 5, 5] Média: 5.67
Nome: Maria Mendes Notas: [7, 3, 3] Média: 4.33
```

Em seu desenvolvimento você deverá utilizar lambdas e as seguintes funções:

- round

- map

- sorted

```
import csv

def processa_notas(notas):
    # Ordena as notas em ordem decrescente
    notas = sorted(notas, reverse=True)
    # Pega as três maiores notas
    max_notas = notas[:3]
    # Calcula a média das três maiores notas
    media = sum(max_notas) / len(max_notas)
    # Arredonda a média com duas casas decimais
    media = round(media, 2)
    return max_notas, media

# Abre o csv
with open('estudantes.csv', 'r') as f:
    reader = csv.reader(f)
    estudantes = list(reader)

# Ordena a lista de estudantes em ordem alfabética
estudantes = sorted(estudantes, key=lambda x: x[0])


# Processa as notas de cada estudante
for estudante in estudantes:
    nome = estudante[0]
    notas = list(map(int, estudante[1:]))
    max_notas, media = processa_notas(notas)
    print(f'Nome: {nome} Notas: {max_notas} Média: {media}')
```