library(ggplot2)

df_ad_enpenditure <- read.csv("/Users/a0000/Desktop/Data Vis/Regression Plot/scatter_plot_ii.csv",
                              header = TRUE,
                              sep = ",")

regression_scatter <-  ggplot(df_ad_enpenditure,
                       aes(x = Budget,
                           y = Sales))+
                #繪製散佈圖上的點
                geom_point(size = 3,
                           color = 'grey12')+
                #繪製回歸（平滑）線(method = linear)
                geom_smooth(method = lm,
                            # remove blue area around reg line
                            se = FALSE,
                            color = "red",
                            fill = "red")+
                theme_classic()+
                xlab("Ad Expenditure in (000's $)")+
                ylab("Sales in (000's Units)")+
                ggtitle("Effect of Ad Expenditure on Sales")

regression_scatter