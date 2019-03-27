//carrega participante
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///participante.txt" AS line fieldterminator "|"
create (:Participante {ChaveParticipante:line.nu_cpfcnpj,pCodUnidadeGest: line.cd_ugestora, pNome: line.de_ugestora,pCodLicitacao: line.nu_licitacao,pCodTipoLicitacao:line.tp_licitacao,pNomeTipo:line.de_tipolicitacao,NomeParticipante:line.no_participante});


//não terminado
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///participante.txt" AS line fieldterminator "|"
MERGE (l:Licitacao {CodUnidadeGest: line.cd_ugestora,CodLicitacao: line.nu_licitacao,CodTipoLicitacao:line.tp_licitacao})
CREATE (p:Participante{ChaveParticipante:line.nu_cpfcnpj, NomeParticipante:line.no_participante});)
CREATE (p)-[:Participou{CodUnidadeGest: line.cd_ugestora,CodLicitacao: line.nu_licitacao,CodTipoLicitacao:line.tp_licitacao}]->(l)


CREATE CONSTRAINT ON (p:Participante) ASSERT p.ChaveParticipante IS UNIQUE
DROP CONSTRAINT ON (p:Participante) ASSERT p.ChaveParticipante IS UNIQUE