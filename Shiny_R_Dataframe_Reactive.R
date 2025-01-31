# Step 1 : Load library--------------------------------------------------------------------

library(shiny)
library(DT)
library(ggplot2)

#------------------------------------------------------------------------------------------------
read_csv_file <- function(path){
  read.csv(path)
  
}


# Step 2: Create a UI (User Interface) - frontend------------------------------------------------

ui <- fluidPage(
  titlePanel("EXPLORING IRIS DATASET"),
#  shinythemes::themeSelector(), # Either you have them selected panel where you can choose or----
  theme=shinythemes::shinytheme("journal"), # or------ you manually selected the theme
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Select CSV File"), # You can also set the file parameter/restriction etc
      selectInput("features","Select a feature",
                  
                  choices=c("sepal.length",
                            "sepal.width",
                            "petal.length",
                            "petal.width") # still within the select_Input
                  
                  )
    ),
    mainPanel(
      plotOutput("histogram"),
      DTOutput("Contents")
      
      
    )
    
  )
)

# Step 3: Create server - Handle the back-end----------------------------------------------------

server <- function(input,output,sessionInfo){
  
  data <- reactive({
    req(input$file)
    read_csv_file(input$file$datapath)
  })
  
  output$Contents <- renderDT({
    data()
  })
  
  output$histogram <- renderPlot({
    ggplot(data(),aes_string(x=input$features))+ 
      geom_histogram(bins=30,fill="orange",color="black")+
      labs(title=paste("Histogram of",input$features),
           x=input$features,
           y="Count")
  })

  
}

# Step 4: Show the App---------------------------------------------------------------------------

shinyApp(ui=ui,server=server)
