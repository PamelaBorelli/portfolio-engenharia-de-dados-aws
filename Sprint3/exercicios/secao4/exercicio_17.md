## Exercício 17

Escreva uma função que recebe como parâmetro uma lista e retorna 3 listas:
a lista recebida dividida em 3 partes iguais. Teste sua implementação com a lista abaixo

```
# Função que divide a lista em três partes
def dividir_lista(lista):
    tamanho = len(lista)
    tamanho_parte = tamanho // 3
    # Encontra o resto da divisão
    resto = tamanho % 3
    partes = [lista[i:i+tamanho_parte] for i in range(0, tamanho - resto, tamanho_parte)]
    for i in range(resto):
        partes[i].append(lista[-(i+1)])
    # Converte as partes para strings e as une com um espaço
    return ' '.join(str(parte) for parte in partes)

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
print(dividir_lista(lista))
```