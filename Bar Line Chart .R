library(ggplot2)
df_kdnuggets <- read.csv("/Users/a0000/Desktop/Data Vis/Bar and Line Chart/bar_line_chart_data.csv",
                         header = TRUE)

combo <- ggplot(df_kdnuggets,
                aes(x = Year,
                    y = Participants, Python.Users))+
                #使用了aes()函數，並指定了y為df_kdnuggets$Participants
                geom_bar(aes(y = df_kdnuggets$Participants),
                         #stat = "identity": 這個參數指定統計方法，
                         #"identity" 表示使用原始數據值作為條形圖的高度。
                         stat = "identity",
                         fill = "black")+
                #這表示Y軸上的數據是"Python.Users"欄位的數據乘以"Participants"欄位的最大值。
                #因為bar & line的數據相差太大，如果直接放在一起，line會出現在圖的最底部
                geom_line(aes(y = df_kdnuggets$Python.Users*max(df_kdnuggets$Participants)),
                          stat = "identity",
                          color = "red",
                          size = 2)+
                
               scale_y_continuous(sec.axis = sec_axis(~./max(df_kdnuggets$Participants)*100, 
                                               name = "Python Users in %"))+
                ggtitle("KD Nuggets Survey Python Users(2012 - 2019)")
                
combo
