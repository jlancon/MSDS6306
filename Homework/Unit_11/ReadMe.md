SMU MSDS 6306: Unit 11 Assignment
====================================
Exploratory Data
----------------------------------

Date: 27 Nov. 2017
By: Jeffrey Lancon (JLancon@smu.edu)

**Problem #1:** You have access to sample datasets of prominent stocks in R. We are using EuStockMarkets for this exercise.  
The dataset has daily closing prices of Major European Stock Indices, 1991-1998: Germany DAX (Ibis), Switzerland SMI, France CAC, and UK FTSE. From this dataset, pull specifically the DAX index. Additional information about this dataset from ??EuStockMarkets.  

* We are interested in German DAX index; therfore, filter data to only include this dataset.  
* Create a plot of the dataset.  
* In 1997, an event happened that is worth noting; add a vertical line that notes this date.  
* Decompose the multiplicative time series into its components (i.e, trend, seasonality, random).
* Create a plot of all decomposed components, noting the same 1997 event.

**Problem #2:** You have access to sample datasets by loading library(fpp2) in R.  
The dataset contains the Maximum annual temperatures (°C) at Moorabbin Airport, Melbourne, from 1971-2016. 

* We are only interested in data post 1990; therfore, filter data to only include this dataset.  
* Create a plot of the dataset.  
* Utilize SES function in R to predict the next five years of maximum temperature at the Moorabbin Airport.  
* Create a plot showing: original data, fitted/predicted values for 1990-2016, and forecasted temperatures for 2017-2021.
* Document AICc value
* Utilize Holt function in R to predict the next five years of maximum temperature at the Moorabbin Airport.  
* Create a plot showing: original data, fitted/predicted values for 1990-2016, and forecasted temperatures for 2017-2021.  
* Document AICc value and compare it against SES prediction model.  

**Problem #3:** Read in two datasets: Unit11TimeSeries_Ollivander.csv and Unit11TimeSeries_Gregorovitch.csv. The datasets contain Wands sold each year between 1970 and 2016.  

The dataset contain Wands sold each year between 1970 and 2016. 

* Load datasets into R.
* Convert datasets to timeseries, which will require date variable formatting [Date class] and creation of xts (time series) object.  
* Bind the two xts object together, to form a single time series object.
* Create a plot, using dygraph function.  
   1. Label graph properly  
   2. Label each Series with proper wand-maker's name.  
   3. Stack the graphs and modify lines using different colors  
   4. Activate range selector  
   5. Use shading to illuminate approximately when Voldemort was revived (1995-1999)  
   6. Enable highlighting on graph.  


Original Data
---------------
The original data are:
 
- Unit11TimeSeries_Ollivander.csv  
- Unit11TimeSeries_Gregorovitch.csv