import pandas as pd
from pandas import DataFrame
import json



licitacoes = pd.read_csv('data/Licitacao.csv', sep="|", header=None, low_memory=False, quoting=3)
cols_licitacoes = {0:'cd_ugestora', 1:'de_ugestora', 2:'nu_Licitacao', 3:'tp_Licitacao', 4:'de_TipoLicitacao', 5:'dt_Homologacao', 6:'tp_Objeto', 7:'de_TipoObjeto', 8:'vl_Licitacao', 9:'de_Obs'}

participantes = pd.read_csv('data/Participantes.txt', sep="|", header=None, low_memory=False)
cols_participantes = {0:'cd_ugestora', 1:'de_ugestora', 2:'nu_licitacao', 3:'tp_licitacao', 4:'de_tipolicitacao', 5:'nu_cpfcnpj', 6:'no_participante'}

def load_data(csv, columns):
    df = DataFrame(csv)
    df.rename(columns=columns, inplace=True)
    return df

licitacoes = load_data(licitacoes, cols_licitacoes)
participantes = load_data(participantes, cols_participantes)

def pt_in_lc(df, nu_licitacao):
    return df[df['nu_licitacao'] == nu_licitacao]

def load_json_report(dic):
    dic = open('dicionario.json','w').write(json.dumps(dic, ensure_ascii=False))
    return dic

def nodes_lic(licitacoes, participantes):
    dic = {}
    for i in licitacoes['nu_Licitacao']:
        dic[i] = []
   
    cont = 0
    for i in licitacoes['nu_Licitacao']:
        t = pt_in_lc(participantes, i)
        for y in t['no_participante']:
            dic[i].append(y)
        cont+=1
        print(cont)
    
    load_json_report(dic)
        
        

nodes_lic(licitacoes, participantes)