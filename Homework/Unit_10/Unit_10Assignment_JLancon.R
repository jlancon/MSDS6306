



## Initialize Directories
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

load("./DataSets/N-MHSS-2015-DS0001-data/N-MHSS-2015-DS0001-data-r.rda")

StateTerritory <- unique(mh2015_puf$LST)
StateTerritory


# Veterans Administration Medical Centers #
VACenters <- mh2015_puf[grep("Veteran.",mh2015_puf$FACILITYTYPE),]

VACentersTotal <- VACenters[,c("LST","FACILITYTYPE")]

# Number of facilities in continental US: Removal of HI, AK, GU, AS, PR, VI #
VACentersMainland <- VACentersTotal[- grep("HI|AK|AS|GU|PR|VI",VACentersTotal$LST),]
#str(VACentersMainland)

VACentersMainland$LST <- droplevels(VACentersMainland$LST)
#str(VACentersPar)

VACTable <- as.data.frame(table(VACentersMainland$LST))
VACTable <- VACTable[order(VACTable$Freq, decreasing = FALSE), ]
colnames(VACTable) <- c("States", "Freq")
#str(VACTable)


library(ggplot2)
ggplot(data=VACTable, aes(x=reorder(States, order(VACTable$Freq, decreasing=FALSE)),y=Freq, fill=States)) +
  geom_bar(position="dodge",stat="identity",show.legend=F) + 
  #    scale_colour_gradientn(colours = terrain.colors(10)) +
  coord_flip() +
  xlab("States (Mainland)") +
  ylim(c(0,max(VACTable$Freq+1))) +
  ylab("Number of VA Facilities") +
  ggtitle("Verterans Administration (VA) Medical Centers\n Quantity per State (Mainland US)") +
  theme(plot.title = element_text(hjust = 0.5, face="bold", size=14)) +
  theme(axis.title = element_text(face="bold", size=8)) +
  theme(axis.text.x = element_text(size = 10))+
  theme(axis.text.y = element_text(size=6))+
  theme(axis.title.y = element_text(face="bold", size=10)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  theme(plot.margin = unit(c(0.1,1,1,0.1), "cm"))




#############################################

StateSize <- read.csv('./DataSets/statesize.csv')
colnames(VACTable) <- c('Abbrev','Freq') 
VACTable$Abbrev <- trimws(VACTable$Abbrev)
VAStateInfo <- merge(VACTable,StateSize, by="Abbrev",all=FALSE)

VAStateInfo$Density <- VAStateInfo$Freq / (VAStateInfo$SqMiles/1000)

VAStateInfo <- VAStateInfo[order(VAStateInfo$Density, decreasing = FALSE), ]

ggplot(data=VAStateInfo, aes(x=reorder(Abbrev, order(VAStateInfo$Density, decreasing=FALSE)),y=Density, fill=Region)) +
  geom_bar(position="dodge",stat="identity") +
  scale_fill_brewer(palette="Spectral") +
  coord_flip() +
  xlab("States (Mainland)") +
  ylim(c(0,max(VAStateInfo$Density*1.05))) +
  ylab("VA Facilities per 1000 sqMiles") +
  ggtitle("Verterans Administration (VA) Medical Centers\n Qunatity per State's Area (Mainland US)") +
  theme(plot.title = element_text(hjust = 0.5, face="bold", size=14)) +
  theme(axis.title = element_text(face="bold", size=10)) +
  theme(axis.title.y = element_text(face="bold", size=10)) +
  theme(axis.text.x = element_text(size = 10))+
  theme(axis.text.y = element_text(size=6))+
  theme(panel.border = element_rect(linetype = "solid", fill = NA)) +
  theme(plot.margin = unit(c(0.5,1,1,0.5), "cm"))






(title <- paste(strwrap(
  "Stopping distance of cars (ft) vs. speed (mph) from Ezekiel (1930)",
  width = 30), collapse = "\n"))
plot(dist ~ speed, cars, main = title)