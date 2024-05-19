## Exercício 8
Verifique se cada uma das palavras da lista **['maça', 'arara', 'audio', 'radio', 'radar', 'moto']** é ou não um palíndromo.

Obs: Palíndromo é uma palavra que permanece igual se lida de traz pra frente.


É necessário que você imprima no console exatamente assim:

- A palavra: maça não é um palíndromo
- A palavra: arara é um palíndromo
- A palavra: audio não é um palíndromo
- A palavra: radio não é um palíndromo
- A palavra: radar é um palíndromo
- A palavra: moto não é um palíndromo


```
# Primeiro código
# lista = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']


# for palavra in lista:
#     # Invertendo a palavra
#     palavra_invertida = palavra[::-1]
    
#     # Imprimindo a lista com palíndromo
#     if palavra == palavra_invertida:
#         print(f"A palavra: {palavra} é um palíndromo")
#     else:
#         print(f"A palavra: {palavra} não é um palíndromo")


# Segundo código
lista = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']

# Lista verificando palíndromos
palindromo = [f"A palavra: {palavra} {'é um palíndromo' if palavra == palavra[::-1] else 'não é um palíndromo'}" for palavra in lista]

for i in palindromo:
    print(i)
```