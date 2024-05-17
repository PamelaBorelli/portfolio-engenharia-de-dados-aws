## Exercício 7

Generators são poderosos recursos da linguagem Python. Neste exercício, você deverá criar o corpo de uma função, cuja assinatura já consta em seu arquivo de início (def pares_ate(n:int):) .

O objetivo da função pares_ate é retornar um generator para os valores pares no intervalo [2,n] . Observe que n representa o valor do parâmetro informado na chamada da função.

```
def pares_ate(n:int):
    # Inicia a variável num 
    num = 0
    # Enquanto num form maior e igual a n, irá iterar, 
    while num <= n:
      num += 1
      # Se num form maior que um e divisível por 2, itera.
      if num >1:
        if num % 2 == 0:
          # Produz o num
          yield num

print(list(pares_ate(20)))
```