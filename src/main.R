############# Forest Cover Prediction ##########

# Raul Magno
# V1 = 0.1

# Melhorias
  # Preciso melhorar o pre processamento os clusters nao estao funcionando bem.
# Questoes: 
  # Tenho que normalizar usando a mesma media e desvio padrão
  # Se eu fiz o treino com os atributos E ~ A,B,C,D e meu pred_teste vai ser
    # A,B,C,D,E  fiz o pred aqui, Pergunta: O E vai ser usado para o teste tb ou nao ?
  # Criar funcao  para guardar resultado numa pasta confusionmatrix 
  # e visualizacao.
  # Criar outros Algs para testar o desempenho -> RedesNeurais
  # Mostrar a analise descritiva que fiz e discorrer sobre as Funções que são assimétricas 
  # O que devo fazer e pq ? Usei o mini-max mas nao correu bem ?
  # A normalizacao que estou fazendo nao esta sendo eficiente, o que devo fazer ?
  # Voce pode me ajudar com redes neurais ???

################################################
setwd('/home/raul/R/RProjects/Forest_Cover_Type_ Prediction/src')

library('caret')
library("dplyr")
library("randomForest")
source('pre_process_functions.R')
source('preprocess.R')
source('pos_process.R')
source('test.R')
source('main_submit_model.R')
source('ml_model.R')
library(nnet)


setwd('/home/raul/R/RProjects/Forest_Cover_Type_ Prediction/data')

train_data <- read.csv("train.csv", sep = ',')
test_data <- read.csv("test.csv", sep = ',')

train_data$Cover_Type <- as.factor(train_data$Cover_Type)

training <<- train_data
testing <<-  test_data

MainTestFunction(training)
MainSubmitFunction(training,testing)










