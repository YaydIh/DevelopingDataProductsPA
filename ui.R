library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel(
    p(
     h2("New Orleans Police Department "),
     h3("911 Calls for Service -- 2014"),
     h4("WRECKLESS DRIVING, DRIVING WHILE UNDER INFLUENCE")
    )
  ),

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
      tabsetPanel(
        tabPanel("Overview", verbatimTextOutput("summary")),
        tabPanel("Directions", verbatimTextOutput("directions")),
        tabPanel("Plots",
          plotOutput("distPlot1"),
          plotOutput("distPlot2"),
          plotOutput("distPlot3")
        )
      )
    )
  )
))
