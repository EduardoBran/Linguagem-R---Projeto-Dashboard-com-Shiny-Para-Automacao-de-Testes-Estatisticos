# Estatística da Prática - Projeto BigDataNaPratica

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/10-Projeto-BigDataNaPratica-Dashboard-com-Shiny-Para-Automacao-de-Testes-Estatisticos")
getwd()


######################       Projeto Dashboard com Shiny para Automacao de Testes Estatísticos       ###################### 


# Instalando as bibliotecas

install.packages(c("shiny", "shinyjs", "shinyvalidate", "shinycssloaders", "tidyverse", "broom", "bslib", "thematic", "DT", "plotly"))


# Importando as bibliotecas

library(shiny)            # biblioteca para criar aplicativos web interativos em R. Ele permite criar painéis de controle, dashboards e aplicativos web interativos usando R como linguagem de programação.
library(shinyjs)          # é uma extensão para o Shiny que fornece funcionalidades adicionais para melhorar a interatividade e a aparência dos aplicativos Shiny.
library(shinyvalidate)    # é uma biblioteca que facilita a validação de entradas do usuário em aplicativos Shiny, ajudando a garantir que os dados inseridos sejam válidos.
library(shinycssloaders)  # biblioteca que fornece várias animações e indicadores de carregamento CSS para melhorar a experiência do usuário em aplicativos Shiny.
library(tidyverse)        # é um conjunto de pacotes que inclui ferramentas para manipulação e visualização de dados, incluindo ggplot2, dplyr e outras bibliotecas populares.
library(broom)            # biblioteca que ajuda a converter os resultados de modelos estatísticos em um formato "tidy" para facilitar a análise e visualização.
library(bslib)            # é uma biblioteca para personalização de temas de Bootstrap em aplicativos Shiny.
library(thematic)         # é outra biblioteca para personalização de temas em aplicativos Shiny.
library(DT)               # é uma biblioteca para criar tabelas interativas em aplicativos Shiny.
library(plotly)           # é uma biblioteca para criar gráficos interativos em R.
options(warn = -1)        # suprimir mensagens de aviso durante a execução do código. 



# OBJETIVO

# - Vamos contruir uma aplicação (dashboard) para automatizar o processo de construção de testes estatísticos onde teremos uma aplicação totalmente
#   gráfica onde poderemos imputar os dados ou fazer a leitura de um arquivo e a partir daí escolher o teste estatístico (não será a aplicação que
#   que irá escolher), clicar em um botão e então obter todo o resultado (incluindo o gráfico).

# - Utilizaremos o shiny (pacote da linguagem R para construção de Dashboard) e dentro deste dashboard faremos a automação de 5 testes estatísticos.

# - Utilizaremos testes paramétricos e não paramétricos.



