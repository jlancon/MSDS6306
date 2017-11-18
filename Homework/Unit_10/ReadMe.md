SMU MSDS 6306: Unit 10 Assignment
====================================
Exploratory Data
----------------------------------

Date: 19 Nov. 2017
By: Jeffrey Lancon (JLancon@smu.edu)

Problem #1: Your organization is responsible for building new VA hospitals in the mainland of the United States. Begin by exploring the Substance Abuse Health Services Survey 2015.
The National Mental Health Services Survey (N-MHSS) is an annual survey designed to collect statistical information on the numbers and characteristics of all known mental health treatment facilities within the 50 States, the District of Columbia, and the U.S. territories.  

Navigate to [Substance Abuse & Mental Health website's Data Archieves](https://datafiles.samhsa.gov/study-dataset/national-mental-health-services-survey-2015-n-mhss-2015-ds0001-nid17098). Download the 2015 survey (N-MHSS-2015-DS0001).

* Review Codebook PDF for explanation of variables.
* Import survey dataset and parse down the dataset to only include pertinent variables.  
* Clean observation; eliminating empty fields and fields with improper data.  
* Create and display a list of all US states/territories that contain facilities that participated in the survey.  
* We are only interested in VA hospitals; therfore, filter data to only include Verterans Administration (VA) Medical Centers.  
* Filter the data further, including only mainland locations: Alaska, Hawaii, and US territories should be omitted.  
* Create a barchart using filtered dataset. Vary bar colors by state.

** Problem #2:** These results may be misleading, as bigger states may have more hospitals.  To normalize the data, below is a bar chart depicting the number of VA hospitals per 1000 square miles of state territory.  
An additional dataset, statesize.csv will be merged with parsed dataset.  This new dataset includes a variable for amount of land area in each state.

* Import statesize dataset.  
* Clean observation; eliminating empty fields, fields with improper data.  
* Formatting observations (State Abbreviations); standarizing observations for properly merging datasets. 
* Create a barchart using filtered dataset. Vary bar colors by Regions.

Original Data
---------------
The original data was scrapped from the following webpages:
 
- [Substance Abuse & Mental Health website's Data Archieves](https://datafiles.samhsa.gov/study-dataset/national-mental-health-services-survey-2015-n-mhss-2015-ds0001-nid17098). Download the 2015 survey (N-MHSS-2015-DS0001)

- statesize.csv
