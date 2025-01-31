# Step 1 : Load library--------------------------------------------------------------------

library(shiny)
library(DT)

#------------------------------------------------------------------------------------------------
read_csv_file <- function(path){
  read.csv(path)
  
}

path <- "D:/Users/desk/Documents/Artificial Intelligence Specialist - LEA.E3/iris.csv"

# Step 2: Create a UI (User Interface) - frontend------------------------------------------------

ui <- fluidPage(
  titlePanel("EXPLORING IRIS DATASET"),  
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      DTOutput("Contents")
    )
    
  )
)

# Step 3: Create server - Handle the back-end----------------------------------------------------

server <- function(input,output,sessionInfo){
  output$Contents <- renderDT({
    read_csv_file(path)
  })

  
}

# Step 4: Show the App---------------------------------------------------------------------------

shinyApp(ui=ui,server=server)
