setwd("~/R/RProjects/email_novidades/src/")
library(ggplot2)
source('db_connections.R')
source('functions.R')
library(RImpala)

# Preciso add filtros
# Modificar meu codigo para pegar dados do Impala
setwd("~/R/RProjects/email_novidades/data")
connection <- GetConnection()
tables <- dbListTables()

email_marketing_pacotes_ofertados <- GetEmailPacotesOfertados()

outras_midias_pedidos_feitos_get_data <- GetTodasMidiasData()


setwd("~/R/RProjects/email_novidades/data")
outras_midias_pedidos_feitos <- read.csv("vendas.csv",sep = ',')
#outras_midias_pedidos_feitos <- FiltrosMidiasPedidosFeitos(outras_midias_pedidos_feitos_get_data) 

# Retorna True para todas os id que estão nas outra midias e não estão no email marketing
outras_midias_pedidos_feitos$ofertas_email_marketing <- !(outras_midias_pedidos_feitos$oferta_id_oferta %in% 
                                                          email_marketing_pacotes_ofertados$id_oferta)

ofertas_nao_divulgadas_marketing <- subset(outras_midias_pedidos_feitos,
                                    outras_midias_pedidos_feitos$ofertas_email_marketing != FALSE)

sugestao_de_pacotes <- data.frame(table(ofertas_nao_divulgadas_marketing$id_oferta))
sugestao_de_pacotes_maiores_cinco <- subset(sugestao_de_pacotes,sugestao_de_pacotes$Freq > 5)

# Tests
test <- dbSendQuery(connection, "SELECT TOP 10 * FROM oferta")
test_resul <- dbFetch(test)
View(test_resul)


# Tests
test <- dbSendQuery(connection, "SELECT * FROM tipo_divulgador
inner join divulgador on tipo_divulgador.id_tipo_divulgador = divulgador.id_tipo_divulgador
inner join campanha on divulgador.id_divulgador = campanha.id_divulgador")
test_resul <- dbFetch(test)
View(test_resul)
test_resul_resumo <- test_resul[,-c(1,3)]
test_resul_distinct <- distinct(select(test_resul_resumo,id_tipo_divulgador,descricao,nome,id_divulgador))
test_resul_distinct <- arrange(test_resul_distinct,descricao)
View(test_resul_distinct)
distinct(select(test_resul_distinct,id_divulgador))

rimpala.init(impala_home=NULL,libs="/usr/lib/impala/lib")
rimpala.init(libs="/usr/lib/impala/lib")

## Not run:
library(RImpala)
rimpala.init(libs = "lib/impala-jdbc-0.5-2")

rimpala.connect(IP = "10.12.2.71",port="21050")
rimpala.showdatabases()
rimpala.query(Q="show tables")
rimpala.usedatabase("marketing")
outras_midias_get_data <- rimpala.query("select * from vendas limit 10")
Viewrimpala.close()


####Test
colnames(outras_midias_pedidos_feitos_get_data)[2] <- "id_divulgador"; 
test <- merge(tabela_tipo_divulgador,outras_midias_pedidos_feitos_get_data,by = "id_divulgador")


# setwd("~/R/RProjects/email_novidades/data")
# outras_midias_pedidos_feitos_get_data <- read.csv("vendas.csv",sep = ',')







