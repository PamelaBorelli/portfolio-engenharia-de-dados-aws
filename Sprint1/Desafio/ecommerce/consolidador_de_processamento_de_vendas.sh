#!/bin/bash

# Define o diretório onde os relatórios estão armazenados
diretorio_relatorios="/mnt/c/ecommerce"

# Define o arquivo final onde os relatórios serão consolidados
relatorio_final="/mnt/c/ecommerce/relatorio_final.txt"

# Cria o arquivo relatorio_final.txt se ele não existir
touch $relatorio_final

# Percorre todos os diretórios em /mnt/c/ecommerce
for dir in $diretorio_relatorios/vendas_*/backup/relatorio.txt
do
    # Verifica se o arquivo relatorio.txt existe no diretório
    if [ -f "$dir" ]
    then
        # Adiciona o conteúdo do relatório ao arquivo final
        cat "$dir" >> $relatorio_final
        echo "" >> $relatorio_final
    fi
done
