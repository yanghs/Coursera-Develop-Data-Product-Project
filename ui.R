library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Motor Trend Project: Fuel Efficiency by Automobile Characteristics"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        selectInput("variable", "Variable:",
                                    c("Transmission" = "am",
                                      "Cylinders" = "cyl",
                                      "Gears" = "gear")),
                        sliderInput("bins",
                                    "Binwidth:",
                                    min = 1,
                                    max = 10,
                                    value = 5)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        h3("Average MPG by Group"),
                        verbatimTextOutput("summary"),
                        h3("Histogram of MPG by Group"),
                        plotOutput("distPlot")
                )
        )
))