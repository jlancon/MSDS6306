df <- read.table("C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/yob2016.txt",sep=";",col.names=c("FirstName","Gender","Frequency_2016"),as.is="FirstName")
str(df)
summary(df)
head(df,8)
dim(df)

DuplicateName <- df$FirstName[grep(".y{3}$",df$FirstName)]
DuplicateName
y2016 <- subset(x=df, df$FirstName != DuplicateName)
dim(y2016)



y2015 <- read.table("C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/yob2015.txt",sep=",",col.names=c("FirstName","Gender","Frequency_2015"),as.is="FirstName")
str(y2015)
tail(y2015,10)

Final <- merge(x=y2016,y=y2015, union("FirstName","Gender"),all=TRUE)
Final <- na.omit(Final)
# Final <- final[complete.cases(final[,3:4]),]
# Final <- subset(x=Final,!is.na(final$Frequency_2015))



Final$Total <- rowSums(Final[,3:4]) #Can also use apply functions

Final <- Final[order(-Final[,"Total"]),]
head(Final,10)

FinalFemale <- subset(x=Final, Final$Gender=="F")
FinalFemale[1:10,]

FinalFemale <- FinalFemale[1:10,c(1,5)]
write.csv(FinalFemale,file="C:/Users/Prodigy/Documents/GitRepositories/MSDS6306/Homework/Unit_5/Most_Popular_Female_Names.csv", row.names = FALSE)
