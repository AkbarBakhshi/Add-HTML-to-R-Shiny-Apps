#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  ######## 1 - HTM using R Shiny tags
  tags$head(tags$link(rel = "stylesheet", href = "styles.css")),
  tags$head(tags$link(rel = "preconnect", href = "https://fonts.googleapis.com")),
  tags$head(tags$link(rel = "preconnect", href = "https://fonts.gstatic.com")),
  tags$head(tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Roboto:wght@400;700;900&display=swap")),
  # Application title
  tags$head(tags$title('Welcome to Data2Web Channel')),
  
  ######## 2 - A div wrapper(you can Remove "withTags")
  withTags({
    div(
      class = "header",
      checked = NA,
      h1("What’s Going On in This Graph? | Hotter Summers"),
      h3("Let's find out"),
      p("Are summer nights getting hotter? How have minimum daily temperatures from June through August changed over the past 60 years in nine cities?"),
      img(width = 100, src = "logo.png")
    )
  }),
  
  ######## 3 other R shiny built-in elements
  # Sidebar with a slider input for number of bins
  sidebarLayout(sidebarPanel(
    sliderInput(
      "bins",
      "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  
  # Show a plot of the generated distribution
  mainPanel(plotOutput("distPlot"))),
  
  ######## 4 - Using HTML tag
  HTML("<div class='my-button'>
          <a href='https://www.latenightcoders.club/community' class='btn btn-primary' target='_blank'>Join today</a>
        </div>
      "),
  
)



# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(
      x,
      breaks = bins,
      col = 'red',
      border = 'white',
      xlab = 'Waiting time to next eruption (in mins)',
      main = 'Histogram of waiting times'
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
