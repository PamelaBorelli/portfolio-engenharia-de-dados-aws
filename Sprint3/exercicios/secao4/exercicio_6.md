## Exercício 6
Considere as duas listas abaixo:

- a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89]
- b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

Escreva um programa para avaliar o que ambas as listas têm em comum **(sem repetições)**, imprimindo a lista de valores da interseção na saída padrão.

Importante:  Esperamos que você utilize o **construtor set()** em seu código.

```
a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

# Convertendo as listas a e b para conjuntos (set) e removendo duplicatas
set_a = set(a)
set_b = set(b)

# Usando a operação de interseção (&) para encontrar os números comuns entre os conjuntos a e b
numeros_comum = set_a & set_b

# Print da lista de números comuns entre a e b
print(list(numeros_comum))
```