NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

years <- c(1999, 2002, 2005, 2008)

x <- numeric()

options(scipen=999) # To remove scientific notations

for (i in years){
        x <- c(x, sum(NEI[NEI$year == i,]$Emissions))
}

png("plot1.png")

plot(years, x, type = "l", 
     main = expression("Total PM"[2.5]*" Emissions by Year"), xlab = "Year", 
     ylab = expression("PM"[2.5]*" Emissions in Tons"))

dev.off()