## Exercicio 1

Você está recebendo um arquivo contendo 10.000 números inteiros, um em cada linha. Utilizando lambdas e high order functions, apresente os 5 maiores valores pares e a soma destes.

Você deverá aplicar as seguintes funções no exercício:

map

filter

sorted

sum


Seu código deverá exibir na saída (simplesmente utilizando 2 comandos `print()`):


a lista dos 5 maiores números pares em ordem decrescente;

a soma destes valores.

```
with open('number.txt', 'r') as f:
    numeros = f.read().splitlines()
    #print(numeros)

# Converter cada número para int
numeros = list(map(int, numeros))

# Filtrar apenas números pares
pares = list(filter(lambda n: n % 2 == 0, numeros))

# Ordenar em ordem decrescente e pegar os 5 primeiros
top_5 = sorted(pares, reverse=True)[:5]

# Calcular a soma
soma = sum(top_5)

print(top_5)
print(soma)
```