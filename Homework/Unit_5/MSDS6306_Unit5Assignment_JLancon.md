# MSDS 6306 Unit 5 Assignment
J Lancon  
October 4, 2017  


## MSDS 6306: Doing Data Science - Tidy Data

#### BackStory  
Your client is expecting a baby soon. However, he is not sure what to name the child. Being out of the loop, he hires you to help him figure out popular names.  He provides for you raw data in order to help you make a decision.  

### Question 1  
#### **Data Munging**  
Utilize yob2016.txt for this question. This file is a series of popular children's names born in the year 2016 in the United States. It consist of three columns with a first name, a gender, and the amount of children given that name.  HOwever, the data is raw and will need cleaning to make it tidy and usable.  

#### 1.a  
First, Import the .txt file into R so you can process it. Keep in mind this is not a CSV file. You might have to open the file to see what you're dealing with. Assign the resulting data fram to an object, **df**, that consist of three columns with human readable column names for each.

```r
# Loading data file yob2016.txt
# Had to specifically specify First name as character varialbe: 3 variables[FirstName Gender Frequency] and 32869 observations

df <- read.table("C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/yob2016.txt",sep=";",col.names=c("FirstName","Gender","Frequency_2016"),as.is="FirstName")
```
#### 1.b
Display the summary and structure of **df**.

```r
#Display summary and structure of df
str(df)
```

```
## 'data.frame':	32869 obs. of  3 variables:
##  $ FirstName     : chr  "Emma" "Olivia" "Ava" "Sophia" ...
##  $ Gender        : Factor w/ 2 levels "F","M": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Frequency_2016: int  19414 19246 16237 16070 14722 14366 13030 11699 10926 10733 ...
```

```r
summary(df)
```

```
##   FirstName         Gender    Frequency_2016   
##  Length:32869       F:18758   Min.   :    5.0  
##  Class :character   M:14111   1st Qu.:    7.0  
##  Mode  :character             Median :   12.0  
##                               Mean   :  110.7  
##                               3rd Qu.:   30.0  
##                               Max.   :19414.0
```

```r
# dim(df)
# head(df,8)
```

#### 1.c  
Your client tells you that there is a problem with the raw file. One name was entered twice and misspelled.  The client cannot remember which name it is; there are thousands he saw! But he did mention he accidentally put 3 y's at the end of the name.  Write an R command to figure out which name it is and display it.

```r
# identify duplicate entry with yyy at the end of the name and display it.
DuplicateName <- df$FirstName[grep(".y{3}$",df$FirstName)]
DuplicateName
```

```
## [1] "Fionayyy"
```

#### 1.d  
Upon finding the misspelled name, please remove this particular observation, as the client says it's redundant. Save the remaining database as an object: **y2016**

```r
# Removing duplicate name and creating dataframe y2016. Note: y2016 has one less observation: 32868

y2016 <- subset(x=df, df$FirstName != DuplicateName)
dim(y2016)
```

```
## [1] 32868     3
```
Note: y2016 has one less observation that original df(32868 vs 32869).  

### Question 2
Utilize yob2015.txt for this question. This file is similar to yob2016, but contains names,gender, and total children given that name for the year 2015.

#### 2.a
Like **1.a**, please import the .txt file into R. Look at the file before you do. You might have to change some options to import it properly. Again, please give the dataframe human readable column names. Assign the dataframe to **y2015**.

```r
# Reading 2015 baby name text file yob2015.txt and assign it to y2015 data frame;
# Had to specifically specify First name as character varialbe: 3 variables[FirstName Gender Frequency_2015] and 33063 observations
y2015 <- read.table("C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/yob2015.txt",sep=",",col.names=c("FirstName","Gender","Frequency_2015"),as.is="FirstName")
#str(y2015)
```
#### 2.b
Display the last 10 rows in the dataframe. Describe something you find interested about these 10 rows.

```r
tail(y2015,10)
```

```
##       FirstName Gender Frequency_2015
## 33054      Ziyu      M              5
## 33055      Zoel      M              5
## 33056     Zohar      M              5
## 33057    Zolton      M              5
## 33058      Zyah      M              5
## 33059    Zykell      M              5
## 33060    Zyking      M              5
## 33061     Zykir      M              5
## 33062     Zyrus      M              5
## 33063      Zyus      M              5
```
One interesting fact about the last 10 entries in the 2015 child name database is that they are all males.  

