CodeBook for MSDS6306 Unit 5 Assignment
=======================================

Data source
-----------
The datasets were provided to the class by the instructor: Original data was obtained from US Social Security Administration. https://www.ssa.gov/oact/babynames/names.zip  
yob2016.txt NOTE: This database was altered from the original: (1) Added false entry Fionayyy; (2) Changed sep=";" from ",".  
yob2015.txt Unchanged from original file


Feature Selection 
-----------------
A client is expecting a baby soon and he is not sure what to name the child.  The obtain a list of the top 10 Female baby names from the combined years of 2015 and 2016 and present the client with the list. The text data files were obtained from the US Social Security Administration. And there you will find the follow description:

To safeguard privacy, we [SSA] exclude from these files certain names that would indicate, or would allow the ability to determine, names with fewer than 5 occurrences in any geographic area. We provide these data on both a national and state-specific basis, in two separate collections of files, each zipped into a single file. The format of the data in the two files is described in a "readme" file contained in the respective zip files.  

Using R, the tasks were to:
* Tidy and merge the two data files by Names
* Total the unique occurrances of each name (2015 & 2016) [33063 in 2015, 32868 in 2016]
* Rank the names by decending order of Total occurrances [7.4Million]
* Eliminate Male names
* Create a CSV file with the top 10 Females names in 2015 & 2016 combined and number of occurrances [Most_Popular_Female_Names.csv].

Tidying the data: consisted of removing duplicate entry (Fionayyy), merging the two files yob2015 and yob2016 by name and gender, and removal of names that did not appear in both 2015 and 2016.

Totaling occurrances consisted of summing frequency of occurrances of names from 2015 and 2016.

Arranged the list of names by total frequency of occurrances in decending order.

Eliminated Male names since client is only interested in Female names.

Created a CSV file of the top 10 Female names in 2015/2016 and frequency of occurrances.

Listing of key variables and brief descriptions:

yob2016 Variables 
* FirstName       _First name of subject in yob2016 dataset_   
* Gender          _Gender of subject (M-Male/F-Female)_
* Frequency_2016  _Frequency of FirstName Occurrance in 2016_  

yob2015 Variables
* FirstName       _First name of subject in yob2015 dataset_
* Gender          _Gender of subject (M-Male/F-Female)_
* Frequency_2015  _Frequency of FirstName Occurrance in 2015_

Derrived Variables:
* df  _DataFrame with yob2016 variables & occurances_  
* DuplicateName     _Duplicate name entry (artifically inserted into raw file)_
* Final _DataFrame containing final output variable list and occurrances of top 10 female names/occurances_
* Final$Total _Final dataframe variable which totals number of occurances of particular name in Ferquency_2015 and Frequency_2016_
* SumTotal _Total of all frequency of occurrances for all observations_
* FinalFemale _Dataframe containing final values of top 10 Female names and Totals_

Final Deliverable 
-----------------

Deliverable: **Most_Popular_Female_Names.csv**  
CSV file with the top 10 Females names in 2015 & 2016 combined and number of occurrances.
