
Pre_Process <- function(df_main_data){
  #df_main_data <- training
  
  ## Rock_outcrop
  df_pre_process <- df_main_data[,-c(1,5)]
  vector_rock_outcrop <- c("Soil_Type1","Soil_Type3","Soil_Type4","Soil_Type5","Soil_Type6",
              "Soil_Type10","Soil_Type27","Soil_Type28","Soil_Type32","Soil_Type33",
              "Soil_Type35","Soil_Type37")
  name_new_colunm <- 'Rock_outcrop'
  df_pre_process  <- clustering_atributes(vector_rock_outcrop,name_new_colunm,df_pre_process)
  df_pre_process  <- Remove_Types_Soils_Already_In_The_Cluster(df_pre_process,vector_rock_outcrop)
  
  ## Rock_land 
  vector_rock_land <- c("Soil_Type11","Soil_Type12","Soil_Type13","Soil_Type30","Soil_Type34",
              "Soil_Type36","Soil_Type40")
  name_new_colunm <- 'Rock_land'
  df_pre_process  <- clustering_atributes(vector_rock_land,name_new_colunm,df_pre_process)
  df_pre_process  <- Remove_Types_Soils_Already_In_The_Cluster(df_pre_process,vector_rock_land)
  return (df_pre_process)  
}

Standardize <- function(df_frame){
  
  df_frame$Elevation <- scale(df_frame$Elevation, center = TRUE , scale = TRUE)
  df_frame$Aspect <- scale(df_frame$Aspect, center = TRUE , scale = TRUE)
  df_frame$Slope <- scale(df_frame$Slope, center = TRUE , scale = TRUE)
  df_frame$Horizontal_Distance_To_Hydrology <- scale(df_frame$Horizontal_Distance_To_Hydrology, center = TRUE , scale = TRUE)
  df_frame$Vertical_Distance_To_Hydrology <- scale(df_frame$Vertical_Distance_To_Hydrology, center = TRUE , scale = TRUE)
  df_frame$Horizontal_Distance_To_Roadways <- scale(df_frame$Horizontal_Distance_To_Roadways, center = TRUE , scale = TRUE)
  df_frame$Hillshade_9am <- scale(df_frame$Hillshade_9am, center = TRUE , scale = TRUE)
  df_frame$Hillshade_Noon <- scale(df_frame$Hillshade_Noon, center = TRUE , scale = TRUE)
  df_frame$Hillshade_3pm <- scale(df_frame$Hillshade_3pm, center = TRUE , scale = TRUE)
  df_frame$Horizontal_Distance_To_Fire_Points <- scale(df_frame$Horizontal_Distance_To_Fire_Points, center = TRUE , scale = TRUE)
  return (df_frame)
}



