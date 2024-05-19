## Exercício 11
Leia o arquivo **person.json**, faça o parsing e imprima seu conteúdo.

Dica: leia a documentação do pacote json

```
# # Código para testar o json
# dados = {'name': 'Fulano Da Silva', 'endereco': 'Rua Sem Nome, 31', 'startDateExecution': '2019-06-25 16:25:23.233', 
#  'endDateExecution': '2019-06-25 16:25:23.331', 'siteId': 'BrasilDesktop', 'sitePage': '/', 'serverName': 'AS1332:10181', 
#  'profileId': '8947071299', 'type': 'JSP_RENDERING', 'path': 'testado/com', 'performanceType': 'JSP_RENDERING'}

# import json
# # Criando o arquivo json
# with open('person.json', 'w') as f:
#     json.dump(dados, f)

# # Abrindo o arquivo json
# with open('person.json', 'r') as f:
#     dados_lidos = json.load(f)

# print(dados_lidos)

#Código definitivo para o teste na Udemy
import json

# Abrindo o arquivo json
with open('person.json', 'r') as f:
    dados = json.load(f)

print(dados)
```