library(Hmisc)
names(train_data)

library(corrgram)
library(rattle)
corrgram(mtcars, order=NULL, lower.panel=panel.shade,
         )upper.panel=NULL, text.panel=panel.txt,
         main="Car Milage Data (unsorted)"
rcorr(as.matrix(train_data))

# Correlations with significance levels
library(Hmisc)
rcorr(x, type="pearson") # type can be pearson or spearman

#mtcars is a data frame 
a <- rcorr(as.matrix(training[,c(2,3,4,5,6,7,8,9,10)]))

df_correlacao=data.frame(a$r)

# O que fazer com correlaçao negativa ??

# Evandro, qual o teu procedimento ? Por onde vc começa ? Quais os passos basicos que vc faz ?
# vc constuma criar muitas vizualizações ?




# Exploratory Analise
  # Entender os atributos + Problema
  # Frequencia # dados categoricos = frequencia
  # Distribuição dados quantitativos
        # Variavel numerica: ver outliers, shape da distribuição  
  # Summary    
  # Using tree para entender quais atributos são importantes

# Transform data 1

  # ZScoreStandardize
  # Distribuição assimetrica -> minimax
  # NA Value
  
# Transform data 2

# Atribute Engineering

# Avaliar o Modelo
    # Classificação olhar a curva Roc
    # Plotar matrix de confusão


training_without_id <- training[,-c(1)]


modFit <- train(Cover_Type  ~ .,
                          data=training, method = "rpart")
fancyRpartPlot(modFit$finalModel)









  