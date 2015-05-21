library(shiny)
library(lubridate)

myData <- read.csv(file="data/9898.csv", header=TRUE, sep=",")
myData$ldate <- mdy_hms(myData$TimeCreate)
myData$hour  <- hour(myData$ldate)
myData$wday  <- wday(myData$ldate)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

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
     main="TODO", 
     col = 'lightpink',
     border = 'white',
     freq=FALSE,
     xlab="hour of the day",
     ylim=c(0,.1))
    
    di1 <- dataInput1()
    if (length(di1>0)) {
      lines(density(di1, adjust = 2), col = "red")
    }
    di2 <- dataInput2()
    if (length(di2>0)) {
      lines(density(di2, adjust = 2), col = "green")
    }
    lines(density(myData$hour, adjust = 2), col = "blue")

  })

  output$distPlot2 <- renderPlot({
    x    <- dataInput2()
    bins <- -1:23
    # draw the histogram with the specified number of bins
    hist(
     x, 
     breaks = bins, 
     main="TODO", 
     col = 'lightgreen', 
     border = 'white',
     freq=FALSE,
     xlab="hour of the day",
     ylim=c(0,0.1))
    di1 <- dataInput1()
    if (length(di1>0)) {
      lines(density(di1, adjust = 2), col = "red")
    }
    di2 <- dataInput2()
    if (length(di2>0)) {
      lines(density(di2, adjust = 2), col = "green")
    }
    lines(density(myData$hour, adjust = 2), col = "blue")
  })

  output$distPlot3 <- renderPlot({
    x    <- myData$hour  
    bins <- -1:23
    # draw the histogram with the specified number of bins
    hist(
     x, 
     breaks = bins, 
     main="TODO", 
     col = 'lightblue', 
     border = 'white',
     freq=FALSE,
     xlab="hour of the day",
     ylim=c(0,0.1))
    di1 <- dataInput1()
    if (length(di1>0)) {
      lines(density(di1, adjust = 2), col = "red")
    }
    di2 <- dataInput2()
    if (length(di2>0)) {
      lines(density(di2, adjust = 2), col = "green")
    }
    lines(density(myData$hour, adjust = 2), col = "blue")
  })
  
  source("overview.R")
  output$summary <- renderText(overviewText)

  source("directions.R")
  output$directions <- renderText(directionsText)

})

