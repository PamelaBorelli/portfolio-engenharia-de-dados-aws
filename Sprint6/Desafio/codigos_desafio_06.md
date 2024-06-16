# Códigos utilizados no desafio

As credenciais da AWS e nomes do container, volume, imagem foram colocadas em um arquivo *.env* e depois chamada no *.dockerignore* para não ser colocado no volume. Além disso foi criada uma pasta para armazenar os arquivos csv 

## config.py

```
import os
from dotenv import load_dotenv
import boto3

# Carregue as variáveis de ambiente do arquivo .env
load_dotenv()

# Acesse as variáveis de ambiente
aws_access_key_id = os.getenv('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.getenv('AWS_SECRET_ACCESS_KEY')
aws_session_token = os.getenv('AWS_SESSION_TOKEN')

# Criando uma sessão boto3
session = boto3.Session(
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    aws_session_token=aws_session_token
)
```

## s3_utils.py

```
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
from config import session
import pandas as pd
from io import StringIO

# Criando um cliente S3
s3 = session.client('s3')

def read_csv_file_from_s3(bucket_name, file_path):
    try:
        # Obtendo o objeto do S3
        obj = s3.get_object(Bucket=bucket_name, Key=file_path)
        
        # Lendo o conteúdo do objeto como string
        data = obj['Body'].read().decode('utf-8')
        
        # Convertendo a string para um objeto StringIO
        data_io = StringIO(data)
        
        # Lendo o arquivo CSV
        df = pd.read_csv(data_io)
        print(f"Arquivo {file_path} lido com sucesso do bucket {bucket_name}.")
        return df
    except Exception as e:
        print(f"Erro ao ler o arquivo {file_path} do bucket {bucket_name}: {e}")

def create_bucket(bucket_name):
    try:
        # Criando o bucket
        s3.create_bucket(Bucket=bucket_name)
        print(f"Bucket {bucket_name} criado com sucesso.")
    except NoCredentialsError:
        print("Erro: Credenciais não encontradas.")
    except PartialCredentialsError:
        print("Erro: Credenciais incompletas.")
    except Exception as e:
        print(f"Erro: {e}")

def upload_files(bucket_name, s3_file_paths, local_file_names):
    try:
        # Faça o upload dos arquivos para o S3
        for s3_file_path, local_file_name in zip(s3_file_paths, local_file_names):
            with open(local_file_name, 'rb') as data:
                s3.upload_fileobj(data, bucket_name, s3_file_path)
            print(f"Arquivo {local_file_name} carregado com sucesso no bucket {bucket_name}.")
    except NoCredentialsError:
        print("Erro: Credenciais não encontradas.")
    except PartialCredentialsError:
        print("Erro: Credenciais incompletas.")
    except Exception as e:
        print(f"Erro: {e}")
```

## main.py

```
from s3_utils import create_bucket, upload_files

# Nome do bucket
bucket_name = 'pamela-desafio-06'

# Caminhos dos arquivos no S3
s3_file_paths = [
    'data-lake-pamela/Raw/Local/CSV/Movies/2023/06/09/movies.csv',
    'data-lake-pamela/Raw/Local/CSV/Series/2023/06/09/series.csv'
]

# Nomes dos arquivos locais
local_file_names = ['Filmes+e+Series/movies.csv', 'Filmes+e+Series/series.csv']

# Crie o bucket
create_bucket(bucket_name)

# Faça o upload dos arquivos para o S3
upload_files(bucket_name, s3_file_paths, local_file_names)

```

## requirements.txt

```
boto3==1.20.23
python-dotenv==0.19.2
botocore==1.23.23
pandas==1.5.3
numpy==1.21.4

```
## Dockerfile

```
# Imagem do Python
FROM python:3.9

# Diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto para o container
COPY . /app

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Define o comando para executar quando o container iniciar
CMD ["python", "main.py"]
```
## docker-compose.yml

```
version: '3.9'
services:
  app:
    container_name: ${CONTAINER_NAME}
    build: .
    image: ${IMAGE_NAME}
    volumes:
      - ${VOLUME_NAME}:/app/Filmes+e+Series
    environment:
      - AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
      - AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
      - AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN}
volumes:
  desafio_compass_volume:
```
## .dockerignore

```
.env
```