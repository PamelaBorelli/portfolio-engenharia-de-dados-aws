## Etapa 2

Apresente a média de receita de bilheteria bruta dos principais filmes, considerando todos os atores. Estamos falando da média da coluna **'Gross'**.

```
def avg_gross(dataset):
  # Iniciando as variáveis
  total_gross = 0
  total_actors = 0
  # Lendo o dataset linha por linha e eliminando a primeira
  for linha in dataset[1:]:
    # Variáveis temporárias
    gross = float(linha[5])
    total_gross += gross
    total_actors += 1
  # encontrando a média de receita bruta dos filmes considerando todos os atores
  total_avg_gross = total_gross / total_actors
  return (total_avg_gross)

# Imprimindo os resultados
print(f'A média da receita de bilheteria bruta é {avg_gross(dataset):.2f}')
```