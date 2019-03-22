#!/bin/bash
wget -O licitacao.txt.gz https://dados.tce.pb.gov.br/TCE-PB-SAGRES-Licitacao_Esfera_Municipal.txt.gz;
wget -O participante.txt.gz https://dados.tce.pb.gov.br/TCE-PB-SAGRES-Participantes_Licitacao_Esfera_Municipal.txt.gz;

gunzip licitacao.txt.gz
gunzip participante.txt.gz
mv licitacao.txt /storage/neo4j/import/dados
mv participante.txt /storage/neo4j/import/dados