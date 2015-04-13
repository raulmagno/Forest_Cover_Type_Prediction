RFmodel <- function(df_ml_final_training){
  
  mod_rf <- train(Cover_Type ~ . ,
                  data = df_ml_final_training,
                  method = "rf", tuneGrid = data.frame(mtry = 6),allowParallel=TRUE)
  return(mod_rf)
} 

NLLmodel <- function(df_ml_final_training){
  
  ideal <- class.ind(df_ml_final_training$Cover_Type)
  mod_nll <- nnet(df_ml_final_training[,-c(56)], ideal, 
                 size=10, softmax=TRUE)
#   net.sqrt <- neuralnet(df_ml_final_training$Cover_Type ~ ideal,df_ml_final_training[,-c(56)], hidden=13, threshold=0.01)
#   net.sqrt <- neuralnet(Output~Input,trainingdata, hidden=13, threshold=0.01)
  return(mod_nll)
} 


