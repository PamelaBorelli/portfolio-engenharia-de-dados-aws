# Etapas do desenvolvimento do desafio da sprint

- 1- Arquivo carguru.py

Abrindo e explorando o arquivo enviado

- 2- Dockerfile e comando Docker build

Criei o arquivo Dockerfile com a imagem, o diretório. Depois no diretório copia o arquivo carguru.py e por fim executa o script. Por fim dei o comando ‘docker build .’ para construir a imagem


```
# Imagem do Python
FROM python:3.8

# Diretório de trabalho no container
WORKDIR /app

# Copia o arquivo Python para o container
 COPY carguru.py .

# Executa o script Python quando o container for iniciado
CMD ["python", "./carguru.py"]

```

executei o build

```
docker build .
```

- 3- Comando ‘docker images’, ‘docker tag’, docker run‘ e ‘docker ps’

Executei os comandos ‘docker images’ para ver se a imagem havia sido criada. Mas percebi que não havia colocado nome na imagem, então executei ‘docker tag’ para nomear a imagem. Executei ‘docker run’ para rodar a imagem e por fim ‘docker ps’ para verificar se a imagem está rodando.

```
docker images
```
```
docker tag
```
```
docker run
```
```
docker ps
```


- 4- Reutilizar containes

É possível reutilizar container que já foram criados. Dentro dos que eu já tinha criado escolhi o ‘meu_node3’ criado na aula de docker. Dessa maneira é possível usar node dentro da aplicação, caso fosse necessário.

```
docker start meu_node3
```

- 5- Criação de script

Criei um script que recebe três palavras para o hash e depois testei.
import hashlib

```
# Solicita ao usuário que insira três strings
print("Por favor, insira três palavras (uma por linha):")
for _ in range(3):
    # Lê uma linha de entrada
    recebendo_string = input()

    # Cria um objeto SHA-1
    hash_object = hashlib.sha1(recebendo_string.encode())

    # Gera o hash em hexadecimal
    hex_dig = hash_object.hexdigest()

    # Imprime o hash
    print(hex_dig)
````

- 6- Criar imagem

Reutilizei o dockerfile já criado. Só criei mais um COPY e comentei o CMD com o arquivo carguru.py. Depois criei a imagem mascarar_dados.
Neste Dockerfile, estamos usando a imagem base python:3.8. O comando WORKDIR /app define o diretório de trabalho dentro do contêiner. O comando COPY copia o arquivo script.py (que é o seu script Python) para o diretório de trabalho no contêiner. Finalmente, o comando CMD especifica o comando que será executado quando o contêiner for iniciado.

```
# Imagem do Python
FROM python:3.8

# Diretório de trabalho no container
WORKDIR /app

# Copia o arquivo Python para o container
# COPY carguru.py .
#executa o script
COPY script.py /app


# Executa o script Python quando o container for iniciado
#CMD ["python", "./carguru.py"]
CMD ["python", "/app/script.py"]
```

```
docker build -t mascara_dados
```
```
docker images
```

- 7- Iniciar o container e enviar palavras para mascaramento

```
docker run -it marcarar_dados
```