library(UsingR)

wtconvert <- function(wtunit){
  if(wtunit == "kilograms"){wtc <- 1}
  else if(wtunit == "pounds"){wtc <- 0.45359237}
  else if(wtunit == "bags of cement"){wtc <- 42.63768}
  else{wtc <- 0.00086}
  return(wtc)
}

htconvert <- function(htunit){
  if(htunit == "metres"){htc <- 1}
  else if(htunit == "inches"){htc <- 0.0254}
  else if(htunit == "feet"){htc <- 0.3048}
  else{htc <- 0.0104}
  return(htc)
}

bmicalc <- function(wt, ht, wtunit, htunit){
  if(wt == 0 && ht == 0){return("")}
  else{
    wtc <- wtconvert(wtunit)
    htc <- htconvert(htunit)
    w <- wt*wtc
    h <- ht*htc
    bmi <- w/(h^2)
  return(bmi)
  }
}


bmiclass <- function(bmi, wtunit, htunit){
  if(bmi == ""){return("")}
  else if(bmi == Inf){return("a black hole")}
  else if(bmi == 0)(return("an electromagnetic wave"))
  else{
      if(bmi < 16){return("severely thin")}
      else if(bmi >= 16 && bmi < 17){return("moderately thin")}
      else if(bmi >= 17 && bmi < 18.5){return("mildly thin")}
      else if(bmi >= 18.5 && bmi < 25){return("normal")}
      else if(bmi >= 25 && bmi < 30){return("overweight")}
      else if(bmi >= 30 && bmi < 40){return("obese")}
      else{return("severely obese")}
  }
}



shinyServer(
  function(input, output) {
    bmi <- reactive(bmicalc(input$wt, input$ht, input$wtunit, input$htunit))
    output$bmi <- renderText({as.character(bmi())})
    output$whoclass <- renderText({bmiclass(bmi(), input$wtunit, input$htunit)})
  }
)

