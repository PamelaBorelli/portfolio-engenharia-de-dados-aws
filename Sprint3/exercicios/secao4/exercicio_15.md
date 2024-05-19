## Exercícios 15
Implemente a classe Lampada. A classe Lâmpada recebe um booleano no seu construtor, Truese a lâmpada estiver ligada, False caso esteja desligada. A classe Lampada possuí os seguintes métodos:

- **liga():** muda o estado da lâmpada para ligada
- **desliga():** muda o estado da lâmpada para desligada
- **esta_ligada():** retorna verdadeiro se a lâmpada estiver ligada, falso caso contrário

Para testar sua classe:

- Ligue a Lampada
- Imprima: A lâmpada está ligada? True
- Desligue a Lampada
- Imprima: A lâmpada ainda está ligada? False


```
# Classe Lampada com o construtor booleano e as funções para ligar, desligar, e mostrar o status
class Lampada:
  def __init__(self, estado):
    self.ligada = estado

  def liga(self):
    self.ligada = True
  
  def desliga(self):
    self.ligada = False
  
  def esta_ligada(self):
    return self.ligada

# Criando a lâmpada desligada 
lampada = Lampada(False)
#Ligando a lâmpada e imprimindo o status
lampada.liga()
print('A lâmpada está ligada?', lampada.esta_ligada())  
# Desligando a lâmpada e imprimindo o status
lampada.desliga()
print('A lâmpada ainda está ligada?', lampada.esta_ligada())  
```