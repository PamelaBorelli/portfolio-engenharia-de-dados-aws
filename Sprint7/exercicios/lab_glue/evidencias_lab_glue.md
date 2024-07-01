# Lab GLUE sprint07

1. [Preparando os dados de origem](#preparando-os-dados-de-origem)
2. [Configurando sua conta para utilizar o AWS Glue](#configurando-sua-conta-para-utilizar-o-aws-glue)
    - [Acesso GLUE](#acesso-glue)
    - [Grant Access](#grant-access)
3. [Criando a IAM Role para os jobs do AWS Glue](#criando-a-iam-role-para-os-jobs-do-aws-glue)
    - [Add Permissions](#add-permissions)
4. [Configurando as permissões no AWS Lake Formation](#configurando-as-permissões-no-aws-lake-formation)
5. [Criando novo job no AWS Glue](#criando-novo-job-no-aws-glue)
    - [Criação de alguns parâmetros](#criação-de-alguns-parâmetros)
6. [Crawler](#crawler)


# Introdução

Nesse Lab tive dificuldade de chegar até o fim pois precisei cuidar da saúde. Tive uma gripe forte o que acabou afetando meu desempenho. Como dei prioridade ao desafio, atrasei o lab. Mas acho melhor entregar até onde eu consegui fazer do que não entregar.


## Preparando os dados de origem

Nessa primeira etapa eu utilizei a imagem jupitter/all-spark criada no exercício dessa sprint. Minha intenção era aprender a usar o jupiter e principalmente a imagem para fazer esse lab. Para o desafio ainda estou usando o VSCode, pois acho que elep ode ser mais seguro para executar as tarefas, mas aprendendo a usar o jupiter nesse esse exercício percebi que não há tantas diferenças. 


![dados_origem](imagens_lab_glue/lab_1.png)
![nomes.csv](imagens_lab_glue/lab_2.png)

## Configurando sua conta para utilizar o AWS Glue
Nessa parte, não escolhi o usuário, pois nós não criamos o IAM user, então como orientação do monitor estou seguindo a diante


![user](imagens_lab_glue/lab_3.png)

### Acesso GLUE

No passo seguinte, informe acesso total ao S3 para leitura e escrita

![acesso_total](imagens_lab_glue/lab_4.png)

### Grant Access

Por fim, marque a opção Update the standard AWS Glue service role and set it as the default (recommended) e finalize o processo.

![access](imagens_lab_glue/lab_5.png)
![access_1](imagens_lab_glue/lab_6.png)

## Criando a IAM Role para os jobs do AWS Glue

![IAM_role](imagens_lab_glue/lab_7.png)

## Add Permissions

![permission](imagens_lab_glue/lab_8.png)
![permission_1](imagens_lab_glue/lab_9.png)

## Configurando as permissões no AWS Lake Formation

![lake_formation](imagens_lab_glue/lab_10.png)

![lake_formation_1](imagens_lab_glue/lab_11.png)
![lake_formation_2](imagens_lab_glue/lab_12.png)
![lake_formation_3](imagens_lab_glue/lab_13.png)
![lake_formation_4](imagens_lab_glue/lab_14.png)
![lake_formation_5](imagens_lab_glue/lab_15.png)

## Criando novo job no AWS Glue 
![job_glue](imagens_lab_glue/lab_16.png)
![job_glue_1](imagens_lab_glue/lab_17.png)
![job_glue_2](imagens_lab_glue/lab_18.png)
![job_glue_3](imagens_lab_glue/lab_19.png)
![job_glue_4](imagens_lab_glue/lab_20.png)

## Criação de alguns parâmetros:

Para abordar parâmetros, vamos considerar a existência de 2 neste job: 
S3_INPUT_PATH: Indica nosso caminho da origem no S3. 
S3_TARGET_PATH: Indica nosso caminho de destino no S3.

Esse ponto ficou confuso, pois não sei qual a origem. Imagino que seja o arquivo ‘nomes.csv’ que deveríamos usar, e o destino deveria ser uma pasta para armazenar as consultas realizadas

![parametros](imagens_lab_glue/lab_21.png)

## Crawler
![Crawler](imagens_lab_glue/lab_22.png)
![Crawler_1](imagens_lab_glue/lab_23.png)
![Crawler_2](imagens_lab_glue/lab_24.png)
![Crawler_3](imagens_lab_glue/lab_25.png)
![Crawler_4](imagens_lab_glue/lab_26.png)
![Crawler_5](imagens_lab_glue/lab_27.png)
![Crawler_6](imagens_lab_glue/lab_28.png)
![Crawler_7](imagens_lab_glue/lab_29.png)



