NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

years <- c(1999, 2002, 2005, 2008)

x <- numeric()
t<-NEI[NEI$fips == "24510",]

options(scipen=999)

for (i in years){
        x <- c(x, sum(t[t$year == i,]$Emissions, 
                      na.rm = TRUE))
}


png("plot2.png")

plot(years, x, type = "l", 
     main = expression("Total PM"[2.5]*" Emissions by Year for Baltimore"), 
     xlab = "Year", ylab = expression("PM"[2.5]*" Emissions in Tons"))

dev.off()