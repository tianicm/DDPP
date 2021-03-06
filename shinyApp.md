Course Project: Basic Unit Rate converter
========================================================
author: Josiane-Marie S.
date: January 28th, 2016

Introduction
========================================================
In our World, we are called to use many means measurements in different aspects of our everyday lives. I created this sample app that will make it easier for users to quickly find conversion rates for their basic measurement needs.
This app uses reactive output to get the converter Rate without the need to refresh the page or press a submit button.

This presentation is being created as part of the peer assessment for the coursera developing data products class. The project consists in two activities:
- Create a Shiny application
- Create a presentation in Slidify or Rstudio Presenter to pitch for the application.


Unit selection and calculation
========================================================

The created Data frames contain all the information needed for the chosen measurement units. For this application, I have chosen to only use the following basic measurement needs: Mass, Length, Time and Volume. Here is one example of coding for the Mass unit and it's converter Rates: 

```r
Mass <- c("Metric Ton", "Kilogram", "Gram", "Milligram", "Microgram", "Imperial Ton", "US Ton", "Stone", "Pound", "Ounce")
MassPlural <- c("Metric Tons", "Kilograms", "Grams", "Milligrams", "Micrograms", "Imperial Tons", "US Tons", "Stones", "Pounds", "Ounces") 
MassUnit <- c(1e+6,1000,1,0.001,1e-6,1.016e+6,907185,6350.29,453.592,28.3495)
MassDt <- data.frame(Mass,MassPlural,MassUnit)
MassDt
```

```
           Mass    MassPlural    MassUnit
1    Metric Ton   Metric Tons 1.00000e+06
2      Kilogram     Kilograms 1.00000e+03
3          Gram         Grams 1.00000e+00
4     Milligram    Milligrams 1.00000e-03
5     Microgram    Micrograms 1.00000e-06
6  Imperial Ton Imperial Tons 1.01600e+06
7        US Ton       US Tons 9.07185e+05
8         Stone        Stones 6.35029e+03
9         Pound        Pounds 4.53592e+02
10        Ounce        Ounces 2.83495e+01
```


How the converter work?
========================================================
The application was created to easily provide a converter rate for your basic measurement units. All the User has to do is Click on each tab panels (either Mass, Length, Time or Volume), choose two units to convert, and the user should see a displayed result on the main panel for the chosen units. All the results for the chosen measurement units will be displayed on the main panel.

Conclusion and links
========================================================
This Application is very basic for users and easy to use. The application can be further extended with other means of measurement units and its code and be combined to other languages like python or java to create a full Unit converter.Links information for the entire Course Project:

-The link to the App is: http://jmts.shinyapps.io/DDPP/

-Source for the conversion rates: https://www.google.com/webhp?ie=utf-8&oe=utf-8#q=unit+converter