#### 2.c
Merge **y2016** and **y2015** by your Name column; Assign it to **Final**. The client only cares about names that have data for both 2016 and 2015; there should be no NA values in either of your amount of children rows after merging.

```r
# Merging y2016 and y2015 by=first name and gender; assigning df to Final
Final <- merge(x=y2016,y=y2015, union("FirstName","Gender"),all=TRUE)

# Removing NA values in data frame 
Final <- na.omit(Final)

#########################
# Alternate way to remove NA values
# Final <- Final[complete.cases(Final[,3:4]),]
# Final <- subset(x=Final,!is.na(Final$Frequency_2015))
########################
```

#### Question 3
Utilize your dataframe object **Final** for this part.  

#### 3.a
Create a new column called "Total"" in **Final** that adds the amount of children in 2015 and 2016 together. In those two years combined, how many people were given popular names

```r
# Creating new variable in 'Final' called Total. Total will be a summation of Frequency_2015 and Frequency_2016 
Final$Total <- rowSums(Final[,3:4]) #Can also use apply functions

# Creating Sum of new Total column and assigning value to SumTotal and displaying value.
SumTotal <- sum(Final$Total)
SumTotal
```

```
## [1] 7239231
```
There were 7.24M babies given names in 2015 & 2016 that appear on this list.  

#### 3.b
Sort the data by Total. What are the top 10 most popular names?  

```r
#Sorting Final Dataframe in decending order by "Total" column
Final <- Final[order(-Final[,"Total"]),]

#Displaying to 10 names by popularity
head(Final,10)
```

```
##       FirstName Gender Frequency_2016 Frequency_2015 Total
## 12027      Emma      F          19414          20415 39829
## 29240    Olivia      F          19246          19638 38884
## 28798      Noah      M          19015          19594 38609
## 23620      Liam      M          18138          18330 36468
## 34320    Sophia      F          16070          17381 33451
## 4759        Ava      F          16237          16340 32577
## 25956     Mason      M          15192          16591 31783
## 37328   William      M          15668          15863 31531
## 15977     Jacob      M          14416          15914 30330
## 15521  Isabella      F          14722          15574 30296
```

#### 3.c
The client is expecting a girl! Omit boys and give the top 10 most popular girl's names.  


```r
#Creat new Dataframe called FinalFemale and include only Female names.
FinalFemale <- subset(x=Final, Final$Gender=="F")

#Displaying to 10 Females names for 2015&2016 combined.
FinalFemale[1:10,]
```

```
##       FirstName Gender Frequency_2016 Frequency_2015 Total
## 12027      Emma      F          19414          20415 39829
## 29240    Olivia      F          19246          19638 38884
## 34320    Sophia      F          16070          17381 33451
## 4759        Ava      F          16237          16340 32577
## 15521  Isabella      F          14722          15574 30296
## 26751       Mia      F          14366          14871 29237
## 7961  Charlotte      F          13030          11381 24411
## 428     Abigail      F          11699          12371 24070
## 12001     Emily      F          10926          11766 22692
## 14502    Harper      F          10733          10283 21016
```
####3.d
Write these top 10 girls names and their Totals to a CSV file. Leave out the other columns entirely.

```r
# Create CSV file that includes the top 10 female names and total number frequency only. Naming file Most_Popular_Female_Names.csv
FinalFemale <- FinalFemale[1:10,c(1,5)]
write.csv(FinalFemale,file="C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/Most_Popular_Female_Names.csv", row.names = FALSE)
```

#### Question 4
Upload to GitHub: Push at mimimum your RMarkdown for this homework assignment and a Codebook to one of your GitHub repositories (you might place this in a Homework repo like last week.)  The CodeBook should contain a short definition of each object your create, and if creating multiple files, which file it is contained in. You are welcome and encouraged to add other files-just make sure you have a description and directions that are helpful for the grader.

####GitHub URL Address


####Reminder
To complete this assignment, please submit **one** RMarkdown and matching HTML file at least one hour before your live session on October 9,2017. You do not need to submit a link to your GitHub: Just note where the assignment is (URL) in your RMarkdown file.  Make sure it is public!! Please submit all files at the same time; only one submission is granted.





