library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Hello Shiny!"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
     checkboxGroupInput(
       "checkGroup1",
       label = h4("Graph 1"),
       choices = list( 
         'Sunday'    = 1,
         'Monday'    = 2,
         'Tuesday'   = 3,
         'Wednesday' = 4,
         'Thursday'  = 5,
         'Friday'    = 6,
         'Saturday'  = 7),
       selected= 1:7
     ),
     hr(),
     checkboxGroupInput(
       "checkGroup2",
       label = h4("Graph 2"),
       choices = list( 
         'Sunday'    = 1,
         'Monday'    = 2,
         'Tuesday'   = 3,
         'Wednesday' = 4,
         'Thursday'  = 5,
         'Friday'    = 6,
         'Saturday'  = 7),
       selected= 1:7
     )
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("myText1"),
      textOutput("myText2"),
      plotOutput("distPlot1"),
      plotOutput("distPlot2"),
      plotOutput("distPlot3")
    )
  )
))
