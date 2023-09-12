# Estatística da Prática - Projeto BigDataNaPratica

# Configurando o diretório de trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/10-Projeto-BigDataNaPratica-Dashboard-com-Shiny-Para-Automacao-de-Testes-Estatisticos")
getwd()


######################       Projeto Dashboard com Shiny para Automacao de Testes Estatísticos       ###################### 


# Instalando as bibliotecas

# install.packages(c("shiny", "shinyjs", "shinyvalidate", "shinycssloaders", "tidyverse", "broom", "bslib", "thematic", "DT", "plotly"))


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



# Carrega o arquivo com a descrição dos testes (para incluir no Dashboard)
dados_desc_te <- read.csv("desc_testes_estatisticos.csv")

# View(dados_desc_te)



##### SOBRE OS TESTES QUE SERÃO EXECUTADOS NO DASHBOARD

## Executando o Teste t Para Uma Amostra

# - Durante a execução do projeto ao selecionar o teste T para Uma Amostra e gerar dados randômicos, eles já seguem uma distribuição normal 
#   automaticamente e portanto não precisamos realizar as validações necessárias.
#   (os dados seguem uma distribuição normal por conta da funcao rnorm() que é utilizada no código).

# - Entretanto ao usar dados externos, teremos que fazer antes as validações para as suposições.
#   (Isso é necessário pois o teste t é teste paramétrico, e todo teste paramétrico possui suposições, e aí podemos considerar as
#    suposições como verdadeiras e assumir o total risco ou valida.)


## Executando o Teste t Para Duas Amostras

# - Comparar duas amostras.
# - Precisa validar as suposições pois é um teste paramétrico.


## Executando o Teste de Wilcoxon Signed Rank

# - É um teste não paramétrico.

# - Caso os dados não sigam uma distribuição normal, precisaremos usar um teste não paramétrico ao invés do Teste t.
# - Para quase todo teste paramétrico, existe um equivalente não paramétrico, cujo objetivo é fazer a validação necessária sem suposição de
#   distribuição de dados.

# - Portanto ao não conseguir validar as suposições ou validar e perceber que não segue uma distribuição normal, usa-se o este Teste no lugar do
#   Teste t.


## Executando o Teste de Shapiro-Wilk

# - É um teste não paramétrico, portanto não necessita de suposições.

# - É um teste de normalidade, é um teste para verificar se os dados de uma variável seguem uma distribuição normal. Vários modelos de aprendizado
#   de máquina tem como suposição que as variáveis seguem uma distribuição normal.


## Executando o Teste de Kolmogorov-Smirnov

# - Teste estatístico não paramétrico que é usado para determinar se uma amostra segue uma distribuição de probabilidade específica ou se duas 
#   amostras são provenientes da mesma distribuição de probabilidade. Ele é amplamente utilizado para verificar a normalidade dos dados ou para 
#   comparar duas amostras independentes.





# - Por ser uma aplicação temos que executar com o "Run app" ao invés de executar linha a linha.




#### UI - User Interface (configurando a interface de negócio)


## Criando a página de navegação 

