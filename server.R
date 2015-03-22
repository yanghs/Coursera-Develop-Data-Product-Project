library(shiny)
library(ggplot2)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        formulaText <- reactive({
                paste(input$variable, "~." )
        })
        
        output$summary <- renderPrint({
                tapply(mpgData$mpg, mpgData[, input$variable], mean)
        })
        
        output$distPlot <- renderPlot({
                bins <- input$bins
                ggplot(mpgData, aes(x=mpg)) + geom_histogram(binwidth=bins,colour="white") + facet_grid(as.formula(formulaText()))
        })
})