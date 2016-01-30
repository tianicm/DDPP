library(shiny)

# The below commands create the interface for this application
shinyUI(pageWithSidebar(
  
  headerPanel("Your Basic unit Rate Converter"),
  sidebarPanel(
    conditionalPanel(condition="input.conditionedPanels==1", h2("Application Usage"),  
                     helpText("This application was created to easily provide a converter rate for your basic measurement units.
                              Click on each tab panels (either Mass, Length, Time or Volume), choose two units to convert, 
                              and you should see a displayed result on the main panel. All the results for the chosen measurement 
                              units will be displayed on the main panel.")
                     ),
    conditionalPanel(condition="input.conditionedPanels==2",
                     h2("Mass Converter Rate"), selectInput("InputMass", "Choose input unit", choices = c("Metric Ton", "Kilogram", "Gram", "Milligram", "Microgram", "Imperial Ton", "US Ton", "Stone", "Pound", "Ounce")),
                     selectInput("OutputMass", "Choose output unit", choices = c("Metric Ton", "Kilogram", "Gram", "Milligram", "Microgram", "Imperial Ton", "US Ton", "Stone", "Pound", "Ounce"), selected = "Ounce") 
    ),
    conditionalPanel(condition="input.conditionedPanels==3",
                     h2("Length Converter Rate"), selectInput("InputLength", "Choose input unit", choices = c("Kilometer", "Meter", "Centimeter", "Millimeter", "Micrometer", "Nanometer", "Mile", "Yard", "Inch", "Foot", "Nautical mile")),
                     selectInput("OutputLength", "Choose output unit", choices = c("Kilometer", "Meter", "Centimeter", "Millimeter", "Micrometer", "Nanometer", "Mile", "Yard", "Inch", "Foot", "Nautical mile"), selected = "Inch")  
    ),
    conditionalPanel(condition="input.conditionedPanels==4",
                     h2("Time Converter Rate"), selectInput("InputTime", "Choose input unit", choices = c("Nanosecond", "Microsecond", "Millisecond", "Second", "Minute", "Hour", "Day", "Week", "Month", "Year", "Decade", "Century")),
                     selectInput("OutputTime", "Choose output unit", choices = c("Nanosecond", "Microsecond", "Millisecond", "Second", "Minute", "Hour", "Day", "Week", "Month", "Year", "Decade", "Century"), selected = "Second")  
    ),
    conditionalPanel(condition="input.conditionedPanels==5",
                     h2("Volume Converter Rate"), selectInput("InputVolume", "Choose input unit", choices = c("US Liquid Gallon", "US Liquid Quart", "US Liquid Pint", "US Legal Cup", "US Fuid Ounce", "US Tablespoon", "US Teaspoon", "Liter", "Milliliter")),
                     selectInput("OutputVolume", "Choose output unit", choices = c("US Liquid Gallon", "US Liquid Quart", "US Liquid Pint", "US Legal Cup", "US Fuid Ounce", "US Tablespoon", "US Teaspoon", "Liter", "Milliliter"), selected = "Milliliter")  
    )
                     ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("How it works", value=1), h2("Results"),
      
      tabPanel("Mass", value=2), h3("Your Mass Converting Rate:"), strong(textOutput("iuMass")), 
      
      tabPanel("Length", value=3), h3("Your Length Converting Rate:"), strong(textOutput("iuLength")),
      
      tabPanel("Time", value=4), h3("Your Time Converting Rate:"), strong(textOutput("iuTime")),
      
      tabPanel("Volume", value=5), h3("Your Volume Converting Rate:"), strong(textOutput("iuVolume")),
      id = "conditionedPanels"
    )
  )
  
  ))