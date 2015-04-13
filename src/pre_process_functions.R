# Replicar para o resto das variaveis
clustering_atributes <- function(vector_index,name_new_colunm,df_all_values){
    df_all_values$name_new_colunm <- apply(df_all_values[,vector_index],1,sum)
    colnames(df_all_values)[match("name_new_colunm",names(df_all_values))] <- name_new_colunm[1]
    return (df_all_values)  
}

Remove_Types_Soils_Already_In_The_Cluster <- function(df_with_clusters,list_soils_to_remove){
  
  df_with_clusters[setdiff(names(df_with_clusters), list_soils_to_remove)]
  
}
  


