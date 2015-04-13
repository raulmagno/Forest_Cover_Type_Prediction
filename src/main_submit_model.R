MainSubmitFunction <- function(training,testing){
  
  training <- Standardize(training)
  # normalizar usando a mesma media e desvio padrão
  testing <- Standardize(testing)
  
  df_final_training <- Pre_Process(training)
  df_final_testing <- Pre_Process(testing)
  
  mod_rf <- RFmodel(df_final_training) 
  
  pred <- predict(mod_rf, newdata = df_final_testing)
  df_final_testing$pred <- pred
  
  # Pos process  
  df_final_testing$Id <- testing$Id 
  df_pos_process <- data.frame(df_final_testing$Id,df_final_testing$pred)
  
  colnames(df_pos_process)[1] <- "Id"
  colnames(df_pos_process)[2] <- "Cover_Type"
  
  write.csv(df_pos_process,"ForestCover.csv", row.names = FALSE)
  
  
}
