
# Coursera Course Project: Shiny Application and Reproducible Pitch


library(shiny) 
library(datasets) 
library(dplyr) 


shinyServer(function(input, output) { 
  
  
  #correspond to the filters 
  output$table <- renderDataTable({ 
    disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1) 
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1) 
    mpg_seq <- seq(from = input$mpg[1], to = input$mpg[2], by = 0.1)
    qsec_seq <- seq(from = input$qsec[1], to = input$qsec[2], by = 0.01)
    qsec_wt <- seq(from = input$wt[1], to = input$wt[2], by = 0.001)
    
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      Cylinders = cyl, Displacement = disp, Horsepower = hp,  
                      Transmission = am, EngineType = vs, MilesPerGallon = mpg, 
                      QuarterMile = qsec, Weight = wt) 
    
    data <- filter(data, Cylinders %in% input$cyl,
                   MilesPerGallon %in% mpg_seq, Displacement %in% disp_seq, Horsepower %in% hp_seq, 
                   Transmission %in% input$am, EngineType %in% input$vs, QuarterMile %in% qsec_seq, Weight %in% qsec_wt) 
    
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- mutate(data, EngineType = ifelse(EngineType==0, "V Engine", "Straight Engine"))
    data 
  }, options = list(lengthMenu = c(5, 10), pageLength = 5)) 
}) 
