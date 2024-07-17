# Evidência Desafio 8

1. [Introdução](#introdução)

1. [Configurando a conta para utilizar o AWS Glue](#configurando-a-conta-para-utilizar-o-aws-glue)
2. [Criando a camada Trusted](#criando-a-camada-trusted)
3. [Criando Crawler](#criando-crawler)
4. [Tabelas criadas](#tabelas-criadas)
5. [Testando código no Colab](#testando-código-no-colab)
6. [Criando o Job](#criando-o-job)
    - [Job-1](#job-1)
        - [Visual ETL](#visual-etl)
    - [Job-2](#job-2)
        - [Visual ETL](#visual-etl-1)
        - [Script ETL](#script-etl)


## Introdução

Eu achei que essa etapa ia ser mais tranquila tendo em vista que os exercícios puderam dar um norte para poder elaborar.

Como sugestão do Monitor da sprint passada comecei um curso extra de spark. O monitor havia dito que essa parte do spark ia ser mais difícil. 

![Curso](imagem/desafio_imagem_extra.png)

Me dediquei mais a parte de conseguir usar o spark para tratar os dados. Fiz essa parte localmente pois assim pouparia recursos da AWS.

Fiz dois códigos no Colab

1. ...
[Codigo 1](../desafio/Desafio_8.ipynb)
1. ...
[Codigo 2](../desafio/Novo_codigo_desafio8.ipynb)

Achei que se fizesse essa parte bem feita, quando eu fosse tentar fazer os scripts para os jobs no Glue iria ficar mais fácil.

Não foi o que aconteceu, infelizmente tive muita dificuldade em criar os scripts. Já imaginava que teria que adaptar os códigos para poder rodar pois os códigos em spark não são completamente adaptados para as bibliotecas do Glue.

Então, infelizmente achei que estava me preparado melhor mas somente acabei me atrasando, pois usar o Glue não foi tão fácil assim. 

Consegui transformar o csv em parquet, mas não consegui fazer as transformações que eu queria. E o json não consegui de forma nenhuma transformá-lo em parquet.

Sendo assim, nem de perto consegui completar essa etapa do desafio da maneira como queria. Claro que já sei que isso irá afetar minha avaliação. Pretendo seguir o desafio somente com o dataset que consegui transformar em parquet.  

Mas não posso deixar de lembrar que tive muito apoio do pessoal da minha squad que se esforçaram a me ajudar. E também ao Monitor da sprint que se dedicou dar uma boa olhada nos erros que estavam ocorrendo no Glue. Com certeza essa ajuda foi de grande importância.

## Começando configurando a conta para utilizar o AWS Glue


Acredito que essa etapa seja parecida com o Lab-Glue da sprint passada


![ConfigurandoGlue](imagem/desafio_1.png)

- Faltou selecionar Read and Write, mas selecionei depois.

![ConfigurandoGlue](imagem/desafio_2.png)

## Criando Role
![ConfigurandoGlue](imagem/desafio_3.png)
![ConfigurandoGlue](imagem/desafio_4.png)

- Faltou o AmazonS3FullAccess e acrescentei depois

## Configurando as permissões no AWS Lake Formation
![LakeFormation](imagem/desafio_5.png)
![LakeFormation](imagem/desafio_6.png)
![LakeFormation](imagem/desafio_7.png)
![LakeFormation](imagem/desafio_8.png)


## Criando a camada Trusted
![Trusted](imagem/desafio_9.png)

## Criando Crawler
![Crawler](imagem/desafio_10.png)
![Crawler](imagem/desafio_11.png)
![Crawler](imagem/desafio_12.png)
![Crawler](imagem/desafio_13.png)
![Crawler](imagem/desafio_14.png)
![Crawler](imagem/desafio_15.png)

## Tabelas criadas
![Tabelas](imagem/desafio_16.png)
![Tabelas](imagem/desafio_17.png)
![Tabelas](imagem/desafio_18.png)


## Testando código no Colab 

Antes de começar a fazer o job no Glue eu fui tentando códigos usando o Colab. 

Para essa etapa até comecei a fazer a limpeza dos dados com os datasets csvs separados (movies e series), mas como quero trabalhar com os artistas e as series e os filmes que eles trabalharam, então optei por unir os dois csvs e fazer a limpeza dos dois.
A minha intenção é ver a classificação dos artistas e a classificação dos filmes. Então além de toda a limpeza dos dados, por fim separei os csvs em dois df, um para os filmes, e outro para os artistas. Mesmo não sendo pedido o parcionamento dos csv, para o df com as mídias eu parcionei por décadas, e os artistas eu parcionei por faixa etária. Ambos os df salvei em parquet
Depois o json que coletamos na API, fiz a limpeza, eliminei as colunas que não me interessavam e depois fiz um join com a tabela dos artistas da etapa anterior, pegando apenas os artistas que possuem avaliação.
Então, por fim terei 4 dataset. Um com todos os dados dos csvs, um somente com os dados dos filmes, um com os dados dos artistas, outro com união dos dados dos artistas e suas classificações.


![Colab](imagem/desafio_19.png)

Então são essas pastas que espero que tenha na camada trusted

![Colab](imagem/desafio_20.png)

## Criando o Job
Comecei criando um database para o primeiro job da camada trusted

![Job1](imagem/desafio_21.png)

Como não estava conseguindo realizar essa etapa do desafio, pedi ajuda para o pessoal e como não consegui resultado, pedi ajuda ao monitor que deu uma boa olhada no job e através da observação dele percebi que talvez pudesse ter feito algumas etapas erradas e não poderia ter criado uma Role adequada ou o crawler. Refiz essa etapas e consegui acessar o athena e rodar um job de teste.

![Job2](imagem/desafio_22.png)
![Job3](imagem/desafio_23.png)
![Job4](imagem/desafio_24.png)

## Job-1
Fiz vários testes de maneira diferentes, usando o script e o visual-etl, tentei usar uma imagem no docker do jupiter-glue, mas é muito pesado e meu computador parecia que ia parar, tentei acessar o Glue pelo Colab, mas não encontrei com tanta facilidade como criar uma sessão do glue como foi para o S3, isso estava me atrasando também. 
Achei muito difícil usar essas ferramentas, existe muito mais vídeos e cursos para certificação AWS do que cursos que ensinam de fato a usar a ferramenta. O que encontrei para tentar aprender eram vídeos que mostravam o básico da ferramenta, para ter uma boa noção sobre o uso seria melhor mais tempo dedicado.
Dei uma ênfase maior na limpeza com o Colab pois achei que se eu fizesse essa etapa muito bem feita me ajudaria nessa parte com o Glue, o que não aconteceu. Usar uma ferramenta mais dinâmica teria acelerado o processo e eu conseguiria fazer as limpezas que eu gostaria.
Achei muito difícil usar o Glue através do script e até mesmo Visual-ETL, principalmente que não é possível ver o resultado antes de rodar o job, confesso que essas ferramentas de deixaram muito frustrada e não contava com tanta dificuldade em usar, o que foi uma surpresa para mim e acabou me atrasando demais. 
Por isso, vou seguir o conselho que recebi do Pedro da minha squad, ele tentou contornar essa situação de outra maneira. Ele transformou os arquivos em parquet no glue e depois usou o Athena, não é o adequado para ETL, mas acho que vai acelerar o processo, pois já estou atrasada e não estou conseguindo chegar a nenhum resultado.

### Job-1 : 

#### Visual ETL: rodei algumas vezes e não sei porque as primeiras vezes não criou os dados, reduzi bastante a seleção e consegui rodar.

![Job5](imagem/desafio_25.png)
![Job6](imagem/desafio_26.png)
![Job7](imagem/desafio_27.png)


### Job-2 : Visual ETL:

Tentei de todas as maneiras conseguir arrumar o json para poder transformá-lo em parquet tentei todas essas vezes usando o visual etl. 

![Job8](imagem/desafio_28.png)

Tentei também usando o script. Aqui tentei várias formas de escrever o script para desaninhar os dados. Todos falharam.

![Job9](imagem/desafio_29.png)

Por algum motivo o job roda, porém não cria a tabela. Estudei melhor a estrutura dos dados que eu coletei. Percebi que é um array somente, o crawler não consegue identificar os dados como colunas.

![Job10](imagem/desafio_30.png)

Tentei outras abordagens para poder organizar os dados. Vi vídeo que ensinam a usar o athena para consultas com json. Tentei criar tabelas para poder fazer as consultas no athena


![Job11](imagem/desafio_31.png)

Usei esse código: 
```
CREATE EXTERNAL TABLE IF NOT EXISTS `database-desafio`.`jsontableathenas` (
	`adult` string,
	`gender` string,
	`id` string,
	`known_for_department` string,
	`name` string,
	`original_name` string,
	`popularity` string,
	`profile_path` string,
	`known_for` array < string >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
	'ignore.malformed.json' = 'FALSE',
	'dots.in.keys' = 'FALSE',
	'case.insensitive' = 'TRUE',
	'mapping' = 'TRUE'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://pamela-desafio-06/data-lake-pamela/Raw/TMDB/JSON/2024/06/28/'
TBLPROPERTIES ('classification' = 'json');
```

O melhor que consegui foi isso, mas os dados não ficam bem organizados, então mesmo rodando o script, a tabela não é formada.

![Job12](imagem/desafio_32.png)

Tentei realmente buscar meios de usar esse dado json. Acho que infelizmente não ou conseguir usar o json para as etapas seguintes.

![Job13](imagem/desafio_33.png)

