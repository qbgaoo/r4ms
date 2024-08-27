library(shiny)

# Define UI for application that draws a histogram
ui = fillPage(
  title = "Frequency distribution histogram",
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Number of bins:", min = 9, max = 16, value = 10)),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("distPlot"))
  )
)

# Define server logic required to draw a histogram
server = function(input, output) {
  output$distPlot <- renderPlot(
    {
      # generate bins based on input$bins from ui.R
      x <- pull(max_hr)
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(
        x, 
        breaks         = bins, 
        freq           = T,
        right          = F, 
        col            = "skyblue", 
        include.lowest = T,
        main           = " ",
        xlab           = "Maximum heart rate",
        ylab           = "Frequency",
        ylim           = c(0, 32),
        labels         = T)
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
