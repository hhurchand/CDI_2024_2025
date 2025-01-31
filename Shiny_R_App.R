# Step 1 : Load shiny library

library(shiny)

# Step 1: Create a UI (User Interface) - frontend

ui <- fluidPage(
titlePanel("Quadratic Calculator"),  
  selectInput("Coeff_x2","Insert the coefficient of x^2",c=0:10),
  sliderInput("Coeff_x","Insert the coefficient of x",value=0,min=0,max=10),
  textInput("Constant","Insert the constant"),
textOutput("a"),
textOutput("discriminant")

)

# Step 3: Create server - Handle the back-end

server <- function(input,output,sessionInfo){

# -----------------------------------------------------------------------------------------
  
  discriminant <- function (){
    a <- as.numeric(input$Coeff_x2)
    b <- as.numeric(input$Coeffx)
    c <- as.numeric(input$Constant)
    
      D <- (b)^2 - (4*a*c)
       return (D)
  
  }
  
  
  
# -------------------------------------------------------------------------------------------
output$a <- renderText(
    {
    paste("Your Quadratic has as value",input$Coeff_x2," for x^2 coeff")
    }
  )

output$discriminant <- renderText(
  {
    paste ("Discriminant is",discriminant())
    
  }
) 

# -------------------------------------------------------------------------------------------

}

# Step 4: Show the App

shinyApp(ui=ui,server=server)


