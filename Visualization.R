##### Visualization #########

mydata <- read.csv("C:/Users/desk/Documents/Artificial Intelligence Specialist - LEA.E3/iris.csv")
mydata

install.packages("ggplot2")
library(ggplot2)

#Scatter plot
# aes - aestetic

# 
Plot_1 <- ggplot(mydata,aes(x=sepal.length,y=petal.width,color=variety)) + geom_point()
Plot_2 <- ggplot(mydata,aes(x=sepal.width,y=petal.length,color=variety)) + geom_point()


# Choose 2 column from the dataset

df_select <- mydata %>%select(sepal.length,sepal.width)
df_select

# We save/persist the 2 new column in a new file in the folder
# mydata - is the modified dataset
# file - it's where the location you want to save the file on your drive
# row.names - the index column (TRUE - save the index column, FALSE - not save the index column in the file)
write.csv(df_select,file="C:/Users/desk/Documents/Artificial Intelligence Specialist - LEA.E3/GIT_projects/CDI_2024_2025/df_select.csv",row.names = TRUE)

##########################################################

############# Deploying a solution

# install.packages("shinyr"), that waht is the package name

library(shiny)

ui <- fluidPage(
  titlePanel("Histogram"),
  sliderInput("nb_bins","#Bins",5,10,5),
  plotOutput("hist"))

server <- function(){
  output$hist <- renderPlot({
    hist(faithful$waiting,breaks=input$nb_bins,col="steelblue")
  
  })
 
}

shinyApp(ui=ui,server=server)

ui <- fluidPage( 
  titlePanel("Histogram"), 
  sliderInput('nb_bins','# Bins',5,10,5), 
  plotOutput('hist'))

server <-function(input, output, session){
  output$hist <- renderPlot({
    hist(faithful$waiting,breaks = input$nb_bins,col ='steelblue')
  })
}
shinyApp(ui = ui, server = server)



