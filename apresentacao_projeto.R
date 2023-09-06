# Estatística da Prática - Projeto BigDataNaPratica

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/10-Projeto-BigDataNaPratica-Dashboard-com-Shiny-Para-Automacao-de-Testes-Estatisticos")
getwd()


library(dplyr)
library(ggplot2)



######################       Projeto Dashboard com Shiny para Automacao de Testes Estatísticos       ###################### 


### APRESENTAÇÃO

# - Para este projeto são abordados as seguintes atividades:

#  -> Uso e interpretação de testes estatísticos paramétricos e não paramétricos.
#  -> Compreensão de qual teste estatístico escolher para análise de acordo com o objetivo.
#  -> Automação dos testes estatísticos através de Dashboard interativo.



### OBJETIVO

# - O objetivo deste projeto é demonstrar o uso e interpretação de alguns imporatntes testes estatísticos (paramétricos e não paramétricos).
#   Serão abordados 5 testes neste projeto:

#  -> Teste t Para Uma Amostra    (paramétrico)
#  -> Teste t para Duas Amostras  (paramétrico)
#  -> Teste de Wilcoxon           (não paramétrico)
#  -> Teste de Shapiro-Wilt       (não paramétrico)
#  -> Teste Kolmogorov-Smirnov    (não paramétrico)

# - Para cada teste haverá uma descrição explicando o teste, sua aplicação e a hipótese nula (H0) associada.
#   Os testes serão executados com dados gerados dentro do próprio Dashboard de automação.







# - Se os dados se aproximam de uma distribuição normal e as suposições paramétricas são atendidas, os TESTES PARAMÉTRICOS são preferíveis devido
#   à sua eficiência estatística. No entanto, se as suposições paramétricas são violadas ou os dados não têm uma distribuição normal, os testes 
#   NÃO PARAMÉTRICOS são uma opção mais apropriada, pois são mais robustos nessas situações.