PosProcessing <- function(df_pos_process_testing,df_pos_process_final_testing,pos_process_pred){
  
  df_pos_process_final_testing$pred <- pos_process_pred
  df_pos_process_final_testing$Id <- df_pos_process_testing$Id 
  
  df_pos_process <- data.frame(df_final_testing$Id,df_final_testing$pred,df_final_testing$Cover_Type)
  
  colnames(df_pos_process)[1] <- "Id"
  colnames(df_pos_process)[2] <- "pred"
  colnames(df_pos_process)[3] <- "Cover_Type"
  
  ggplot(df_pos_process, aes(x = pred, y = Cover_Type)) + geom_jitter()
  confusionMatrix(df_final_testing$pred,df_final_testing$Cover_Type)
  
  
  
}

