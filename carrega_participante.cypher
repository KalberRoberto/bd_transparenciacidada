//carrega participante
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///participante.txt" AS line fieldterminator "|"
create (:Participante {pCodUnidadeGest: line.cd_ugestora, pNome: line.de_ugestora,pCodLicitacao: line.nu_licitacao,pCodTipoLicitacao:line.tp_licitacao,pNomeTipo:line.de_tipolicitacao,ChaveParticipante:line.nu_cpfcnpj,NomeParticipante:line.no_participante})

