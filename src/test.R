MainTestFunction <- function(training){
  
  traning_standardize <- training
  inTrain <- createDataPartition(y = traning_standardize$Cover_Type, p = 0.7, list = FALSE )
  training <- traning_standardize[inTrain,] 
  testing <-  traning_standardize[-inTrain,]  
  
  # Tenho que normalizar usando a mesma media e desvio padrão
  # Nao esta funcionando bem 
  df_final_training <- Standardize(training)
  df_final_testing <- Standardize(testing)
  # Teste sem usar a normalizacao
#   df_final_training <- training
#   df_final_testing <- testing 
  
  
#   df_final_training <- Pre_Process(df_final_training)
#   df_final_testing <- Pre_Process(df_final_testing)
  

  mod_nll <- NLLmodel(df_final_training)
  pred <- as.factor(predict(mod_nll, df_final_testing[,-c(56)], type="class"))
  PosProcessing(testing,df_final_testing,pred)

  mod_rf <- RFmodel(df_final_training) 
  pred <- predict(mod_rf, newdata = df_final_testing)
  PosProcessing(testing,df_final_testing,pred)
  
}


