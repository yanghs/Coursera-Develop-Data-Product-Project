require(rCharts)

output$nvd3plot <- renderChart({
        mpgData <- mtcars
        mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
        
        n1 <- nPlot(mpg, group = input$variable, type = input$type,
                    data = mpgData
        )
        n1$set(dom = 'nvd3plot', width = 600)
        n1
})