## Exercício 2

Escreva um código Python que use a função **range()** para adicionar três números em uma lista **(Esta lista deve chamar-se 'números')**  e verificar se esses três números são pares ou ímpares. Para cada número, imprima como saída Par: ou Ímpar: e o número correspondente **(um linha para cada número lido).**

```
#Primeiro código
# Variável que armazena a lista de número
# numero = []

# For pra iterar os valores impares e pares
# for n in range(1,4):
#     numero.append(n)
#     if n % 2 == 0:
#       print(f'par: {n}') 
#     else:
#       print(f'impar: {n}') 


# Segundo código que foi passado na Udemy
# Variável que armazena a lista de número
numeros = list(range(1, 4))

# For pra iterar os valores impares e pares
for numero in numeros:
    if numero % 2 == 0:
        print(f"Par: {numero}")
    else:
        print(f"Ímpar: {numero}")
```