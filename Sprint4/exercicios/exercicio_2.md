## Exercicio 2

Utilizando high order functions, implemente o corpo da função conta_vogais. O parâmetro de entrada será uma string e o resultado deverá ser a contagem de vogais presentes em seu conteúdo.


É obrigatório aplicar as seguintes funções:

len

filter

lambda

Desconsidere os caracteres acentuados. Eles não serão utilizados nos testes do seu código.


```
# Função qeu conta as vogais
def conta_vogais(texto:str)-> int:
    # variável qu define as vogais
    vogais = 'aeiou'
    # converte o texto para minúsculas
    texto = texto.lower()  
    # filtra as vogais
    vogais = list(filter(lambda v: v in vogais, texto))
    print(vogais)
    return len(vogais)

# texto que setá passado para a função
print(conta_vogais("Ola mundo, este e um importante teste"))
```