## Exercícios 21

Implemente duas classes, Pato e Pardal , que herdam de uma superclasse chamada Passaro as habilidades de voar e emitir som.

Contudo, tanto Pato quanto Pardal devem emitir sons diferentes (de maneira escrita) no console, conforme o modelo a seguir.

Imprima no console exatamente assim:

- Pato
- Voando...
- Pato emitindo som...
- Quack Quack
- Pardal
- Voando...
- Pardal emitindo som...
- Piu Piu

```
# Classe Passaro
class Passaro:
    def __init__(self, estado, emitir_som):
        self.voando = estado
        self.som = emitir_som

    def voa(self):
        self.voando = True

    def nao_voa(self):
        self.voando = False

    def esta_voando(self):
        return self.voando

# Classe Pato
class Pato(Passaro):
    def quack(self):
        self.som = True

    def nao_quack(self):
        self.som = False

    def esta_cantando(self):
        return self.som

# Classe Pardal
class Pardal(Passaro):
    def piu(self):
        self.som = True

    def nao_piu(self):
        self.som = False

    def esta_cantando(self):
        return self.som

# Criando um pato
pato = Pato(False, False)
pato.voa()
print('Pato')
print('Voando...', pato.esta_voando())
pato.quack()
print('Pato emitindo som...', pato.esta_cantando())
print('Quack Quack')

# Criando um pardal
pardal = Pardal(False, False)
pardal.voa()
print('Pardal')
print('Voando...', pardal.esta_voando())
pardal.piu()
print('Pardal emitindo som...', pardal.esta_cantando())
print('Piu Piu')
```