SMU MSDS 6306: Unit 09 Assignment
====================================
Preparing Data - Website Scrapping
----------------------------------

Date: 07 Nov. 2017
By: Jeffrey Lancon (JLancon@smu.edu)


Scraping webpages and cleaning datasets using any R package you are comfortable with.

First Webpage: IMDB - Harry Potter and the Deathly Hallows: Part 2

We are interested is the table of the Cast in order of crediting.
* Parse down the table to only include the Actor's Name and their corresponding Character in the movie.  
* Clean observation; eliminating empty fields and fields with improper data.  
* One Actor plays two characters, whos character name(s) has special(\n) characters in its description.  Replace his character name, removing special characters, so it displays properly.  
* The Actor variable includes first name and surname.  Split the variable into FirstName and Surname.  Play special attention to multiple names/middle names, etc.  
* Display the first 10 rows of the 'cleaned' dataframe with 3 variables (FirstName, Surname, Character)

Second Webpage: ESPN website - San Antonio Spurs Stats Webpage
* Parse down the table to only include the Player's Name and Field Goal Percentage (FG%).  
* Clean observation; eliminating empty fields and fields with improper data.  
* One Actor plays two characters, whos character name(s) has special(\n) characters in its description.  Replace his character name, removing special characters, so it displays properly.  
* The Player catagory includes the Full Name of player as well as position.  Split the variable into Player Name and Position.  
* Create a 'cleaned' dataset with Player's Name, Position, and Field Goal Percentage
* Create a bar graph displaying Player and their FG%.  Color the columns by the Player's position.
We are interested in **Shooting Statistics** table

Original Data
---------------
The original data was scrapped from the following webpages:
 
- [Harry Potter and the Deathly Hallows: Part 2](http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1)

- [San Antonio Spurs Stats](http://www.espn.com/nba/team/stats/_/name/sa/san-antonio-spurs)
