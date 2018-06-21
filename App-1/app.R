#Shiny Template

library(shiny)
ui <- fluidPage("Trial App",
                
                sliderInput(inputId = "num",
                            label = "Choose a Number:",
                            value = 25, 
                            min = 1, 
                            max = 100),
                
                textInput(inputId = "title",
                          label = "Create a Title:",
                          value = "Histogram of Random Normal Values"),
                
                actionButton(inputId = "update", 
                             label = "Update Graph"),
                
                plotOutput("hist"),
                
                verbatimTextOutput("stats")
                )

server <- function(input,output) {
  
  data <- eventReactive(input$update, {
    rnorm(input$num)
  })
  
  title <- eventReactive(input$update, {
    input$title
  })
  
  observeEvent(input$button, {
    print(as.numeric(input$button))
  })
  
  output$hist <- renderPlot( {
    hist(data(), main = title())
  })
  output$stats <- renderPrint({
    summary(data())
  })
  
}

shinyApp(ui=ui,server=server)
