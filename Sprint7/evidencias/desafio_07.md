# Evidências Desafio 07

Claro! Aqui está o índice clicável para o seu arquivo Markdown, com os códigos formatados como comentários:

## Índice

1. [Credenciais da API](#credenciais-da-api)
    - [Criando o segredo no Secrets Manager](#criando-o-segredo-no-secrets-manager)
    - [Criando uma role para o uso do segredo](#criando-uma-role-para-o-uso-do-segredo)
    - [Criando uma Role para a Política](#criando-uma-role-para-a-política)
2. [Criando a Função Lambda](#criando-a-função-lambda)
    - [Criando primeiro a camada](#criando-primeiro-a-camada)
    - [Criando a camada](#criando-a-camada)
    - [Criando a função](#criando-a-função)

## Introdução

Nesse desafio, primeiro tentei usar o Secrets Manager para poder usar as credenciais da API, achei fácil de usar e cadastrar. Porém tive dificuldade com a criação da camada. Tentei fazer de várias maneiras até que por fim consegui. Por isso, e por questão de tempo e praticidade também utilizei as variáveis de ambiente da própria função lambda. Até por que eu precisei fazer algumas modificações no código para poder rodar na lambda.

## Credenciais da API

Para esse desafio decidi usar uma abordagem diferente para as credenciais, decidi usar o Secrets Manager para armazenar as credenciais da API da TMDB

### Criando o segredo no Secrets Manager

![secrets_manager](imagens_desafio/desafio_1.png)


![segredo](imagens_desafio/desafio_2.png)
![configurar_segredo](imagens_desafio/desafio_3.png)
![segredo_criado](imagens_desafio/desafio_4.png)

### Criando uma role para o uso do segredo
![role_segredo](imagens_desafio/desafio_5.png)
![permissao](imagens_desafio/desafio_6.png)
![ARNs](imagens_desafio/desafio_7.png)
![criar_revisar](imagens_desafio/desafio_8.png)
![politica](imagens_desafio/desafio_9.png)

### Criando uma Role para a Política
![politica_1](imagens_desafio/desafio_10.png)
![adicionar_permissoes](imagens_desafio/desafio_11.png)
![nomear_revisar_criar](imagens_desafio/desafio_12.png)
![role_criada](imagens_desafio/desafio_13.png)

## Criando a Função Lambda

### Criando primeiro a camada

![docker_camada](imagens_desafio/desafio_14.png)

![docker_camada_1](imagens_desafio/desafio_15.png)

![docker_camada_2](imagens_desafio/desafio_16.png)

![docker_camada_3](imagens_desafio/desafio_17.png)

![docker_camada_4](imagens_desafio/desafio_18.png)

![docker_camada_5](imagens_desafio/desafio_19.png)


### Criando a camada
![camada](imagens_desafio/desafio_20.png)
![camada_1](imagens_desafio/desafio_21.png)

## Criando a função
![função](imagens_desafio/desafio_22.png)
![função_1](imagens_desafio/desafio_23.png)
![função_2](imagens_desafio/desafio_24.png)
![response](imagens_desafio/desafio_25.png)
![objeto](imagens_desafio/desafio_26.png)


