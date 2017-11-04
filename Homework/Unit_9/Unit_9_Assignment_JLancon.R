
library(knitr)
library(stringr)
library(rvest)
library(ggplot2)

URLMovie <- read_html("http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1")

# From YouTube video https://www.youtube.com/watch?v=gSbuwYdNYLM

Table_Data <- URLMovie %>%
      html_nodes('table') %>% .[[3]] %>%
      html_table()

Actor_Character.df <- Table_Data[,c(2,4)]
colnames(Actor_Character.df) <- c("ActorFullName","Character")

Actor_Character.df <- Actor_Character.df[- grep("Rest of cast listed",Actor_Character.df$ActorFullName),]
Actor_Character.df <- Actor_Character.df[!apply(Actor_Character.df == "",1,all),]
Character.df <- as.data.frame(sapply(Actor_Character.df[,2],gsub,pattern=".*Grip.*",replacement="Griphook / Professor Filius Flitwick"))

#library(stringr)
#Test <- as.data.frame(do.call(rbind, strsplit(Actor_Character_Data$Actor, ' (?=[^ ]+$)', perl=TRUE)))
#colnames(Test) <- c("First Name","Last Name")


First_Surname.df <- as.data.frame(str_split_fixed(Actor_Character.df$ActorFullName, ' (?=[^ ]+$)',2))

FinalList.df <- cbind(First_Surname.df,Character.df)
colnames(FinalList.df) <- c("FirstName", "Surname", "Character")


kable(head(FinalList.df,10), align="c", caption = "Harry Potter and the Deathly Hallows: Part 2\nCast and Character",format="markdown",row.names = FALSE)



#########################################################
#########################################################


# Problem 2

URLSpurs <- read_html('http://www.espn.com/nba/team/stats/_/name/sa/san-antonio-spurs')

Table_Data <- URLSpurs %>%
  html_nodes('table') %>% .[[2]] %>%
  html_table()

Player_FGP.df <- Table_Data[,c(1,4)]

Player_FGP.df <- Player_FGP.df[- grep("Totals",Player_FGP.df$X1),]
Player_FGP.df <- Player_FGP.df[- grep("SHOOTING STATISTICS",Player_FGP.df$X1),]
Player_FGP.df <- Player_FGP.df[- grep("PLAYER",Player_FGP.df$X1),]
FGPercent.df <- as.data.frame(as.numeric(Player_FGP.df$X4))


Player_Position.df <- as.data.frame(str_split_fixed(Player_FGP.df$X1, ' (?=[^ ]+$)',2))
Player_Position.df <- as.data.frame(sapply(Player_Position.df,gsub,pattern=",",replacement=""))

Final.df <- cbind(Player_Position.df,FGPercent.df)
colnames(Final.df) <- c("Player", "Position", "FG_Percent")
Final.df <- Final.df[order(Final.df$FG_Percent, decreasing = TRUE), ]


ggplot(data=Final.df, aes(x=reorder(Player, order(Final.df$FG_Percent, decreasing=FALSE)),y=(FG_Percent*100),fill=Position)) +
  geom_bar(position="dodge",stat="identity") + 
  scale_fill_brewer(palette="Spectral") +
#  scale_fill_hue(c=80, l=60) +
  coord_flip() +
  xlab("Players") +
  ylab("Field Goal Percentage") +
  ggtitle("San Antonio Spurs 2017/18\nField Goal Percentages") +
  theme(plot.title = element_text(hjust = 0.5, face="bold", size=14)) +
  theme(axis.title = element_text(face="bold", size=10)) +
  theme(axis.title.y = element_text(face="bold", size=10)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  theme(plot.margin = unit(c(1,1,1,1), "cm"))
