
df_test_outras_midias <- read.csv('outras_midias_get_data_test.csv', sep = ',')



ids <- group_by(df_test_outras_midias, oferta_opcao.id_oferta)

delay <- summarise(ids,
                   count = n())

df_test_outras_midias$count = NA
ifelse(df_test_outras_midias$oferta_opcao.id_oferta 
       == delay$oferta_opcao.id_oferta, (df_test_outras_midias$count = 1), 'NO')

# id, n_venda_total, uf_cliente
# Definir valor da probabilidade e pensar como usar a forma randomica.
