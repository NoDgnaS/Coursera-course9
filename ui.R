#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)

# Define
shinyUI(pageWithSidebar(
  
  #title
  headerPanel("Easy to Find the Car You Want"),
  
  # sidebarpanel
  sidebarPanel(
                                helpText("Adjust the eight items below to find your car"), 
                                sliderInput('mpg', 'Miles Per Gallon', min=10, max=40, value=c(10,40), step=0.1),
                                numericInput('cyl', 'Number of cylinders',6, min=4, max=8, step=2),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=0.1),
                                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=1), 
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
                                checkboxGroupInput('vs', 'EngineType:', c("V Engine"=0, "Straight Engine"=1), selected = c(0,1)),
                                sliderInput('qsec', 'Quarter Mile', min=14, max=25, value=c(14,25), step=0.01),
                                sliderInput('wt', 'Weight', min=1.5, max=5.5, value=c(1.5,5.5), step=0.001)
                              ), 
                              
                              
                              mainPanel( 
                                dataTableOutput('table') 
                              ) 
                            ) 
                   )
