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
       label = h4("Red Graph"),
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
       label = h4("Green Graph"),
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
      plotOutput("distPlot1"),
      plotOutput("distPlot2"),
      plotOutput("distPlot3")
    )
  )
))