ui <- navbarPage(
  
  # Cria instância do shinyjs
  
  shinyjs::useShinyjs(),
  
  # Tema de cores do dashboard
  
  theme = bs_theme(version = 5,
                   bootswatch = "flatly",
                   primary = "#3f7928",
                   secondary = "#5340f7",
                   success = "#dadeba"
  ),
  
  # Estilo
  
  tags$style(type = 'text/css', '#nometestedesc {white-space: pre-wrap;}'),
  
  # Título do Dashboard
  
  title = "Dashboard com Shiny Para Automação de Testes Estatísticos",
  
  tabPanel(
    title = "Home",
    
    sidebarLayout(
      
      # Painel lateral
  
          sidebarPanel(
            width = 4,
        
            # Input
            selectInput(
              inputId = "nometeste",
              label = "Selecione o Teste Estatístico Desejado:",
              choices = c("Teste t Para Uma Amostra", 
                          "Teste t Para Duas Amostras", 
                          "Teste de Wilcoxon Signed Rank", 
                          "Teste de Shapiro-Wilk",
                          "Teste Kolmogorov-Smirnov"
              ),
              selected = "Teste t Para Uma Amostra"
            ),
            
            textInput(
              inputId = "primeira_amostra",
              label = "Digite uma lista de valores numéricos (separados por vírgula) ou use o botão para gerar dados randômicos:"
            ),
            
            uiOutput("vector"),
            h5(
              actionButton(
                inputId = "randomnum",
                label = "Gerar Dados Randômicos"
              ),
              align = "center"
            ),
            
            uiOutput("samplemean"),
            
            uiOutput("confidencelevel"),
            h5(
              actionButton(
                inputId = "generate",
                label = "Executar o Teste"
              ),
              align = "center"
            )
          
          ), # sidebarPanel
          
          # Painel principal
          
          mainPanel(
            fluidRow(
              column(
                width = 6, 
                h4(textOutput("testresulttitle")), 
                withSpinner(DTOutput("testresult"), type = 7), 
                align = "center"
              ),
              column(
                width = 6, 
                h4(textOutput("histogramtitle")), 
                withSpinner(plotlyOutput("hist", width = "100%"), type = 7), 
                align = "center"
              )
            ),
            fluidRow(br()),
            fluidRow(h4(textOutput("descriptiontitle")), align = "center"),
            fluidRow(
              withSpinner(verbatimTextOutput("nometestedesc"), type = 7)
            )
            
          ) # mainPanel
          
  
    ) # sidebarLayout
  
  ), # tabPanel

  nav_item(a(href = "https://www.datascienceacademy.com.br", "Suporte"))
  
) # navbarPage



#### EXPLICANDO CÓDIGO ACIMA

# - O código acima cria a interface de usuário (UI) para um app Shiny em R. Aqui está uma explicação detalhada do que cada parte do código faz:
  
# -> navbarPage(): Esta função cria uma página de navegação na interface do aplicativo. Ela define a estrutura da interface com guias de navegação 
#    no topo, permitindo que o usuário mude entre diferentes painéis ou páginas.

# -> shinyjs::useShinyjs(): Isso carrega o pacote shinyjs, que fornece funcionalidades JavaScript adicionais para aplicativos Shiny.

# -> bs_theme(): Define o tema de cores para o aplicativo usando a biblioteca Bootstrap. Ele define a paleta de cores, incluindo a cor principal, 
#    secundária e de sucesso.

# -> tags$style(): Define estilos CSS personalizados para elementos específicos na interface do usuário. Neste caso, está definindo um estilo para
#    um elemento com o ID "nometestedesc".

# -> title = "Dashboard com Shiny...": Define o título da página do dashboard.

# -> tabPanel(): Cria uma guia na página de navegação. Neste caso, há uma guia chamada "Home" que contém todo o conteúdo do aplicativo.

# -> sidebarLayout(): Define o layout da página com uma barra lateral e um painel principal. A barra lateral contém widgets de entrada, como
#    seletores e botões, enquanto o painel principal exibirá os resultados e gráficos.

# -> sidebarPanel(): Define o conteúdo da barra lateral. Ele inclui seletores de entrada, como selectInput() para escolher o tipo de teste
#    estatístico, textInput() para inserir dados e botões de ação.

# -> mainPanel(): Define o conteúdo do painel principal. Ele exibirá os resultados do teste estatístico e gráficos.

# -> uiOutput(): Essa função é usada para criar elementos de interface de usuário dinâmicos. Eles serão gerados com base nas escolhas do usuário.

# -> actionButton(): Cria um botão de ação que o usuário pode clicar para executar o teste estatístico.

# -> fluidRow(): Cria uma linha de conteúdo flexível que se ajusta automaticamente ao tamanho da tela.

# -> column(): Define as colunas dentro de uma linha. Isso ajuda a organizar o layout da página.

# -> textOutput(), verbatimTextOutput(), DTOutput(), plotlyOutput(): Essas funções são usadas para criar espaços onde a saída dos resultados, 
#    descrição e gráficos serão renderizados.

# -> withSpinner(): Esta função envolve a saída em um spinner, mostrando uma animação de carregamento enquanto os resultados estão sendo 
#    processados.

# -> No geral, este código cria uma interface de usuário interativa onde o usuário pode escolher um teste estatístico, inserir dados e gerar
#    resultados, incluindo um histograma e descrição do teste. A estrutura de guias de navegação permite ao usuário alternar entre diferentes
#    partes do aplicativo.





