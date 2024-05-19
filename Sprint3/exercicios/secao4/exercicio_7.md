## Exercício 7
Dada a seguinte lista:

- a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

Faça um programa que gere uma nova lista contendo apenas números ímpares.

```
# Primeiro Código
# a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# lista= []

# for i in a:
#   if i % 2 !=0:
#     lista.append(i)
# print(lista)


#Segundo Código
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# Selecionando os números impares
numeros_impares = [numero for numero in a if numero % 2 != 0]
# Print da lista
print(numeros_impares)
```