library(shiny)
library(lubridate)

myData <- read.csv(file="data/9898.csv", header=TRUE, sep=",")
myData$ldate <- mdy_hms(myData$TimeCreate)
myData$hour <- hour(myData$ldate)
myData$wday <- wday(myData$ldate)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot


  output$myText1 <- renderText({ paste(input$checkGroup1) })
  output$myText2 <- renderText({ paste(input$checkGroup2) })

  dataInput1 <- reactive({
    myData[myData$wday %in% input$checkGroup1,c("hour")]
  })
  dataInput2 <- reactive({
    myData[myData$wday %in% input$checkGroup2,c("hour")]
  })
  output$distPlot1 <- renderPlot({
    x    <- dataInput1()
    bins <- -1:23
    # draw the histogram with the specified number of bins
    hist(
     x, 
     breaks = bins, 
     main="1", 
     col = 'lightpink', 
     border = 'white',
     freq=FALSE,
     ylim=c(0,.1))
    lines(density(dataInput1(), adjust = 2), col = "red")
    lines(density(dataInput2(), adjust = 2), col = "green")
    lines(density(myData$hour, adjust = 2), col = "blue")
  })
  output$distPlot2 <- renderPlot({
    x    <- dataInput2()
    bins <- -1:23
    # draw the histogram with the specified number of bins
    hist(
     x, 
     breaks = bins, 
     main="1", 
     col = 'lightgreen', 
     border = 'white',
     freq=FALSE,
     ylim=c(0,0.1))
    lines(density(dataInput1(), adjust = 2), col = "red")
    lines(density(dataInput2(), adjust = 2), col = "green")
    lines(density(myData$hour, adjust = 2), col = "blue")
  })
  output$distPlot3 <- renderPlot({
    x    <- myData$hour  
    bins <- -1:23
    # draw the histogram with the specified number of bins
    hist(
     x, 
     breaks = bins, 
     main="1", 
     col = 'lightblue', 
     border = 'white',
     freq=FALSE,
     ylim=c(0,0.1))
    lines(density(dataInput1(), adjust = 2), col = "red")
    lines(density(dataInput2(), adjust = 2), col = "green")
    lines(density(myData$hour, adjust = 2), col = "blue")
     
  })
  
})

