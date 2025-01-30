# LOAD DATASET
#
df <- read.csv("C:/Users/hhurchand/Downloads/iris.csv")
df

# DATA VIZ
install.packages("ggplot2")
library(ggplot2)

# A SCATTER PLOT
ggplot(df, aes(x = sepal.length, y = petal.width,color=variety)) + geom_point()

library(dplyr)
df_select <- df %>% select(sepal.length,petal.width)
df_select

# PERSIST OR SAVE df_select
write.csv(df_select, 
	file = 
	"C:/Users/hhurchand/GITPROJECTS/CDI_2024_2025/select_clean.csv",
	row.names = TRUE)


#####################################################

## DEPLOYING A SOLUTION

library(shiny)

ui <- fluidPage(
titlePanel("Histogram"),
sliderInput('nb_bins','#Bins',5,10,5),
plotOutput('hist')
)

server <- function(){
output$hist <- renderPlot({

hist(faithful$waiting, breaks=input$nb_bins,col='steelblue')


})

}


shinyApp(ui=ui,server=server)


