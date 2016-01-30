library(shiny)

## Listing the Names of all the chosen units
Mass <- c("Metric Ton", "Kilogram", "Gram", "Milligram", "Microgram", "Imperial Ton", "US Ton", "Stone", "Pound", "Ounce")
Length <- c("Kilometer", "Meter", "Centimeter", "Millimeter", "Micrometer", "Nanometer", "Mile", "Yard", "Inch", "Foot", "Nautical mile")
Time <- c("Nanosecond", "Microsecond", "Millisecond", "Second", "Minute", "Hour", "Day", "Week", "Month", "Year", "Decade", "Century")
Volume <- c("US Liquid Gallon", "US Liquid Quart", "US Liquid Pint", "US Legal Cup", "US Fuid Ounce", "US Tablespoon", "US Teaspoon", "Liter", "Milliliter")

## same unit names in their plural for conversion
MassPlural <- c("Metric Tons", "Kilograms", "Grams", "Milligrams", "Micrograms", "Imperial Tons", "US Tons", "Stones", "Pounds", "Ounces") 
LengthPlural <- c("Kilometers", "Meters", "Centimeters", "Millimeters", "Micrometers", "Nanometers", "Miles", "Yards", "Inches", "Feet", "Nautical miles")
TimePlural <- c("Nanoseconds", "Microseconds", "Milliseconds", "Seconds", "Minutes", "Hours", "Days", "Weeks", "Months", "Years", "Decades", "Centuries")
VolumePlural <- c("US Liquid Gallons", "US Liquid Quarts", "US Liquid Pints", "US Legal Cups", "US Fuid Ounces", "US Tablespoons", "US Teaspoons", "Liters", "Milliliters")

## Conversion rates for all our chosen units
MassUnit <- c(1e+6,1000,1,0.001,1e-6,1.016e+6,907185,6350.29,453.592,28.3495)
LengthUnit <- c(1000,1,0.01,0.001,1e-6,1e-9,1609.34,0.9144,0.0254,0.3048,1852)
TimeUnit <- c(1e+9,1e+6,1000,1,0.0166667,0.000277778,1.1574e-5,1.6534e-6,3.8052e-7,3.171e-8,3.171e-9,3.171e-10)
VolumeUnit <- c(0.264172,1.05669,2.11338,4.16667,33.814,67.628,202.884,1,1000)

## Creating data frames for all our measurement units
MassDt <- data.frame(Mass,MassPlural,MassUnit)
LengthDt <- data.frame(Length,LengthPlural,LengthUnit)
TimeDt <- data.frame(Time,TimePlural,TimeUnit)
VolumeDt <- data.frame(Volume,VolumePlural,VolumeUnit)

colnames(MassDt) <- c("Name","Plural","Conversion")
colnames(LengthDt) <- c("Name","Plural","Conversion")
colnames(TimeDt) <- c("Name","Plural","Conversion")
colnames(VolumeDt) <- c("Name","Plural","Conversion")

# The functions below are used to calculate the conversion Rate for each of the selected measurement Unit.
shinyServer(
  function(input, output) {
    output$iuMass <- renderText({paste("1 ", input$InputMass, " is equivalent to ",
                                       MassDt[MassDt$Name==input$InputMass,'Conversion'] / 
                                         MassDt[MassDt$Name==input$OutputMass,'Conversion'],
                                       " ", MassDt[MassDt$Name==input$OutputMass,'Plural'])}
    )
    output$iuLength <- renderText({paste("1 ", input$InputLength, " is equivalent to ",
                                         LengthDt[LengthDt$Name==input$InputLength,'Conversion'] / 
                                           LengthDt[LengthDt$Name==input$OutputLength,'Conversion'],
                                         " ", LengthDt[LengthDt$Name==input$OutputLength,'Plural'])}
    )
    output$iuTime <- renderText({paste("1 ", input$InputTime, " is equivalent to ",
                                       TimeDt[TimeDt$Name==input$OutputTime,'Conversion'] / 
                                         TimeDt[TimeDt$Name==input$InputTime,'Conversion'] ,
                                       " ", TimeDt[TimeDt$Name==input$OutputTime,'Plural'])}
    )
    
    output$iuVolume <- renderText({paste("1 ", input$InputVolume, " is equivalent to ",
                                         VolumeDt[VolumeDt$Name==input$OutputVolume,'Conversion'] / 
                                           VolumeDt[VolumeDt$Name==input$InputVolume,'Conversion'] ,
                                         " ", VolumeDt[VolumeDt$Name==input$OutputVolume,'Plural'])}
    )
  }
  
  
)


