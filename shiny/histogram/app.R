library(shiny)

# Define UI for application that draws a histogram
ui <-  fillPage(
    
    # App title ----
    title = "Frequency distribution graph",
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 10,
                        max = 15,
                        value = 10)
        ),
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    input
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'skyblue', border = 'black',
             xlab = 'Maximum heart rate',
             main = '')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
