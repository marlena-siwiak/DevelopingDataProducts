library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Body Mass Index Calculator"),
  sidebarPanel(
    numericInput('wt', 'Your weight:', 0, min = 0, max = 100000, step = 0.01),
    selectInput("wtunit", "in", choices = c("kilograms", "pounds", "bags of cement", "m&m candies"), selected="kilograms"),
    numericInput('ht', 'Your height:', 0, min = 0, max = 100000, step = 0.01),
    selectInput("htunit", "in", choices = c("metres", "inches", "feet", "m&m candies"), selected="metres"),
  submitButton('Submit')
  ),
  mainPanel(
    img(src = "bmi.jpg", height = 72),
    h5('Your BMI is...', textOutput("bmi")),
    h5('According to WHO classification you are...', textOutput("whoclass")),
    tags$a(href="help.html", "Help")
  )
))






