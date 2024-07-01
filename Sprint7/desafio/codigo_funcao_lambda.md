# Código utilizado na função lambda

```

import requests
import json
import boto3
import os

def lambda_handler(event, context):
    # Obtém as chaves de acesso e o token de sessão das variáveis de ambiente
    tmdb_api_key = os.environ['api_key']
    access_key = os.environ.get('ACCESS_KEY_ID')
    secret_key = os.environ.get('SECRET_ACCESS_KEY')
    session_token = os.environ.get('SESSION_TOKEN')

    # Nome do seu bucket S3 existente
    s3_bucket_name = 'pamela-desafio-06'

    # Nome do objeto que você deseja criar no S3
    s3_object_key = 'data-lake-pamela/Raw/TMDB/JSON/2024/06/28/atores.json'

    # Inicializa o cliente do Amazon S3 com as credenciais
    s3 = boto3.client('s3', aws_access_key_id=access_key, aws_secret_access_key=secret_key, aws_session_token=session_token)

    # Lista de URLs
    urls = [
        f"https://api.themoviedb.org/3/person/popular?api_key={tmdb_api_key}&page={page}&language=en"
        for page in range(1, 51)  # Loop da página 1 a 51
    ]

    # Variável para armazenar todos os registros
    dados = []

    # Loop para fazer as requisições
    for url in urls:
        try:
            response = requests.get(url)
            if response.status_code == 200:
                data = response.json()
                # Adicione os registros à lista de dados
                dados.extend(data['results'])
            else:
                print(f"Erro na resposta da API para a URL {url}: {response.status_code}")
        except Exception as e:
            print(f"Erro ao obter dados da API para a URL {url}: {e}")

    # Salve todos os dados em um arquivo JSON
    with open("/tmp/atores.json", "w") as file:
        json.dump(dados, file)

    # Envie o arquivo JSON para o Amazon S3
    s3.upload_file('/tmp/atores.json', s3_bucket_name, s3_object_key)

    print("Todos os registros salvos e enviados para o Amazon S3.")

    return {
        'statusCode': 200,
        'body': json.dumps('Dados salvos e enviados para o Amazon S3!')
    }

```