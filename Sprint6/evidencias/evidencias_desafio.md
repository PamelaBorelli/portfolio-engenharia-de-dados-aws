# Desenvolvimento do desafio

# Índice

- [Introdução](#introdução)
  - [Criação das pastas](#criação-das-pastas)
  - [Requirements](#requirements)
  - [Arquivo Dockerfile e docker compose](#arquivo-dockerfile-e-docker-compose)
  - [Confirmando build a criação container e da imagem](#confirmando-build-a-criação-container-e-da-imagem)
  - [Confirmando a criação do bucket e a carga dos dados](#confirmando-a-criação-do-bucket-e-a-carga-dos-dados)


# Introdução


Apesar de preferir mais o Colab ou Jupiter para executar arquivos csv, para esse desafio preferi utilizar o vscode pois ele suporta todas as tarefas como execução de containers.


## Criação das pastas

Fiz uma pasta com os comandos para a ingestão dos dados para a AWS e criei 3 arquivos para melhor gerir o código. E as credenciais da AWS e os nomes dos containers e imagem coloquei em um arquivo .env. Fiz um arquivo .dockerignore para que as credenciais não sejam carregadas para o volume.

![pastas](imagens_desafio/desafio_1.png)

- config.py  

![config.py](imagens_desafio/desafio_2.png)

- s3_utils.py

![s3_utils.py](imagens_desafio/desafio_3.png)

- main.py

![main.py](imagens_desafio/desafio_4.png)

## Requirements

Fiz um arquivo chamado requirements.txt para poder baixar as bibliotecas quando o Docker for executado

- requirements.txt

![requirements.txt](imagens_desafio/desafio_5.png)

## Arquivo Dockerfile e docker compose


- Dockerfile

![Dockerfile](imagens_desafio/desafio_6.png)

- Docker-Compose

![Docker-Compose](imagens_desafio/desafio_11.png)

## Confirmando build a criação container e da imagem

![confirmacao_build](imagens_desafio/desafio_7.png)

![confirmacao_container_imagem](imagens_desafio/desafio_8.png)

## Confirmando a criação do bucket e a carga dos dados:

- movies.csv

![movies.csv](imagens_desafio/desafio_9.png)

- series.csv

![series.csv](imagens_desafio/desafio_10.png)

