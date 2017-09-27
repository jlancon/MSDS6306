
DataURL <- "https://github.com/fivethirtyeight/data/blob/master/congress-age/congress-terms.csv"

# 1b
data(package = "fivethirtyeight")


df <- fivethirtyeight::college_recent_grads
head(df)

# 1c


??fivethrityeight
vignette("fivethirtyeight")


# https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/

#1d

dim(df)
names(df)

#2a
names(df)
length(names(df)) #could also use ncol(df)

major_count_table <- table(df$major_category)
major_count <- as.data.frame(major_count)
major_count

par(las=2)
barplot(major_count_table[order(major_count_table,decreasing=TRUE)],
        horiz = TRUE,
        main="College Majors\n Major Catagories-Degree Programs",
        xlab="Number of Degree Programs",
        ylab="Major Catagories",
        las=1,
        xlim = c(0,max(major_count_table, na.rm=TRUE)+2),
        cex.lab = .9,
        cex.names = 0.8,
        mgp[2:3]<-c(4,4,1),
        col='lightblue'
)

?boxplot()
??mgp

write.csv(df,file="C:/Users/Prodigy/Documents/Personal Info/SMU/MSDS 6306 - Doing Data Science/Unit 4/Assignment/College_Recent_Grads.csv", row.names = FALSE)

