library('ggplot2')

df_fuel_type <-read.csv('/Users/a0000/Desktop/Data Vis/pie_chart_data.csv',
                        header = TRUE,
                        sep = ',')

pie_chart <- ggplot(df_fuel_type,
                    aes(x = "",
                        y = Number.of.Cars,
                        fill = Engine.Fuel.Type))+
                      geom_bar(stat = 'identity',
                               width = 1)+
                      coord_polar("y")

pie_chart
percentages <- paste0(round(df_fuel_type$Number.of.Cars/sum(df_fuel_type$Number.of.Cars)*100,1),"%")
pie_chart <- pie_chart + geom_text(aes(label = percentages),
                                   position = position_stack(vjust = 0.5))
pie_chart
pie_chart <-pie_chart + labs(x = NULL,
                             y = NULL,
                             fill = NULL,
                             title = "Cars by Engine Fuel Type")
pie_chart
cbPalette <- c("#999999","#56B4E9","#009E73","#0072B2","#D55E00","#CC79A7")
pie_chart <- pie_chart + scale_fill_manual(values = cbPalette)
pie_chart <- pie_chart + theme_classic()+
                         theme(axis.line = element_blank(),
                               axis.text = element_blank(),
                               plot.title = element_text(hjust = 0.5))
pie_chart




