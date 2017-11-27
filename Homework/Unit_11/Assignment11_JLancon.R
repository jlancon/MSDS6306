## Initialize Directories
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(fpp2)
library(ggplot2)
library(forecast)
library(xts)
library(dygraphs)


eu_stocks <- EuStockMarkets[,"DAX"]
start(eu_stocks)
end(eu_stocks)
frequency(eu_stocks)
head(eu_stocks)

autoplot(eu_stocks,
    main='DAX Closing Prices 1990-1998',
    xlab='Years',
    ylab='DAX Index\n Daily Closing Value',
    col='blue',
    cex.lab = .9)+
    theme(plot.title = element_text(hjust = 0.5, face="bold", size=14)) +
    geom_line(linetype="solid", color="blue", size=.5)+
    geom_vline(xintercept = 1997, col="red")


decompDAX <- decompose(eu_stocks, type=c("multiplicative"))
autoplot(decompDAX)+
  geom_line(linetype="solid", color="blue", size=.5)+
  geom_vline(xintercept = 1997, col="red")+
  theme(axis.title = element_text(face="bold", size=8))


# Problem #2


#help(maxtemp)
#start(maxtemp)
#end(maxtemp)
#frequency(maxtemp)

# 2b
Maxtemp.Post1990 <- window(maxtemp, 1990)
#str(Maxtemp.Post1990)
#class(Maxtemp.Post1990)
#head(Maxtemp.Post1990)

# 2c
Maxtemp.fcast <- ses(Maxtemp.Post1990, h=5)
plot(Maxtemp.fcast,
     main='Max Temperature - Melbourne 1990-2016\n5 yr Forecast (SES)',
     xlab='Years',
     ylab='Max Temperature °C',
     col='blue',
     cex.lab = .9)
  lines(fitted(Maxtemp.fcast), col='Blue')
  lines(Maxtemp.Post1990, col='black')


#summary(Maxtemp.fcast)
Maxtemp.fcast.factors <- Maxtemp.fcast$model["aicc"]
Maxtemp.fcast.factors


# 2d
MaxtempHW <- holt(Maxtemp.Post1990, h=5, damped= TRUE, initial="optimal", seasonal =c("multi"))

plot(MaxtempHW,
     main='Max Temperature - Melbourne 1990-2016\n5 yr Forecast (Damped Holt Method)',
     xlab='Years',
     ylab='Max Temperature °C',
     col='blue',
     cex.lab = .9)
 lines(Maxtemp.Post1990,col='Black')
 lines(MaxtempHW$fitted, col = 'Blue')


# 2e
MaxtempHW.factors <- MaxtempHW$model["aicc"]
MaxtempHW.factors

??EuStockMarkets()

#3

# 3a
Greg <- read.csv("Unit11TimeSeries_Gregorovitch.csv", header = FALSE)
Olliv <-read.csv("Unit11TimeSeries_Ollivander.csv", header = FALSE)

# 3b
Greg$V1 <- as.Date(Greg$V1,format="%m/%d/%Y")
#str(Greg)
Olliv$V1 <- as.Date(Olliv$V1,format="%m/%d/%Y")
#str(Olliv)

Greg.ts <- xts::xts(Greg, frequency=1, order.by = Greg$V1)
colnames(Greg.ts) <- c("Year","Gregorovitch")
#str(Greg.ts)

Olliv.ts <- xts::xts(Olliv, frequency=1, order.by = Olliv$V1)
colnames(Olliv.ts) <- c("Year","Ollivander")
#str(Olliv.ts)

WandSales.ts <-cbind.xts(Olliv.ts$Ollivander,Greg.ts$Gregorovitch)
dygraph(WandSales.ts, main="Wand Sales 1970 - 2016", ylab="Sales", xlab="Year") %>%
  dySeries("Gregorovitch", color = 'Red') %>%
  dySeries("Ollivander", color = 'Green') %>%
  dyRangeSelector(height=80) %>%
  dyShading(from = "1995-01-01", to = "1999-01-01", color = "lightblue") %>%
  dyHighlight(highlightSeriesOpts = list(strokeWidth=1.5))