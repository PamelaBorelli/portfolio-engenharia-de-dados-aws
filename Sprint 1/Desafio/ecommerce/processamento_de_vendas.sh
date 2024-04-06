#!/bin/bash

# Obtém a data e hora atual no formato yyyymmdd_HHMMSS
timestamp=$(date +%Y%m%d_%H%M%S)

# Cria o diretório vendas com o timestamp
mkdir "/mnt/c/ecommerce/vendas_$timestamp"

# Navega para o diretório vendas criado
cd "/mnt/c/ecommerce/vendas_$timestamp"

# Copia o arquivo dados_de_vendas para o diretorio venda
cp /mnt/c/ecommerce/dados_de_vendas.csv .

# Cria o subdiretório backup dentro de vendas
mkdir backup

# Obtém a data atual no formato yyyymmdd
data_atual=$(date +%Y%m%d)


#Copia o arquivo dados_de_vendas.csv para o diretório backup com a data de execucao
cp dados_de_vendas.csv backup/dados-$data_atual.csv


# Renomeia o arquivo dados-$data_atual.csv para backup-dados-$data_atual.csv
mv backup/dados-$data_atual.csv backup/backup-dados-$data_atual.csv

# Cria um arquivo chamado relatorio.txt
touch /mnt/c/ecommerce/vendas_$timestamp/backup/relatorio.txt

# Obtendo as informações do arquivo backup-data-$data_atual.csv
# 1. Obter a data do sistema operacional em formato yyyymmdd HH:MI
DATA=$(date +%Y%m%d\ %H:%M)
# 2. Obter a data do primeiro registro de vendas contido no arquivo
PRIMEIRA_DATA=$(awk -F, 'NR>1 {print $5; exit}' backup/backup-dados-$data_atual.csv)
# 3. Obter a data do último registro de vendas do arquivo
ULTIMA_DATA=$(awk -F, '{data=$5} END{print data}' backup/backup-dados-$data_atual.csv)
# 4. Obter a quantidade total de itens diferentes vendidos
ITENS_DIFERENTES=$(cut -d, -f2 backup/backup-dados-$data_atual.csv | sort | uniq | wc -l)
# 5. Copiando as 10 primeiras linhas
SALVA_LINHAS=$(sed -n '2,11p' backup/backup-dados-$data_atual.csv | cut -d',' -f1-10)

# Escrever as informações no arquivo relatório.txt
echo "Data do sistema operacional: $DATA" >> /mnt/c/ecommerce/vendas_$timestamp/backup/relatorio.txt
echo "Data do primeiro registro de vendas: $PRIMEIRA_DATA" >> /mnt/c/ecommerce/vendas_$timestamp/backup/relatorio.txt
echo "Data do último registro de vendas: $ULTIMA_DATA" >> /mnt/c/ecommerce/vendas_$timestamp/backup/relatorio.txt
echo "Quantidade total de itens diferentes vendidos: $ITENS_DIFERENTES" >> /mnt/c/ecommerce/vendas_$timestamp/backup/re>echo "Salvando as 10 primeiras linhas: $SALVA_LINHAS" >> /mnt/c/ecommerce/vendas_$timestamp/backup/relatorio.txt

# Compacta o arquivo backup-dados-$data_atual.csv
gzip backup/backup-dados-$data_atual.csv

# Apaga o arquivo backup-dados-$data_atual.csv.gz do diretório backup
rm backup/backup-dados-$data_atual.csv.gz

# Apaga o arquivo dados_de_vendas.csv do diretório vendas
rm /mnt/c/ecommerce/vendas_$timestamp/dados_de_vendas.csv
